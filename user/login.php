<?php
session_start();
include '../admin/config.php';

if (isset($_SESSION['front_user'])) {
    header("Location: dashboard.php"); 
    exit();
}

if (isset($_POST['login_button'])) {
    $username = $_POST['username']; 
    $password = $_POST['password'];
    
    if (filter_var($username, FILTER_VALIDATE_EMAIL)) {
        // If the provided username is an email, query the database using email
        $stmt = $pdo->prepare("SELECT * FROM `tbl_user` WHERE email = :username");
    } else {
        $stmt = $pdo->prepare("SELECT * FROM `tbl_user` WHERE phone = :username");
    }

    $stmt->bindParam(':username', $username);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['front_user'] = $user;
        header("Location: dashboard.php");
        exit();
    } else {
        $login_error = "Invalid email, phone number, or password";
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
                    <div id="error-message" class="alert alert-danger <?php echo (!empty($login_error)) ? '' : 'd-none'; ?>"><?php echo $login_error; ?></div>
                    <h2 class="text-center">Client Login</h2>
                    <form method="post" action="">
                        <div class="form-group">
                            <label for="username">Email address or Phone number</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="Enter your email or phone number" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                        </div>
                        <button type="submit" class="btn btn-danger btn-block" name="login_button">Login</button>
                    </form>
                    <p class="text-center m-2">If you have not an account? <a href="register.php">Go to Registration</a></p>
                </div>
            </div>
        </div>
    </div>

    <script>
        setTimeout(function() {
            document.getElementById('error-message').classList.add('d-none');
        }, 3000);
    </script>
</body>
</html>
