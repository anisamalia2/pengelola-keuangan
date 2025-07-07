<?php
$host = "localhost";
$user = "root";
$pass = "stlcf.l1ans";
$db   = "rpl";

$conn = new mysqli($host, $user, $pass, $db);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
?>
