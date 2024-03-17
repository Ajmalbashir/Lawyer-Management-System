<!-- Logic -->
<?php
	include '../admin/config.php';
	session_start();
	if (!isset($_SESSION['front_lawyer'])) {
	    header("Location: login.php"); 
	    exit();
	}
?>
<!-- Page Content -->
<?php include 'header.php'?>

		<div class="container-full">
			<div class="msg"></div>
		    <div class="row">
		        <div class="col-md-6">
		            <h2>Today Appointments</h2>
		        </div>
		    </div>
		</div>

		<table id="data_table" class="table table-striped table-bordered">
		    <thead>
	            <th>id</th>
	            <th>Name</th>
	            <th>Email</th>
	            <th>Phone</th>
		    </thead>
		    <tbody>
		    	
		    </tbody>
		</table>

<?php include 'footer.php'?>

<script>
$(document).ready(function() {
	getAllAppointments();
});

function getAllAppointments(){
	$.ajax({
        url: 'action.php',
        method: 'POST',
        data: {action: 'get_all_appointment_data', get_today: 'yes' },
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

</script>

</body>
</html>