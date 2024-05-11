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
        
        $upload_path = "C:/xampp/htdocs/kebudayaan_server/gambar_sejarawan/".$file_name; 
        if(move_uploaded_file($file_tmp, $upload_path)){
            // File berhasil diunggah, simpan nama file ke dalam database
            $foto = $file_name;
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal mengunggah file gambar.";
            echo json_encode($response);
            exit();
        }
    }

    $insert = "INSERT INTO sejarawan (nama, tgl_lahir, asal, jk, deskripsi, foto) 
               VALUES (?, ?, ?, ?, ?, ?)";
    $stmt = $koneksi->prepare($insert);
    $stmt->bind_param("ssssss", $nama, $tgl_lahir, $asal, $jk, $deskripsi, $foto);

    if ($stmt->execute()) {
        $response['value'] = 1;
        $response['message'] = "Berhasil Tambah Data";
    } else {
        $response['value'] = 0;
        $response['message'] = "Tambah Data: " . $stmt->error;
    }
    $stmt->close();
} else {
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
}

echo json_encode($response);

?>
