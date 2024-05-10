<?php

header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();

    $fullname = $_POST['fullname'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $password = md5($_POST['password']);

    $cek = "SELECT * FROM users WHERE email = '$email'";
    $result = mysqli_query($koneksi, $cek);

    if(mysqli_num_rows($result) > 0){
        $response['value'] = 2;
        $response['message'] = "Email telah digunakan";
    } else {
   
        $insert = "INSERT INTO users (fullname, phone, email, password) 
                   VALUES ('$fullname', '$phone', '$email', '$password')";

        if(mysqli_query($koneksi, $insert)){
            $response['value'] = 1;
            $response['message'] = "Berhasil didaftarkan";
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal didaftarkan: " . mysqli_error($koneksi);
        }
    }
} else {
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
}

echo json_encode($response);

?>