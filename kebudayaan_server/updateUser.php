<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$id = $_POST['id'];
$fullname = $_POST['fullname'];
$phone = $_POST['phone'];

$sql = "UPDATE users SET fullname = '$fullname', phone = '$phone' WHERE id=$id";
$isSuccess = $koneksi->query($sql);

$res = [];
if ($isSuccess) {

    $cek = "SELECT * FROM users WHERE id = $id";
    $result = mysqli_fetch_assoc(mysqli_query($koneksi, $cek));

    $res['is_success'] = true;
    $res['value'] = 1;
    $res['message'] = "Berhasil edit data user";
    $res['fullname'] = $result['fullname'];
    $res['phone'] = $result['phone'];
    $res['id'] = $result['id'];
} else {
    $res['is_success'] = false;
    $res['value'] = 0;
    $res['message'] = "Gagal edit data user";
}

// Mengirim respon dalam format JSON
echo json_encode($res);

?>
