<?php
session_start();
include '../admin/config.php';
if(isset($_POST['logout_button'])){
    unset($_SESSION['front_lawyer']); 
    // session_destroy();
    header("Location: login.php");
    exit;
}

if(isset($_POST)){
	if(isset($_POST['action'])){
		if($_POST['action']=='show_appointment_data_in_edit_modal'){
			// var_dump($_POST);exit;
			if(isset($_POST['id'])) {
			    $appointmentId = $_POST['id'];
			    // var_dump($appointmentId);exit;    
			    $stmt = $pdo->prepare("SELECT * FROM tbl_appointment WHERE id = ?");
			    $stmt->execute([$appointmentId]);
			    $appointment = $stmt->fetch(PDO::FETCH_ASSOC);
			    if($appointment) {
			        echo json_encode(array('success'=>true, 'msg'=>$appointment));
			    } else {
			        echo json_encode(array('success'=>false, 'msg' => 'Appointment not found'));
			    }
			} else {
			    echo json_encode(array('success'=>false, 'msg' => 'Appointment ID is missing'));
			}
		}

		// upadate appointment data
		if($_POST['action'] == 'update_appointment_data') {
		    $formData = $_POST['formData'];
		    parse_str($formData, $formFields);
		    $edit_date 			 = $formFields['edit_date'];
		    $edit_start_time	 = $formFields['edit_start_time'];
		    $edit_end_time 		 = $formFields['edit_end_time'];
		    $edit_appointment_id = $formFields['edit_appointment_id'];
		    $stmt = $pdo->prepare("UPDATE tbl_appointment SET appointment_date = ?, start_time = ?, end_time = ?  WHERE id = ?");
		    $result = $stmt->execute([$edit_date, $edit_start_time, $edit_end_time, $edit_appointment_id]);
		    if($result) {
		        $response = array(
		            'success' => true,
		            'msg' => 'Appointment updated successfully.'
		        );
		    } else {
		        $response = array(
		            'status' => false,
		            'msg' => 'Failed to update appointment.'
		        );
		    }
		    echo json_encode($response);
		}

		// delete
		if($_POST['action'] == 'delete_appointment_data') {
		 	$appointmentId = $_POST['id'];
		    $stmt = $pdo->prepare("DELETE FROM tbl_appointment WHERE id = ?");
		    $result = $stmt->execute([$appointmentId]);
		    if ($result) {
		    	$response = array(
		            'success' => true,
		            'msg' => 'Appointment delete successfully.'
		        );
		    }else{
	    		$response = array(
		            'status' => false,
		            'msg' => 'Failed to delete appointment.'
	        	);
	    	}
	    	echo json_encode($response);
		}

		// get all
		if($_POST['action'] == 'get_all_appointment_data') {
			if($_POST['get_today'] == 'no'){
				$stmt = $pdo->query("SELECT * FROM `tbl_appointment`");
			}else{
				$stmt = $pdo->query("SELECT * FROM `tbl_appointment` WHERE DATE(`appointment_date`) = CURDATE()");
			}
		    if ($stmt->rowCount() > 0) {
		    	$appointments = $stmt->fetchAll(PDO::FETCH_ASSOC);
		    	$response = array(
		            'success' => true,
		            'msg' => $appointments
		        );
		    }else{
		    	$response = array(
		            'success' => false,
		            'msg' => 'No Appointments found'
		        );
		    }
		    echo json_encode($response);
		}

		// insert data
		
		if ($_POST['action'] == 'add_appointment_data') {
		    if (isset($_POST['formData'])) {
		        parse_str($_POST['formData'], $formDataArray);
		        $name = $formDataArray["name"];
		        $email = $formDataArray["email"];
		        $phone = $formDataArray["phone"];
		        $date = $formDataArray["date"];
		        $start_time = $formDataArray["start_time"];
		        $end_time = $formDataArray["end_time"];
		        
		        $stmt = $pdo->prepare("INSERT INTO `tbl_appointment` (`name`, `email`, `phone`, `appointment_date`, `start_time`, `end_time`) VALUES (?, ?, ?, ?, ?, ?)");
		        $result = $stmt->execute([$name, $email, $phone, $date, $start_time, $end_time]);
		        
		        if ($result) {
		            $response = array(
		                'success' => true,
		                'msg' => 'Appointment inserted successfully.'
		            );
		        } else {
		            $response = array(
		                'status' => false,
		                'msg' => 'Failed to insert appointment.'
		            );
		        }
		        echo json_encode($response);
		    } else {
		        $response = array(
		            'status' => false,
		            'msg' => 'Form data is missing.'
		        );
		        echo json_encode($response);
		    }
		}


		if ($_POST['action'] == 'accept_client_request') {
		    if (isset($_POST['clientId'])) {
		        $clientId = $_POST['clientId'];
		        $stmt = $pdo->prepare("UPDATE tbl_client SET status = 1 WHERE client_id = ?");
		        $stmt->execute([$clientId]);
		        if ($stmt->rowCount() > 0) {
		            $response = ['success' => true, 'msg' => 'Client request accepted successfully'];
		        } else {
		            $response = ['success' => false, 'msg' => 'Failed to accept client request'];
		        }
		    } else {
		        $response = ['success' => false, 'msg' => 'Client ID is missing'];
		    }
		    echo json_encode($response);
		} else {
		    // Send an error response if the action parameter is missing or incorrect
		    $response = ['success' => false, 'msg' => 'Invalid action'];
		    echo json_encode($response);
		}


	}
}