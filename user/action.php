<?php
session_start();
include '../admin/config.php';
$fullName = $email = $password = $confirmPassword = $phone = "";
$role = 'user';
$status = 'Active';
$fullNameErr = $emailErr = $passwordErr = $confirmPasswordErr = $phoneErr = "";

if (isset($_POST['register_button'])) {
    if (empty($_POST["fullName"])) {
        $fullNameErr = "Full name is required";
    } else {
        $fullName = test_input($_POST["fullName"]);
    }

    if (empty($_POST["email"])) {
        $emailErr = "Email is required";
    } else {
        $email = test_input($_POST["email"]);
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $emailErr = "Invalid email format";
        }
    }

    if (empty($_POST["password"])) {
        $passwordErr = "Password is required";
    } elseif (strlen($_POST["password"]) < 8) {
        $passwordErr = "Password must be at least 8 characters long";
    } else {
        $password = test_input($_POST["password"]);
    }

    if (empty($_POST["confirmPassword"])) {
        $confirmPasswordErr = "Please confirm password";
    } else {
        $confirmPassword = test_input($_POST["confirmPassword"]);
        if ($confirmPassword !== $password) {
            $confirmPasswordErr = "Passwords do not match";
        }
    }

    if (empty($_POST["phone"])) {
        $phoneErr = "Phone number is required";
    } else {
        $phone = test_input($_POST["phone"]);
        if (!preg_match("/^0?\d{10}$/", $phone)) {
            $phoneErr = "Invalid phone number format";
        } else {
            $stmt = $pdo->prepare("SELECT id FROM `tbl_user` WHERE phone = :phone");
            $stmt->bindParam(':phone', $phone);
            $stmt->execute();
            $count = $stmt->rowCount();
            if ($count > 0) {
                $phoneErr = "This phone number is already registered";
            }
        }
    }

    $_SESSION['register_errors'] = [
        'full_name_error' => $fullNameErr,
        'email_error' => $emailErr,
        'password_error' => $passwordErr,
        'confirm_password_error' => $confirmPasswordErr,
        'phone_error' => $phoneErr
    ];

    if (!empty($fullNameErr) || !empty($emailErr) || !empty($passwordErr) || !empty($confirmPasswordErr) || !empty($phoneErr)) {
        header("Location: register.php");
        exit();
    }

    try {
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $stmt = $pdo->prepare("SELECT id FROM `tbl_user` WHERE email = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $count = $stmt->rowCount();

        if ($count > 0) {
            $emailErr = "This email is already registered";
            $_SESSION['register_errors']['email_error'] = $emailErr;
            header("Location: register.php");
            exit();
        } else {
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
            $stmt = $pdo->prepare("INSERT INTO `tbl_user` (`full_name`, `email`, `password`, `phone`, `role`, `status`) VALUES (:fullName, :email, :password, :phone, :role, :status)");
            $stmt->bindParam(':fullName', $fullName);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':password', $hashedPassword);
            $stmt->bindParam(':phone', $phone);
            $stmt->bindParam(':role', $role);
            $stmt->bindParam(':status', $status);

            if ($stmt->execute()) {
                $_SESSION['register_status'] = true;
                $_SESSION['register_msg'] = 'Registration successful';
                header("Location: register.php");
                exit();
            } else {
                $_SESSION['register_status'] = false;
                $_SESSION['register_msg'] = 'Registration failed';
                header("Location: register.php");
                exit();
            }
        }
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}

if(isset($_POST['logout_button'])){
    unset($_SESSION['front_user']); 
    // session_destroy();
    header("Location: login.php");
    exit;
}






if(isset($_POST)){
    if (isset($_POST['action'])) {

        // gsklfjas
        if($_POST['action'] == 'load_more_lawyers'){
            $result = fetchAttorneys($pdo, $_POST['limit'], $_POST['offset'], $_POST['type']);
            if(count($result)>0){
                foreach($result as $key => $lawyer){
                    $check_if_client = checkIfYouAreClientOfThisLawyer($pdo, $lawyer['id'], $_SESSION['front_user']['id']);
                    $result[$key]['check_if_client'] = $check_if_client;
                }
                // var_dump($result[0]['check_if_client']);exit;
                $response = [
                    'success' => true,
                    'msg' => $result
                ];
            }else{
                $response = [
                    'success' => false,
                    'msg' => 'No more data found'
                ];
            }
            echo json_encode($response);
        }


        if ($_POST['action'] == 'change_status_on_be_a_client') {
            $attorneyId = $_POST['attorneyId'];
            $loggedInUserId = $_POST['loggedInUserId'];
            // var_dump($attorneyId,$loggedInUserId);exit;
            $stmt = $pdo->prepare("INSERT INTO tbl_client (lawyer_id, client_id) VALUES (?, ?)");
            $result = $stmt->execute([$attorneyId, $loggedInUserId]);
            if ($result) {
                $response = [
                    'success' => true,
                    'msg' => 'Status updated successfully'
                ];
            } else {
                $response = [
                    'success' => false,
                    'msg' => 'Failed to update status'
                ];
            }

            echo json_encode($response);
        }

        if ($_POST['action'] == 'get_all_Books_data') {    
            if(isset($_SESSION['front_user']) && !empty($_SESSION['front_user'])) {
                $logged_in_user_id = $_SESSION['front_user']['id'];                
                $stmt = $pdo->prepare("SELECT * FROM tbl_library WHERE user_id = :logged_in_user_id");
                $stmt->bindParam(':logged_in_user_id', $logged_in_user_id, PDO::PARAM_INT);
                $stmt->execute();
                if ($stmt->rowCount() > 0) {
                    $books = $stmt->fetchAll(PDO::FETCH_ASSOC);
                    $response = array(
                        'success' => true,
                        'msg' => $books
                    );
                } else {
                    $response = array(
                        'success' => false,
                        'msg' => 'No Books found'
                    );
                }
            } else {
                $response = array(
                    'success' => false,
                    'msg' => 'User session not found'
                );
            }
            echo json_encode($response);
        }


        if ($_POST['action'] == 'insert_books') {
            // var_dump($_POST['category_id']);exit;
            $currentDateTime = date('Ymd_His'); // Format: YYYYMMDD_HHmmss
            $generatedName = 'file_' . $currentDateTime.'.pdf'; // You can adjust the 
            $name = $_POST['name'];
            $author = $_SESSION['front_user']['full_name'];
            $description = $_POST['description'];
            $category_id = $_POST['category_id'];
            $pdf_file = $generatedName;
            // var_dump($pdf_file);exit;
            $pdf_file_tmp = $_FILES['pdf_file']['tmp_name'];
            $thumbnail_image = $_FILES['image']['name'];
            $thumbnail_image_tmp = $_FILES['image']['tmp_name'];

            $pdf_destination = $_SERVER['DOCUMENT_ROOT'] . '/lawyer-management-system/assets/pdf-files/' . $pdf_file;
            $thumbnail_destination = $_SERVER['DOCUMENT_ROOT'] . '/lawyer-management-system/assets/uploads/' . $thumbnail_image;

            move_uploaded_file($pdf_file_tmp, $pdf_destination);
            move_uploaded_file($thumbnail_image_tmp, $thumbnail_destination);
            if ($_POST['price_type'] === 'paid') {
                $price = $_POST['price'];
            } else {
                $price = null;
            }

            $stmt = $pdo->prepare("INSERT INTO tbl_library (name, author, description, pdf_file, image, user_id, category_id, price) VALUES (:name, :author, :description, :pdf_file, :image, :user_id, :category_id, :price)");
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':author', $author);
            $stmt->bindParam(':description', $description);
            $stmt->bindParam(':pdf_file', $pdf_file);
            $stmt->bindParam(':image', $thumbnail_image);
            $stmt->bindParam(':user_id', $_SESSION['front_user']['id']);
            $stmt->bindParam(':category_id', $category_id);
            $stmt->bindParam(':price', $price);
            $result = $stmt->execute();

            if ($result) {
                $response = array(
                    'success' => true,
                    'message' => 'Book added successfully.'
                );
            }else{
                $response = array(
                    'success' => false,
                    'message' => 'Book not added successfully.'
                );

            }

            echo json_encode($response);
        } 


        if ($_POST['action'] == 'accept_request') {
            if (isset($_POST['bookId'])) {
                $bookId = $_POST['bookId'];
                $stmt = $pdo->prepare("SELECT a.book_id, a.email, a.status, l.pdf_file
                    FROM tbl_approval a
                    JOIN tbl_library l ON a.book_id = l.id
                    WHERE a.book_id = ? AND a.status = 0");
                $stmt->execute([$bookId]);
                $book = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($book) {
                    $recipientEmail = $book['email'];
                    $pdfFileName = $book['pdf_file'];
                    $downloadLink = BASE_URL . 'assets/pdf_file?filename=' . $pdfFileName;
                    $to = $recipientEmail;
                    $subject = 'Download Link for PDF File';
                    $message = 'Please click on the following link to download the PDF file: ' . $downloadLink;
                    $mailResult = smtp_mailer($to, $subject, $message);
                    // var_dump($mailResult);exit;
                    if ($mailResult == 'Sent') {
                        $stmt = $pdo->prepare("UPDATE tbl_approval SET status = 1 WHERE book_id = ?");
                        $stmt->execute([$bookId]);
                        if ($stmt->rowCount() > 0) {
                            $response = [
                                'success' => true, 
                                'msg' => 'Client request accepted successfully and email sent'
                            ];
                        } else {
                            $response = [
                                'success' => false, 
                                'msg' => 'Failed to update status to 1 and email also not sent'
                            ];
                        }
                    } else {
                        $response = [
                            'success' => false, 
                            'msg' => 'Failed to send email: ' . $mailResult
                        ];
                    }
                } else {
                    $response = [
                        'success' => false, 
                        'msg' => 'Book details not found or already accepted'
                    ];
                }
            } else {
                $response = [
                    'success' => false, 
                    'msg' => 'Book ID is missing'
                ];
            }
            echo json_encode($response);
        }

    }
}

// Function to sanitize and validate input
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
?>
