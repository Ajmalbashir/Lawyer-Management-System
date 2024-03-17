<?php
    include '../admin/config.php';
    session_start();
    if (!isset($_SESSION['front_user'])) {
        header("Location: login.php"); 
        exit();
    } else {
        // Fetch the status for each client
        $stmt = $pdo->query("SELECT * FROM `tbl_approval`");
        $all_clients = $stmt->fetchAll(PDO::FETCH_ASSOC);
        // var_dump($all_clients);exit;
    }
?>

<!-- Page Content -->
<?php include 'header.php'?>

<div class="container-full">
    <div class="msg"></div>
    <div class="row">
        <div class="col-md-6">
            <h2>My Clients</h2>
        </div>

        <div id="msg"></div>
    </div>
</div>

<table id="data_table" class="table table-striped table-bordered" style="width:100%">
    <thead>
        <th>id</th>
        <th>Book ID</th>
        <th>Image</th>
        <th>Email</th>
        <th>Status</th>
        <th>Action</th>
    </thead>
    <tbody>
    <?php if($all_clients): ?>
        <?php foreach ($all_clients as $client): ?>
            <tr>
                <td><?php echo $client['id']; ?></td>
                <td><?php echo $client['book_id']; ?></td>
                <td><img src="<?php echo PHOTO_URL ?><?php echo $client['image']; ?>" alt="Image"></td>
                <td><?php echo $client['email']; ?></td>
                <td>
                    <?php if($client['status'] == 0): ?> 
                        <span class="badge badge-warning">Pending</span>
                    <?php else: ?> 
                        <span class="badge badge-success">Approved</span>
                    <?php endif; ?>
                </td>
                <td>
                <?php if($client['status'] == 0): ?> 
                    <button class="btn btn-success accept-btn" data-book-id="<?php echo $client['book_id']; ?>">Accept Request</button>
                <?php endif; ?> 
                </td>
            </tr>
        <?php endforeach; ?>
    <?php endif; ?>
</tbody>
</table>

<?php include 'footer.php'?>

<script>

    $(document).ready(function() {
        $('.accept-btn').on('click', function() {
            var bookId = $(this).data('book-id');
            var button = $(this); // Reference to the button clicked
            acceptClientRequest(bookId, button);
        });

        function acceptClientRequest(bookId, button) {
            // console.log(bookId); return false;
            $.ajax({
                url: 'action.php',
                method: 'POST',
                data: { action: 'accept_request', bookId: bookId },
                success: function(response) {
                    var result = JSON.parse(response);
                    if (result.success) {
                        button.prop('disabled', true);
                        $('#msg').html('<p class="alert alert-success">' + result.msg + '</p>');
                        setTimeout(function() {
                            $('#msg').html('');
                        }, 3000);
                        window.location.reload();
                    } else {
                        $('#msg').html('<p class="alert alert-danger">' + result.msg + '</p>');
                        setTimeout(function() {
                            $('#msg').html('');
                        }, 3000);
                    }
                },
                error: function(xhr, status, error) {
                    // Handle AJAX error
                    console.error('Error:', error);
                }
            });
        }
    });
</script>


</body>
</html>
