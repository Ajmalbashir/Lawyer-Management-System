<!-- Logic -->
<?php
    include '../admin/config.php';
    session_start();
    if (!isset($_SESSION['front_user'])) {
        header("Location: login.php"); 
        exit();
    }else{
        $stmt = $pdo->prepare("SELECT * FROM tbl_library_categories");
        $stmt->execute();
        $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
        // var_dump($categories[0]['id']);exit;
    }
?>

<!-- Page Content -->
<?php include 'header.php'?>

        <div class="container-full">
            <div class="msg"></div>
            <div class="row">
                <div class="col-md-6">
                    <h2>E-Library's Books</h2>
                </div>
                <div class="col-md-6 text-right">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addBookModal">Add New Books</button>
                </div>
            </div>
        </div>

        <table id="data_table" class="table table-striped table-bordered">
            <thead>
                <th>id</th>
                <th>Books Name</th>
                <th>Thumbnail Image</th>
                <th>Author Name</th>
                <th>Description</th>
            </thead>
            <tbody>
                
            </tbody>
        </table>

        <!-- add modal -->
        <div class="modal fade" id="addBookModal" tabindex="-1" role="dialog" aria-labelledby="addAppointmentModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addAppointmentModalLabel">Add New Book</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- Form for adding new book -->
                        <form id="addBookForm">
                            <div id="msg"></div>
                            <div class="form-group">
                                <label for="name">Book Name</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="pdf_file">PDF File</label>
                                <input type="file" class="form-control-file" id="pdf_file" name="pdf_file" accept=".pdf" required>
                            </div>
                            <div class="form-group">
                                <label for="image">Thumbnail Image</label>
                                <input type="file" class="form-control-file" id="image" name="image" accept="image/*" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="categories">Categories Name</label>
                                <select class="form-control" id="category_id" name="category_id" required>
                                    <option value="">Select Categories</option>
                                    <?php
                                    $stmt = $pdo->prepare("SELECT * FROM tbl_library_categories");
                                    $stmt->execute();
                                    $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
                                    foreach ($categories as $category): ?>
                                        <option value="<?php echo $category['id']; ?>" data-category-id="<?php echo $category['id']; ?>"><?php echo $category['category_name']; ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price_type">Price Type</label>
                                <select class="form-control" id="price_type" name="price_type" required>
                                    <option value="">Select Price Type</option>
                                    <option value="paid">Paid</option>
                                    <option value="free">Free</option>
                                </select>
                            </div>

                            <div class="form-group" id="price_field">
                                <label for="price">Price</label>
                                <input type="text" class="form-control" id="price" name="price" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" name="add_book" class="btn btn-primary" onclick="addBook(event)">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- end add modal -->


<?php include 'footer.php'?>
<script>
    $(document).ready(function(){
        getAllBooks();
    });


   function getAllBooks() {
    // alert('sdjbw');
    var photo_url = "<?php echo PHOTO_URL; ?>";
    $.ajax({
        url: 'action.php',
        method: 'POST',
        data: { action: 'get_all_Books_data' },
        success: function(response) {
            var response = JSON.parse(response);
            var books = response.msg;
            if (response.success == true) {
                $('#data_table tbody').empty();
                books.forEach(function(response) {
                    console.log(response);
                    var row = '<tr>' +
                        '<td>' + response.id + '</td>' +
                        '<td>' + response.name + '</td>' +
                        '<td><img src="' + photo_url + response.image + '" alt="Thumbnail Image"></td>' +
                        '<td>' + response.author + '</td>' +
                        '<td>' + response.description + '</td>' +
                        '</tr>';
                    $('#data_table tbody').append(row);
                });
            }
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
        }
    });
}


function addBook(event) {
    event.preventDefault();

    var name = $('#name').val();
    var pdf_file = $('#pdf_file')[0].files[0];
    var image = $('#image')[0].files[0];
    var category_id = $('#category_id option:selected').data('category-id');
    var description = $('#description').val();
    var price = null;

    // Check the selected price type
    var priceType = $('#price_type').val();
    if (priceType === 'paid') {
        price = $('#price').val();
    }

    var formData = new FormData();
    formData.append('name', name);
    formData.append('pdf_file', pdf_file);
    formData.append('image', image);
    formData.append('category_id', category_id);
    formData.append('description', description);
    formData.append('price_type', priceType);
    formData.append('price', price); // Append price parameter
    formData.append('action', 'insert_books'); // Append action parameter

    $.ajax({
        url: 'action.php',
        method: 'POST',
        data: formData,
        contentType: false, 
        processData: false,
        success: function(response) {
        var response = JSON.parse(response);
            if (response && response.success === true) {
                console.log('Success');
                $('#addBookForm')[0].reset();
                $('#addBookModal').modal('hide');
                $('.msg').html('<p class="alert alert-success">' + response.message + '</p>');
                setTimeout(function() {
                    $('.msg').html('');
                }, 3000);
            } else {
                console.log('Error');
                $('#addBookModal').modal('hide');
                $('.msg').html('<p class="alert alert-danger">' + response.message + '</p>');
                setTimeout(function() {
                    $('.msg').html('');
                }, 3000);
            }
        },
        error: function(xhr, status, error) {
            // Handle errors
            console.error(xhr.responseText);
        }
    });
}

$('#price_type').change(function() {
    if ($(this).val() === 'free' || $(this).val() === '') {
        $('#price_field').hide();
    } else {
        $('#price_field').show();
    }
});
// Initially hide the price field
$('#price_field').hide();







</script>
</body>
</html>