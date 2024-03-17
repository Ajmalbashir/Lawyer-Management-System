<?php
session_start();
include '../admin/config.php';
if (isset($_SESSION['front_lawyer'])) {
    header("Location: dashboard.php"); // Redirect logged-in users to the dashboard
    exit();
}
if (isset($_POST['login_button'])) {
    $valid = 1;
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    // Email validation
    if (empty($email)) {
        $valid = 0;
        $login_error = "Email can not be empty";
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $valid = 0;
        $login_error = "Invalid email format";
    }

    // Password validation
    if (empty($password)) {
        $valid = 0;
        $login_error = "Password can not be empty";
    }

    // If validations pass, proceed with login
    if ($valid) {
        $stmt = $pdo->prepare("SELECT * FROM `tbl_attorney` WHERE email = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $lawyer = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if ($lawyer && password_verify($password, $lawyer['password'])) {
            $_SESSION['front_lawyer'] = $lawyer;
            header("Location: dashboard.php ");
            exit();
        } else {
            $login_error = "Invalid email or password";
        }
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style type="text/css">
        body {
            background: #D64C4C;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center vh-100">
            <div class="col-lg-6">
                <div class="card p-5">
                    <h2 class="text-center">Lawyer Login</h2>
                    <?php if (!empty($login_error)) { ?>
                        <div class="alert alert-danger"><?php echo $login_error; ?></div>
                    <?php } ?>
                    <form method="post" action="">
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                        </div>
                        <button type="submit" class="btn btn-danger btn-block" name="login_button">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
