<!-- Logic -->
<?php
	include 'action.php';
	if (!isset($_SESSION['front_lawyer'])) {
	    header("Location: login.php"); 
	    exit();
	}
?>

<!-- Page Content -->
<?php include 'header.php'?>

		<h1>Dashboard</h1>

<?php include 'footer.php'?>