<?php

include 'connect.php';

$nama = $_POST['nama'];
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];

$connect->query(
    "INSERT INTO account (nama, username, email, password) VALUES ('" .
        $nama .
        "', '" .
        $username .
        "', '" .
        $email .
        "', '" .
        $password .
        "')"
);

?>
