<?php
session_start();
if (isset($_SESSION['front_user'])) {
    header("Location: dashboard.php"); 
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registration Form</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style type="text/css">
        body {
            background: #D64C4C;
        }
        .status-message {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 5px;
        }
        .success {
            background-color: #28a745;
            color: #fff;
        }
        .error {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center vh-100">
            <div class="col-lg-6">
                <div class="card p-5">
                    <?php if (isset($_SESSION['register_msg'])) { ?>
					    <div id="status-message" class="status-message <?php echo $_SESSION['register_status'] ? 'success' : 'error'; ?>">
					        <?php echo $_SESSION['register_msg']; ?>
					    </div>
					    <script>
					        setTimeout(function(){
					            var statusMessage = document.getElementById('status-message');
					            statusMessage.style.display = 'none';
					        }, 5000); 
					    </script>
					    <?php
					    unset($_SESSION['register_msg']);
					    unset($_SESSION['register_status']);
					}
					?>
                    <h2 class="text-center">Client Sign up</h2>
                    <form method="post" action="action.php">
                        <div class="form-group">
                            <label for="fullName">Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required>
                            <?php if (!empty($_SESSION['register_errors']['full_name_error'])) { ?>
                                <span class="text-danger"><?php echo $_SESSION['register_errors']['full_name_error']; ?></span>
                            <?php } ?>
                        </div>
                        <div class="form-group">
                            <label for="email">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                            <?php if (!empty($_SESSION['register_errors']['email_error'])) { ?>
                                <span class="text-danger"><?php echo $_SESSION['register_errors']['email_error']; ?></span>
                            <?php } ?>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
                            <?php if (!empty($_SESSION['register_errors']['phone_error'])) { ?>
                                <span class="text-danger"><?php echo $_SESSION['register_errors']['phone_error']; ?></span>
                            <?php } ?>
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                            <?php if (!empty($_SESSION['register_errors']['password_error'])) { ?>
                                <span class="text-danger"><?php echo $_SESSION['register_errors']['password_error']; ?></span>
                            <?php } ?>
                        </div>
                        <div class="form-group">
                            <label for="confirmPassword">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                            <?php if (!empty($_SESSION['register_errors']['confirm_password_error'])) { ?>
                                <span class="text-danger"><?php echo $_SESSION['register_errors']['confirm_password_error']; ?></span>
                            <?php } ?>
                        </div>
                        <button type="submit" class="btn btn-danger btn-block" name="register_button">Register</button>
                    </form>
                    <p class="text-center m-2">Already have an account? <a href="login.php">Go to Login</a></p>
                </div>
            </div>
        </div>
    </div>
    <?php unset($_SESSION['register_errors'])?>
</body>
</html>
