<?php
// Get the filename from the query parameters
$filename = $_GET['filename'];
// var_dump($filename);exit;
// Set the path to the PDF file
$file = 'assets/pdf-files/' . $filename; // Replace with the actual path to your PDF files directory

// Set the appropriate headers for file download
header('Content-Type: application/pdf');
header('Content-Disposition: attachment; filename="' . $filename . '"');

// Output the file content
readfile($file);
?>
