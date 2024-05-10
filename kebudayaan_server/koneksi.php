<?php

$koneksi = mysqli_connect("localhost", "root", "", "kebudayaan");

if($koneksi){

	// echo "Database berhasil Conect";
	
} else {
	echo "gagal Connect";
}

?>