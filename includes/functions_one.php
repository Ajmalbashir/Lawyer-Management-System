<?php
include('smtp/PHPMailerAutoload.php');

function fetchAttorneys($pdo, $limit, $offset, $type) {
    if($type == 'all') {
        $stmt = $pdo->prepare("SELECT * FROM tbl_attorney WHERE `status` = 'Active' LIMIT :limit OFFSET :offset");
    } else {
        $lawyer_ids = getLawyerIdsOfLoggedInUser($pdo, $_SESSION['front_user']['id']);
        if (empty($lawyer_ids)) {
            return []; 
        }
        $lawyer_ids_str = implode(',', $lawyer_ids);
        $stmt = $pdo->prepare("SELECT * FROM tbl_attorney WHERE `status` = 'Active' AND `id` IN ($lawyer_ids_str) LIMIT :limit OFFSET :offset");
    }
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}


function checkIfYouAreClientOfThisLawyer($pdo, $lawyer_id, $client_id) {
    $stmt = $pdo->prepare("SELECT * FROM tbl_client WHERE lawyer_id = ? AND client_id = ?");
    $stmt->execute([$lawyer_id, $client_id]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!$row) {
        $result = -1;
    } else {
        if ($row['status'] == 0) {
            $result = 0;
        } else {
            $result = 1;
        }
    }

    return $result;
}

function getLawyerIdsOfLoggedInUser($pdo, $client_id){
    $lawyer_ids = array(); 
    $stmt = $pdo->prepare("SELECT lawyer_id FROM tbl_client WHERE client_id = ?");
    $stmt->execute([$client_id]);    
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $lawyer_ids[] = $row['lawyer_id'];
    }
    return $lawyer_ids; 
}


function fetchBooks($pdo, $limit, $offset) {
    $stmt = $pdo->prepare("SELECT * FROM tbl_library LIMIT :limit OFFSET :offset");
    $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}



function smtp_mailer($to, $subject, $message) {
    // var_dump($to);exit();
    $mail = new PHPMailer();
    $mail->IsSMTP();
    $mail->SMTPAuth = true;
    $mail->SMTPSecure = 'tls';
    $mail->Host = "smtp.gmail.com";
    $mail->Port = 587;
    $mail->IsHTML(true);
    $mail->CharSet = 'UTF-8';
    $mail->Username = "mkashif8912@gmail.com";
    $mail->Password = "uelqkwxrzzftujed";
    $mail->SetFrom("mkashif8912@gmail.com");
    $mail->Subject = $subject;
    $mail->Body = $message;
    $mail->AddAddress($to);
    $mail->SMTPOptions = array('ssl' => array(
        'verify_peer' => false,
        'verify_peer_name' => false,
        'allow_self_signed' => false
    ));
    if (!$mail->Send()) {
        return 'Message could not be sent. Mailer Error: ' . $mail->ErrorInfo;
    } else {
        return 'Sent';
    }
}