<?php
// දත්ත ගබඩාව සම්බන්ධ කිරීම
$host = "localhost";
$user = "root";       // XAMPP සඳහා Default නම root
$pass = "";           // XAMPP සඳහා Default password එක හිස්ව තබන්න
$dbname = "train_view_db"; // ඔබ phpMyAdmin එකේ සාදාගත් Database නම

$conn = mysqli_connect($host, $user, $pass, $dbname);

// සම්බන්ධතාවය සාර්ථකදැයි පරීක්ෂා කිරීම
if (!$conn) {
    die("Database Connection Failed: " . mysqli_connect_error());
}
?>
