<?php
// Path to the PDF file
$file = 'assets/pdf-files/file_20240311_172309.pdf';

// Check if the file exists
if (file_exists($file)) {
    // Set the content type to PDF
    header('Content-Type: application/pdf');
    // Set the content length to the size of the file
    header('Content-Length: ' . filesize($file));
    // Output the file content
    readfile($file);
} else {
    // Handle the error, e.g., show a 404 page
    header("HTTP/1.0 404 Not Found");
    echo "File not found";
}
?>
