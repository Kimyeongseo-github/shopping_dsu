<?php
include '../connection-user.php';

$userID = $_POST['ID'];
$userEmail = $_POST['EMALE'];
$userPassword = $_POST['PASSWORD'];
$username = $_POST['NAME'];
$userphone = $_POST['PHONE']; 
// DB에 등록된 주소는 NULL값을 줌. (빼지 않으면 회원가입 시 어려움)
// 졸작 전시 시 DB 테이블 수정. 
// 해당 PHP 파일들 및 폴더(vege)는 무조건 htdocs 안에 들어있어야함


$sqlQuery = "INSERT INTO users SET ID = '$userID', # SET NAME으로 하니 파란줄
EMALE = '$userEmail', PASSWORD = '$userPassword', NAME = '$username',
PHONE = '$userphone'";

$resultQuery = $connection -> query($sqlQuery);

// resultQuery의 결과만 확인하여 가입을 진행
if($resultQuery) {
    echo json_encode(array("success" => true));
}
else
{
    echo json_encode(array("success" => false));
}