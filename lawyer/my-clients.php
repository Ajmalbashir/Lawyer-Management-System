<!-- Logic -->
<?php
    include '../admin/config.php';
    session_start();
    if (!isset($_SESSION['front_lawyer'])) {
        header("Location: login.php"); 
        exit();
    } else {
        $query = $pdo->prepare("SELECT u.*
                                FROM tbl_client c
                                INNER JOIN tbl_user u ON c.client_id = u.id
                                WHERE c.lawyer_id = :lawyer_id
                                AND u.status = 'Active'");
        $query->execute(['lawyer_id' => $_SESSION['front_lawyer']['id']]);
        $all_clients = $query->fetchAll(PDO::FETCH_ASSOC);

        // Fetch the status for each client
        $stmt = $pdo->query("SELECT * FROM `tbl_client`");
        $statuses = $stmt->fetchAll(PDO::FETCH_ASSOC);
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
        <th>Full Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Action</th>
    </thead>
    <tbody>
        <?php if($all_clients): ?>
            <?php foreach ($all_clients as $client): ?>
                <tr>
                    <td><?php echo $client['id']; ?></td>
                    <td><?php echo $client['full_name']; ?></td>
                    <td><?php echo $client['email']; ?></td>
                    <td><?php echo $client['phone']; ?></td>
                    <?php 
                        // Find the status value for the current client
                        $statusValue = null;
                        foreach ($statuses as $status) {
                            if ($status['client_id'] == $client['id']) {
                                $statusValue = $status['status'];
                                break;
                            }
                        }
                    ?>
                    <td>
                        <?php if ($statusValue === 0): ?>
                            <button class="btn btn-success accept-btn" data-client-id="<?php echo $client['id']; ?>">Accept Request</button>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php else: ?>
            <tr><td colspan="5">No data found</td></tr>
        <?php endif; ?>
    </tbody>
</table>

<?php include 'footer.php'?>

<script>
    $(document).ready(function() {
        $('.accept-btn').on('click', function() {
            var clientId = $(this).data('client-id');
            var button = $(this); // Reference to the button clicked
            acceptClientRequest(clientId, button);
        });

        function acceptClientRequest(clientId, button) {
            console.log(clientId);
            $.ajax({
                url: 'action.php',
                method: 'POST',
                data: { action: 'accept_client_request', clientId: clientId },
                success: function(response) {
                    var result = JSON.parse(response);
                    if (result.success) {
                        button.prop('disabled', true);
                        $('#msg').html('<p class="alert alert-success">' + result.msg + '</p>');
                        setTimeout(function() {
                            $('#msg').html('');
                        }, 3000);
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
