<?php

include 'connect.php';

$username = $_POST['username'];
$password = $_POST['password'];

$queryResult = $connect->query(
    "SELECT * FROM account WHERE username='" .
        $username .
        "' and password='" .
        $password .
        "'"
);

$result = [];

while ($fetchData = $queryResult->fetch_assoc()) {
    $result[] = $fetchData;
}

echo json_encode($result);

?>
