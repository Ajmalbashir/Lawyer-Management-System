<!-- Logic -->
<?php
	include '../admin/config.php';
	session_start();
	if (!isset($_SESSION['front_lawyer'])) {
	    header("Location: login.php"); 
	    exit();
	}else{
		$query = $pdo->query("SELECT u.email
								FROM tbl_client c
								INNER JOIN tbl_user u ON c.client_id = u.id
								WHERE c.lawyer_id = ".$_SESSION['front_lawyer']['id']."
								AND u.status = 'Active' ");
		$client_emails = $query->fetchAll(PDO::FETCH_COLUMN);
	}
?>

<!-- Page Content -->
<?php include 'header.php'?>

		<div class="container-full">
			<div class="msg"></div>
		    <div class="row">
		        <div class="col-md-6">
		            <h2>Appointments</h2>
		        </div>
		        <div class="col-md-6 text-right">
		            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAppointmentModal">Add New Appointment</button>
		        </div>
		    </div>
		</div>

		<table id="data_table" class="table table-striped table-bordered">
		    <thead>
	            <th>id</th>
	            <th>Name</th>
	            <th>Email</th>
	            <th>Phone</th>
	            <th>Date</th>
	            <th>Start Time</th>
	            <th>End Time</th>
	            <th>Action</th>
		    </thead>
		    <tbody>
		    	
		    </tbody>
		</table>

		<!-- add modal -->
		<div class="modal fade" id="addAppointmentModal" tabindex="-1" role="dialog" aria-labelledby="addAppointmentModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-lg" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="addAppointmentModalLabel">Add New Appointment</h5>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <div class="modal-body">
		                <!-- Form for adding new appointment -->
		                <form id="addAppointmentForm">
		                	<div class="row">
		                		<div class="col-lg-6">
				                    <div class="form-group">
				                        <label for="name">Name</label>
				                        <input type="name" class="form-control" id="name" name="name" required>
				                    </div>
				                </div>
			                	<div class="col-lg-6">
				                    <div class="form-group">
				                        <label for="email">Email</label>
				                        <select required class="form-control" id="email" name="email">
										    <option selected>Select Client</option>
										    <?php if(count($client_emails) > 0) { ?>
											    <?php foreach ($client_emails as $client_email) { ?>
											        <option value="<?php echo $client_email; ?>"><?php echo $client_email; ?></option>
											    <?php } ?>
											<?php } ?>
										</select>
				                    </div>
			                    </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="phone">Phone</label>
		                        <input type="tel" class="form-control" id="phone" name="phone" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="date">Date</label>
		                        <input type="date" class="form-control" id="date" name="date" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="start_time">Start Time</label>
		                        <input type="time" class="form-control" id="start_time" name="start_time" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="end_time">End Time</label>
		                        <input type="time" class="form-control" id="end_time" name="end_time" required>
		                    </div>
		                    <!-- Add more fields as needed -->
		                    <div class="modal-footer">
		                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		                        <button type="submit" name="add_appointment" class="btn btn-primary" onclick="addAppointment(event)">Save</button>
		                    </div>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>

		<!-- end add modal -->

		<!-- edit modal -->
		<div class="modal fade" id="editAppointmentModal" tabindex="-1" role="dialog" aria-labelledby	="editAppointmentModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		        <div class="modal-content">
		            <div class="modal-header">
		                <h5 class="modal-title" id="editAppointmentModalLabel">Edit Appointment</h5>
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <div class="modal-body">
		                <!-- Form for editing appointment -->
		                <form id="editAppointmentForm">
		                    <div class="form-group">
		                        <label for="date">Date</label>
		                        <input type="date" class="form-control" id="edit_date" name="edit_date" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="start_time">Start Time</label>
		                        <input type="time" class="form-control" id="edit_start_time" name="edit_start_time" required>
		                    </div>
		                    <div class="form-group">
		                        <label for="end_time">End Time</label>
		                        <input type="time" class="form-control" id="edit_end_time" name="edit_end_time" required>
		                    </div>
		                    <!-- Add more fields as needed -->
		                    <input type="hidden" id="edit_appointment_id" name="edit_appointment_id">
		                   <button type="button" class="btn btn-primary" onclick="updateAppointment()">Save changes</button>
		                </form>
		            </div>
		        </div>
		    </div>
		</div>
		<!-- end edit modal -->

<?php include 'footer.php'?>

<script>

	$(document).ready(function(){
		getAllAppointments();
	});

	function addAppointment(event){
		event.preventDefault();
	    var formData = $('#addAppointmentForm').serialize();
	    // alert(formData);
		$.ajax({
	        url: 'action.php',
	        method: 'POST',
	        data: {formData:formData,action: 'add_appointment_data'},
	        success: function(response) {
	        	console.log(response);
	        	var response = JSON.parse(response);
	        	if(response.success == true){
					getAllAppointments();
		            $('#addAppointmentModal').modal('hide');
		            $('#addAppointmentForm')[0].reset();
	                $('.msg').html('<p class="alert alert-success">'+response.msg+'</p>');
	        		setTimeout(function() {
	        			$('.msg').html('');
	        		}, 3000);
	        	}else{
	        		$('#addAppointmentModal').modal('hide');
	                $('.msg').html('<p class="alert alert-danger">'+response.msg+'</p>');
	        		setTimeout(function() {
	        			$('.msg').html('');
	        		}, 3000);
	        	}

	        }
	    });
	}

	function getAllAppointments(){
		$.ajax({
	        url: 'action.php',
	        method: 'POST',
	        data: {action: 'get_all_appointment_data', get_today: 'no' },
	        success: function(response) {
	        	var response = JSON.parse(response);
	        	var appointments = response.msg;
	        	if(response.success == true){
				    $('#data_table tbody').empty();
				    appointments.forEach(function(appointment) {
				    	console.log(appointment.id);
				        var row = '<tr>' +
				            '<td>' + appointment.id + '</td>' +
				            '<td>' + appointment.name + '</td>' +
				            '<td>' + appointment.email + '</td>' +
				            '<td>' + appointment.phone + '</td>' +
				            '<td>' + appointment.appointment_date + '</td>' +
				            '<td>' + appointment.start_time + '</td>' +
				            '<td>' + appointment.end_time + '</td>' +
				            '<td>' +
				            '<button class="btn btn-primary edit-btn btn-sm" onclick="fetchAppointmentDetails(' + appointment.id + ')" data-id="' + appointment.id + '">Edit</button>' +
				            '<button class="btn btn-danger delete-btn btn-sm" onclick="deleteAppointmentDetails(' + appointment.id + ')" data-id="' + appointment.id + '">Delete</button>' +
				            '</td>' +
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
    
    function fetchAppointmentDetails(appointmentId) {
        // alert(appointmentId);
	    $.ajax({
	        url: 'action.php',
	        method: 'POST',
	        data: { id: appointmentId , action: 'show_appointment_data_in_edit_modal'},
	        success: function(response) {
	        	var response = JSON.parse(response);
	        	if(response.success == true){
	        		appointment = response.msg;
		            // Populate other fields as needed
		            $('#edit_date').val(appointment.appointment_date);
		            $('#edit_start_time').val(appointment.start_time);
		            $('#edit_end_time').val(appointment.end_time);
		            $('#edit_appointment_id').val(appointment.id);
		            $('#editAppointmentModal').modal('show');
	        	}else{
	        		$('.msg').html('<p class="alert alert-danger">'+response.msg+'</p>');
	        		setTimeout(function() {
	        			$('.msg').html('');
	        		}, 3000);
	        	}
	        },
	        error: function(xhr, status, error) {
	            console.error(xhr.responseText);
	        }
	    });
	}

	function updateAppointment() {
	    event.preventDefault();
	    var formData = $('#editAppointmentForm').serialize();
	    console.log(formData);
	    var action = 'update_appointment_data';
	    $.ajax({
	        url: 'action.php',
	        method: 'POST',
	        data: {
	            action:action,
	            formData: formData,
	        },
	        success: function(response) {
	        	console.log(response);
	        	var response = JSON.parse(response);
	        	if(response.success == true){
					getAllAppointments();
		            $('#editAppointmentModal').modal('hide');
	                $('.msg').html('<p class="alert alert-success">'+response.msg+'</p>');
	        		setTimeout(function() {
	        			$('.msg').html('');
	        		}, 3000);
	        	}else{
	        		$('#editAppointmentModal').modal('hide');
	                $('.msg').html('<p class="alert alert-danger">'+response.msg+'</p>');
	        		setTimeout(function() {
	        			$('.msg').html('');
	        		}, 3000);
	        	}
	        },
	        error: function(xhr, status, error) {
	            console.error(xhr.responseText);
	        }
	        
	    });
	}

	function deleteAppointmentDetails(appointmentId){
		var confirmed = confirm("Are you sure you want to delete this appointment?");
    	if (confirmed) {
			$.ajax({
		        url: 'action.php',
		        method: 'POST',
		        data: { id: appointmentId , action: 'delete_appointment_data'},
		        success: function(response) {
		        	console.log(response);
		        	var response = JSON.parse(response);
		        	if(response.success == true){
						getAllAppointments();
		                $('.msg').html('<p class="alert alert-success">'+response.msg+'</p>');
		        		setTimeout(function() {
		        			$('.msg').html('');
		        		}, 3000);
		        	}else{
		                $('.msg').html('<p class="alert alert-danger">'+response.msg+'</p>');
		        		setTimeout(function() {
		        			$('.msg').html('');
		        		}, 3000);
		        	}

		        }
	       	});
		}
	}

</script>

</body>
</html>