<?php

header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

$id = $_POST['id'];
$nama = $_POST['nama'];
$tgl_lahir = $_POST['tgl_lahir'];
$asal = $_POST['asal'];
$jk = $_POST['jk'];
$deskripsi = $_POST['deskripsi'];
$foto = $_POST['foto'];


$sql = "UPDATE sejarawan SET nama = '$nama', tgl_lahir = '$tgl_lahir', asal = '$asal', jk = '$jk', deskripsi = '$deskripsi', foto = '$foto' WHERE id=$id";
$isSuccess = $koneksi->query($sql);


$res = [];
if ($isSuccess) {
    $cek = "SELECT * FROM sejarawan WHERE id = $id";
    $result = mysqli_fetch_assoc(mysqli_query($koneksi, $cek));

    $res['is_success'] = true;
    $res['value'] = 1;
    $res['message'] = "Berhasil edit data sejarawan";
    $res['nama'] = $result['nama'];
    $res['tgl_lahir'] = $result['tgl_lahir'];
    $res['asal'] = $result['asal'];
    $res['jk'] = $result['jk'];
    $res['deskripsi'] = $result['deskripsi'];
    $res['foto'] = $result['foto'];
    $res['id'] = $result['id'];
} else {
    $res['is_success'] = false;
    $res['value'] = 0;
    $res['message'] = "Gagal edit data sejarawan";
}


echo json_encode($res);

?>
