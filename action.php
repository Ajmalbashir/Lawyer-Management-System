<?php
include 'admin/config.php';
if(isset($_POST)){
    if (isset($_POST['action'])) {
        if($_POST['action'] == 'load_more_books'){
            $result = fetchBooks($pdo, $_POST['limit'], $_POST['offset']);
            // var_dump($result);exit;
		    if(count($result) > 0){
		        $response = [
		            'success' => true,
		            'msg' => $result
		        ];
		    } else {
		        $response = [
		            'success' => false,
		            'msg' => 'No more data found'
		        ];
		    }
		    echo json_encode($response);
        }


        if ($_POST['action'] == 'approval') {
		    if (!isset($_POST['bookId'], $_POST['email'], $_FILES['image'])) {
		        echo json_encode(array('
		        	success' => false, 
		        	'message' => 'Incomplete data'
		        ));
		        exit;
		    }
		    $bookId = $_POST['bookId'];
		    $email = $_POST['email'];
		    if ($_FILES['image']['error'] !== UPLOAD_ERR_OK) {
		        echo json_encode(array('success' => false, 'message' => 'Image upload failed'));
		        exit;
		    }
		    $image = $_FILES['image']['name'];
		    $image_tmp = $_FILES['image']['tmp_name'];
		    $destination = $_SERVER['DOCUMENT_ROOT'] . '/lawyer-management-system/assets/uploads/' . $image;

		    if (!move_uploaded_file($image_tmp, $destination)) {
		        echo json_encode(array(
		        	'success' => false,
		        	'message' => 'Failed to move uploaded file'
		        ));
		        exit;
		    }

		    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
		        echo json_encode(array(
		        	'success' => false, 
		        	'message' => 'Invalid email format'
		        ));
		        exit;
		    }

		    $stmt = $pdo->prepare("INSERT INTO tbl_approval (book_id, image, email) VALUES (:book_id, :image, :email)");
		    $stmt->bindParam(':book_id', $bookId);
		    $stmt->bindParam(':image', $image);
		    $stmt->bindParam(':email', $email);
		    $result = $stmt->execute();
		    if ($result) {
		        $response = array(
		            'success' => true,
		            'message' => 'Request added successfully.'
		        );
		    } else {
		        $response = array(
		            'success' => false,
		            'message' => 'Request not added successfully.'
		        );
		    }
		    echo json_encode($response);
		}
    }
}