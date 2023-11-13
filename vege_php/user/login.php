<?php
include '../connection-user.php';

$userEmail = $_POST['EMALE'];
$userPassword = $_POST['PASSWORD'];

$sqlQuery = "SELECT * FROM users WHERE EMALE = '$userEmail' AND PASSWORD = '$userPassword'";

$resultQuery = $connection -> query($sqlQuery);

// resultQuery의 결과만 확인하여 로그인 진행
if($resultQuery -> num_rows > 0) {

    $userRecord = array(); // 연관배열, 인덱스가 정수 외의 필드명으로 된 배열
        while($rowFound = $resultQuery -> fetch_assoc()){
            $userRecord[] = $rowFound;
        }
    
    echo json_encode(
        array(
            "success" => true,
            "userData" => $userRecord[0]));
}
else
{
    echo json_encode(array("success" => false));
}