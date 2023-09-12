<?php

$host='localhost';
$user='root';
$pass=''; 
$db='db_siswa';


$conn=mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    echo "Koneksi gagal";
}
