<?php

header("Access-Control-Allow-Origin: *");
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();

    $nama = $_POST['nama'];
    $tgl_lahir = $_POST['tgl_lahir'];
    $asal = $_POST['asal'];
    $jk = $_POST['jk'];
    $deskripsi = $_POST['deskripsi'];
    $foto = "";
    if(isset($_FILES['foto']['name'])){
        $file_name = $_FILES['foto']['name'];
        $file_size = $_FILES['foto']['size'];
        $file_tmp = $_FILES['foto']['tmp_name'];
        $file_type = $_FILES['foto']['type'];
        
        $extensions= array("jpeg","jpg","png");
        $file_ext = strtolower(end(explode('.',$_FILES['foto']['name'])));
        
        if(in_array($file_ext,$extensions)=== false){
            $response['value'] = 0;
            $response['message'] = "Extensi file tidak diperbolehkan, gunakan file JPEG atau PNG.";
            echo json_encode($response);
            exit();
        }
        
        $upload_path = "http://192.168.0.100/kebudayaan_server/gambar_sejarawan/".$file_name; // Ganti example.com dengan domain Anda
        move_uploaded_file($file_tmp,"gambar_sejarawan/".$file_name);
        $foto = $upload_path;
    }

    $insert = "INSERT INTO sejarawan (nama, tgl_lahir, asal, jk, deskripsi, foto) 
               VALUES ('$nama', '$tgl_lahir', '$asal', '$jk', '$deskripsi', '$foto')";

    if (mysqli_query($koneksi, $insert)) {
        $response['value'] = 1;
        $response['message'] = "Berhasil Tambah Data";
    } else {
        $response['value'] = 0;
        $response['message'] = "Tambah Data: " . mysqli_error($koneksi);
    }
} else {
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
}

echo json_encode($response);

?>
