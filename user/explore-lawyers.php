
<?php
    include '../admin/config.php';
    session_start();
    if (!isset($_SESSION['front_user'])) {
        header("Location: login.php"); 
        exit();
    }else{
    	$logged_in_user_id = $_SESSION['front_user']['id'];
    }

    // Set initial limit and offset values
    $limit = 8;
    $offset = 0;
    $all_attorneys = fetchAttorneys($pdo, $limit, $offset, $type='all');
?>


<?php include 'header.php'?>
    <div class="container">
        <div class="row">
            <h4>Explore Lawyers</h4>
        </div>
        <div class="row" id="attorneys-container">
        	<?php if(count($all_attorneys) > 0):?>
            <?php foreach ($all_attorneys as $attorney): ?>
        	<?php $result = checkIfYouAreClientOfThisLawyer($pdo, $attorney['id'], $logged_in_user_id); ?>
                <div class="col-lg-3">
                    <div class="card p-4 mt-2">
                        <img style="width: 230px; height: 120px;" src="<?php echo PHOTO_URL ?><?php echo $attorney['photo'] ?>" class="img-thumbnail">
                        <?php if($result == -1):?>
                        	<button class="btn btn-danger mt-2 be-client-btn" data-logged-in-user-id="<?php echo $logged_in_user_id ?>" data-attorney-id="<?php echo $attorney['id'] ?>">Be a Client</button>
                    	<?php elseif($result == 0): ?>
                    		<button class="btn btn-warning mt-2">Requested</button>
            			<?php else: ?>
                    		<button class="btn btn-success mt-2">Already a Client</button>
            			<?php endif; ?>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
            <div class="msg mt-2"></div>
	        <div class="row">
	        	<div class="col-lg-12 text-center load_more_btn_div">
	            	<button id="load-more-btn" class="btn btn-danger mt-4">Load more</button>
	            </div>
	        </div>
            <?php else: ?>
            	<div class="container">
				<div class="row">
					<div class="col-lg-12 d-flex align-items-center justify-content-center">
						<div class="card p-5">
							<h4 class="text-danger">No lawyers at this moment</h4>
						</div>
					</div>
				</div>
				</div>
            <?php endif; ?>
    </div>

<?php include 'footer.php'?>

<script>
    $(document).ready(function() {
        var limit = <?php echo $limit; ?>;
        var offset = <?php echo $offset; ?>;
        var logged_in_user_id = <?php echo $logged_in_user_id; ?>;
        var loading = false;
        offset += limit;

        function loadMoreAttorneys() {
            if (!loading) {
                loading = true;
                $.ajax({
                    url: 'action.php',
                    method: 'POST',
                    data: { limit: limit, offset: offset, action: 'load_more_lawyers', type: 'all' },
                    success: function(response) {
                        response = JSON.parse(response);
                        if (response.success == true) {
                            var attorneys = response.msg;
                            console.log(attorneys);
                            var html = '';
                            attorneys.forEach(function(attorney) {
                                html += '<div class="col-lg-3">';
                                html += '<div class="card p-4 mt-2">';
                                html += '<img style="width: 300px; height: 150px;" src="<?php echo PHOTO_URL ?>' + attorney.photo + '" class="img-thumbnail">';
                                if(attorney.check_if_client == -1){
                                    html += '<button class="btn btn-danger mt-2 be-client-btn" data-logged-in-user-id="<?php echo $logged_in_user_id ?>" data-attorney-id="' + attorney.id + '">Be a client</button>';
                                }else if(attorney.check_if_client == 0){
                                    html += '<button class="btn btn-warning mt-2" disabled>Requested</button>';
                                }else{
                                    html += '<button class="btn btn-success mt-2">Already a Client</button>';
                                }
                                html += '</div>';
                                html += '</div>';
                            });
                            $('#attorneys-container').append(html);
                        } else {
                            console.log('Error: ' + response.msg);
                            $('.load_more_btn_div').html('');
                            $('.msg').html('<p class="alert alert-danger">'+response.msg+'</p>');
                            setTimeout(function() {
                                $('.msg').html('');
                            }, 3000);
                        }
                        offset += limit;
                        loading = false;
                    }
                });
            }
        }

        $('#load-more-btn').click(function() {
            loadMoreAttorneys();
        });

        $('.be-client-btn').on('click', function() {
            var attorneyId = $(this).data('attorney-id');
            var loggedInUserId = $(this).data('logged-in-user-id');
            var button = $(this); // Store the button element
            beAClient(attorneyId, loggedInUserId, button); // Pass the button to the beAClient function
        });

        function beAClient(attorneyId, loggedInUserId, button) {
            console.log(attorneyId, loggedInUserId);
            $.ajax({
                url: 'action.php',
                method: 'POST',
                data: { attorneyId: attorneyId, loggedInUserId: loggedInUserId, action: 'change_status_on_be_a_client' },
                success: function(response) {
                    console.log('Status updated successfully');
                    // Update button text and color
                    button.text('Requested');
                    button.removeClass('btn-danger').addClass('btn-warning');
                },
                error: function(xhr, status, error) {
                    // Handle error response
                    console.error('Error updating status:', error);
                }
            });
        }
    });
</script>

