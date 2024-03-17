<?php
// Enable error reporting
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Setting up the time zone
date_default_timezone_set('Asia/Dhaka');

// Host Name
$dbhost = 'localhost'; // if host is different, then put it.

// Database Name
$dbname = 'lawyer';

// Database Username
$dbuser = 'root';

// Database Password
$dbpass = '';

// Defining base url
define("BASE_URL", "http://localhost/lawyer-management-system/");

// Getting Admin url
define("ADMIN_URL", BASE_URL . "admin" . "/");

// Define Photo URL
define("PHOTO_URL", BASE_URL . "assets/uploads" . "/");

// Set include path
set_include_path(get_include_path() . PATH_SEPARATOR . __DIR__ . '/../includes');

try {
    // Establishing database connection
    $pdo = new PDO("mysql:host={$dbhost};dbname={$dbname}", $dbuser, $dbpass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $exception) {
    // Catch any database connection errors
    echo "Connection error :" . $exception->getMessage();
}

// Include functions file
include('functions_one.php');
?>
