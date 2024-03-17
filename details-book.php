<?php require_once('header.php'); ?>

<div class="container">
    <div class="row">
        <div class="col-md-9">
            <?php 
            if(isset($_GET['id'])) {
                $book_id = $_GET['id'];
                // var_dump($book_id);
                $stmt = $pdo->prepare("SELECT * FROM tbl_library WHERE id = ?");
                $stmt->execute([$book_id]);
                $book = $stmt->fetch(PDO::FETCH_ASSOC);
                if($book) {
                    ?>
                    <div class="vip-card">
                    	<div id="msg"></div>
                        <div class="vip-card-container">
                            <div class="vip-card-image">
                                <img src="<?php echo PHOTO_URL ?><?php echo $book['image'] ?>" alt="Book Image">
                            </div>
                            <div class="vip-card-details">
                                <h2><?php echo $book['name']; ?></h2>
                                <p>Author: <?php echo $book['author']; ?></p>
                                <p>Description: <?php echo $book['description']; ?></p>
                                <p>Category: <?php echo $book['category_id']; ?></p>
                                <?php if($book['price'] != null){?>
                                <p>Price: <?php echo $book['price']; ?></p>
                                <div class="btn-group" role="group" aria-label="Download Options">
                                    <button type="button" class="btn btn-primary request-for-approve-btn" data-toggle="modal" data-target="#requestForApproveModal" data-book-id="<?php echo $book['id']; ?>">Request to Purchase</button>
                                </div>
                            <?php }?>
                            </div>
                        </div>
                    </div>
                    <?php
                } else {
                    echo "<p>Book not found</p>";
                }
            } else {
                echo "<p>Book ID is missing</p>";
            }
            ?>
        </div>
    </div>
</div>

<!-- Modal for Request For Approve -->
<div class="modal fade" id="requestForApproveModal" tabindex="-1" role="dialog" aria-labelledby="requestForApproveModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="requestForApproveModalLabel">Request to Purchase: Submit your payment proof and email for approval. Upload an image of your payment and provide your email address to complete the transaction.</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="requestForApproveForm" enctype="multipart/form-data">
                    <input type="hidden" id="bookId" name="bookId">
                    <div class="form-group">
                        <label for="image">Payment Proof</label>
                        <input type="file" class="form-control-file" id="image" name="image" accept="image/*" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</div>


<?php require_once('footer.php'); ?>


<script>
     $(document).ready(function() {
        $('.request-for-approve-btn').click(function() {
            var bookId = $(this).data('book-id');
            $('#bookId').val(bookId); 
        });

        $('#requestForApproveForm').submit(function(event) {
                event.preventDefault();
                var base_url = "<?php echo BASE_URL; ?>";                
                var bookId = $('#bookId').val();
                var imgFile = $('#image')[0].files[0];
                var email = $('#email').val();
                var formData = new FormData();
                
                formData.append('bookId', bookId);
                formData.append('image', imgFile);
                formData.append('email', email);
                formData.append('action', 'approval');                 
                $.ajax({
                    url: base_url + 'action.php',
                    method: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        var response = JSON.parse(response);
					    if (response && response.success === true) {
					        console.log('Success');
					        $('#requestForApproveForm')[0].reset();
					        $('#requestForApproveModal').modal('hide');
					         $('.request-for-approve-btn').hide();
					        $('#msg').html('<p class="alert alert-success">' + response.message + '</p>');
					        setTimeout(function() {
					            $('#msg').html('');
					        }, 3000);
					    } else {
					        console.log('Error');
					        $('#requestForApproveModal').modal('hide');
					        $('#msg').html('<p class="alert alert-danger">' + response.message + '</p>');
					        setTimeout(function() {
					            $('#msg').html('');
					        }, 3000);
					    }
					},
                    error: function(xhr, status, error) {
                        // Handle errors
                        console.error(xhr.responseText);
                    }
                });
            });

    });
</script>