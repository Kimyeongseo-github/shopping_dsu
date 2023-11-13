<?php
include '../connection-user.php';

$userEmail = $_POST['EMALE'];

$sqlQuery = "SELECT * FROM users WHERE EMALE = '$userEmail'";

$resultQuery = $connection -> query($sqlQuery);

// 중복된 이메일인지 확인함
if($resultQuery -> num_rows > 0) {
    echo json_encode(array("existEmail" => true));
}
else
{
    echo json_encode(array("existEmail" => false));
}