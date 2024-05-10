<?php

// header("Access-Control-Allow-Origin: header");
header("Access-Control-Allow-Origin: *");

include 'koneksi.php';

	$sql = "SELECT * FROM tradisi";
	$result = $koneksi->query($sql);

	if($result->num_rows > 0) {
		$response['isSuccess'] = true;
		$response['message'] = "Berhasil Menampilkan Tradisi";
		$response['data'] = array();
		while ($row = $result->fetch_assoc()) {
			$response['data'][] = $row;
		}
	} else {
		$response['isSuccess'] = false;
		$response['message'] = "Gagal menampilkan Tradisi";
		$response['data'] = null;
	}
	echo json_encode($response);


?>