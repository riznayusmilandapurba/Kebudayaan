-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Bulan Mei 2024 pada 20.08
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kebudayaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `budaya`
--

CREATE TABLE `budaya` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `konten` text NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `budaya`
--

INSERT INTO `budaya` (`id`, `judul`, `konten`, `gambar`) VALUES
(1, 'Tor Tor (Tarian Tradisional Batak)', 'Tor Tor adalah tarian tradisional suku Batak yang penuh dengan makna dan simbolisme. Tarian ini biasanya dipentaskan dalam berbagai acara adat dan keagamaan, seperti upacara adat, perayaan hari besar, dan ritual keagamaan. Gerakan dalam tarian Tor Tor sering kali menggambarkan kehidupan sehari-hari, mitologi, atau nilai-nilai budaya suku Batak. Musik yang mengiringi tarian ini biasanya dimainkan dengan alat musik tradisional Batak seperti gondang, taganing, dan seruling.', 'kerajaanbatak.jpeg'),
(2, 'Gondang Sabangunan (Alat Musik Tradisional Batak)', 'Gondang sabangunan adalah salah satu alat musik tradisional Batak yang terdiri dari seperangkat drum besar yang dimainkan secara bersama-sama oleh sekelompok pemain. Alat musik ini sering digunakan dalam berbagai upacara adat dan keagamaan serta acara-acara budaya lainnya. Gondang sabangunan menghasilkan irama yang kuat dan ritmis yang mengiringi berbagai jenis tarian dan nyanyian tradisional Batak.', 'gondang.jpeg'),
(3, 'Ulos (Kain Tradisional Batak)', 'Ulos adalah kain tradisional suku Batak yang memiliki makna dan nilai simbolis yang sangat penting dalam budaya mereka. Ulos sering kali dianggap sebagai simbol keberuntungan, kehormatan, dan kasih sayang. Kain ini sering digunakan dalam berbagai acara adat dan ritual, seperti pernikahan, pertemuan penting, dan upacara kematian. Pola dan motif yang ada pada setiap jenis ulos memiliki makna dan cerita yang kaya akan filosofi dan tradisi budaya Batak.', 'ulos.jpeg'),
(4, 'Pesta Adat (Ritual dan Upacara Adat)', 'Pesta adat merupakan bagian integral dari budaya Batak yang menandai berbagai peristiwa penting dalam kehidupan masyarakat mereka. Pesta adat mencakup berbagai jenis ritual dan upacara yang melibatkan keseluruhan komunitas, seperti upacara pernikahan, pertemuan adat, upacara pemakaman, dan perayaan hari-hari besar. Pesta adat tidak hanya sebagai ajang untuk merayakan peristiwa penting, tetapi juga sebagai wadah untuk menjaga dan melestarikan nilai-nilai budaya dan tradisi leluhur', 'sombamarhulahula.jpeg'),
(5, 'Rumah Adat (Rumah Bolon dan Rumah Gadang)', 'Rumah adat merupakan simbol keberadaan dan identitas suku Batak. Ada dua jenis rumah adat yang paling terkenal di antara suku Batak, yaitu Rumah Bolon (Toba) dan Rumah Gadang (Minangkabau). Kedua jenis rumah ini memiliki arsitektur yang unik dan ciri khas masing-masing, tetapi keduanya mengandung nilai-nilai simbolis dan filosofis yang dalam. Rumah adat sering digunakan sebagai tempat berkumpul, beribadah, dan merayakan acara adat.', 'rumahadat.jpeg'),
(6, 'Horbo (Kampung Adat Batak)', 'Horbo adalah kampung adat tradisional suku Batak yang terdiri dari serangkaian rumah adat yang dikelilingi oleh kebun atau ladang pertanian. Horbo biasanya merupakan pusat kehidupan sosial, ekonomi, dan keagamaan masyarakat Batak. Setiap horbo memiliki struktur sosial dan adat istiadat yang unik, serta sistem kepemimpinan tradisional yang dihormati oleh seluruh anggota komunitas.', 'rumahadat.jpeg'),
(7, 'Dongan Tubu (Sistem Kekerabatan Batak)', 'Dongan tubu adalah sistem kekerabatan tradisional suku Batak yang mengatur hubungan antarindividu, keluarga, dan masyarakat. Konsep dongan tubu menekankan pentingnya solidaritas, kerjasama, dan persatuan dalam kehidupan sehari-hari. Setiap anggota masyarakat Batak memiliki kewajiban moral dan sosial untuk saling mendukung dan melindungi sesama anggota kelompok.', 'udulmekuji.jpeg'),
(8, 'Adat Istiadat dan Pantangan Budaya', 'Budaya Batak juga kaya dengan berbagai adat istiadat dan pantangan yang diwariskan dari generasi ke generasi. Adat istiadat ini mencakup berbagai aspek kehidupan, seperti adat perkawinan, adat pertanian, adat keagamaan, dan adat pemerintahan. Pantangan budaya juga memiliki peran penting dalam menjaga harmoni dan keseimbangan alam, seperti larangan memotong pohon tertentu atau memancing di tempat-tempat tertentu yang dianggap suci.', 'tendi.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sejarah`
--

CREATE TABLE `sejarah` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `konten` text NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sejarah`
--

INSERT INTO `sejarah` (`id`, `judul`, `konten`, `gambar`) VALUES
(1, 'Asal Usul dan Migrasi', 'Sejarah awal suku Batak mencakup perjalanan panjang mereka dari masa prasejarah hingga migrasi ke wilayah Sumatera Utara, Indonesia. Berbagai teori telah diajukan untuk menjelaskan asal usul mereka, termasuk teori migrasi dari wilayah Asia Tenggara, teori kedatangan dari daratan Asia melalui daratan yang kini menjadi semenanjung Malaysia, atau bahkan teori migrasi jauh dari Afrika. Meskipun masih ada perdebatan di kalangan para sejarawan, data arkeologi, linguistik, dan genetik telah memberikan beberapa wawasan tentang sejarah migrasi mereka.', 'migrasibatak.jpeg'),
(2, 'Kerajaan-kerajaan Batak', 'Selama berabad-abad, wilayah Batak menjadi rumah bagi beberapa kerajaan yang berdiri secara independen atau saling bergantung satu sama lain. Contohnya adalah Kerajaan Batak Pesisir, yang terletak di sepanjang pantai barat Sumatera Utara, dan Kerajaan Sisingamangaraja XII di Tapanuli. Setiap kerajaan memiliki sistem pemerintahan sendiri, budaya, dan adat istiadat yang unik', 'kerajaanbatak.jpeg'),
(3, 'Kedatangan Belanda', 'Seperti banyak wilayah di Nusantara, kedatangan Belanda di wilayah Batak dimulai pada abad ke-17 dan mencapai puncaknya pada abad ke-19. Belanda menggunakan berbagai metode untuk menguasai wilayah ini, termasuk perjanjian dengan penguasa lokal, ekspedisi militer, dan strategi penjajahan lainnya yang mempengaruhi struktur sosial dan ekonomi masyarakat Batak', 'kedatangabelanda.jpeg'),
(4, 'Perlawanan terhadap Penjajah', 'Meskipun Belanda berhasil menguasai sebagian besar wilayah Batak, tidak sedikit pula yang melakukan perlawanan terhadap penjajah. Salah satu contoh terkenal adalah perlawanan yang dipimpin oleh Raja Sisingamangaraja XII di Tapanuli pada awal abad ke-20. Meskipun akhirnya kalah, perlawanan semacam ini menandai semangat kebangsaan dan ketahanan masyarakat Batak terhadap penjajahan', 'perlawanan.jpeg'),
(5, 'Perkembangan Kristen', 'Masuknya agama Kristen ke wilayah Batak dimulai pada abad ke-19 melalui misi-misi Kristen. Agama ini kemudian berkembang pesat di antara masyarakat Batak, memengaruhi budaya, nilai-nilai, dan pola pikir mereka. Sebagian besar suku Batak menjadi Kristen, dengan denominasi seperti Protestan dan Katolik menjadi yang paling dominan.', 'perkembangan.jpeg'),
(6, 'Peran Batak dalam Perjuangan Kemerdekaan', 'Suku Batak juga memainkan peran penting dalam perjuangan kemerdekaan Indonesia dari penjajahan Belanda. Banyak tokoh Batak yang terlibat dalam gerakan kemerdekaan, baik di tingkat politik maupun militer. Peran aktif mereka dalam meraih kemerdekaan mencerminkan semangat nasionalisme yang kuat di antara masyarakat Batak.', 'peran.jpeg'),
(7, 'Perkembangan Sosial dan Ekonomi', 'Seiring berjalannya waktu, wilayah Batak mengalami perkembangan sosial dan ekonomi yang signifikan. Pertanian, perdagangan, dan industri menjadi pendorong utama pertumbuhan ekonomi di wilayah ini. Penduduk Batak terlibat dalam berbagai sektor ekonomi, baik sebagai petani, pedagang, atau pekerja industri.', 'perkembangansosial.jpeg'),
(8, 'Perkembangan Budaya dan Seni', 'Warisan budaya Batak kaya dan beragam, mencakup seni, musik, tarian, dan tradisi lisan. Seni dan budaya Batak mencerminkan nilai-nilai, kepercayaan, dan identitas mereka sebagai suku yang kuat dan mandiri. Meskipun terjadi modernisasi dan pengaruh luar, banyak elemen budaya dan seni tradisional Batak tetap dipelihara dan dilestarikan oleh masyarakat mereka', 'perkembanganseni.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sejarawan`
--

CREATE TABLE `sejarawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `asal` text NOT NULL,
  `jk` varchar(25) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sejarawan`
--

INSERT INTO `sejarawan` (`id`, `nama`, `tgl_lahir`, `asal`, `jk`, `deskripsi`, `foto`) VALUES
(1, 'Prof. Dr. Bambang Sugeng-Budiwiyono', '1945-04-14', ' Balige, Tapanuli Utara, Sumatera Utara.', 'Laki-laki', 'Salah satu karya terkenalnya adalah buku berjudul \"Batak Society and History\" yang dipublikasikan pada tahun 1984. Buku ini memberikan analisis mendalam tentang struktur sosial, kehidupan politik, dan perkembangan sejarah masyarakat Batak. Selain itu, Bambang Sugeng-Budiwiyono juga telah menulis banyak artikel dan makalah tentang sejarah dan budaya Batak yang telah banyak diakui dalam dunia akademis.', '1.png'),
(36, 'a', '2024-05-11', 'a', 'Laki-laki', 'a', 'http://192.168.0.100/kebudayaan_server/gambar_sejarawan/IMG_20240427_201903.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tradisi`
--

CREATE TABLE `tradisi` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `konten` text NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tradisi`
--

INSERT INTO `tradisi` (`id`, `judul`, `konten`, `gambar`) VALUES
(1, 'Martonggo Raja (Upacara Pemakaman Raja)', 'Martonggo Raja adalah salah satu tradisi penting dalam budaya Batak, khususnya di Tapanuli. Tradisi ini merupakan upacara pemakaman untuk para raja atau pemimpin adat yang dihormati. Martonggo Raja melibatkan prosesi yang sangat khusus dan seremonial, termasuk penggunaan ulos, gondang sabangunan, dan upacara adat lainnya. Selain sebagai penghormatan terakhir, Martonggo Raja juga menjadi momentum untuk memperkuat solidaritas dan persatuan dalam masyarakat Batak.', 'martonggoraja.jpeg'),
(2, 'Hasondotan (Tradisi Pertukaran Ulos)', 'Hasondotan adalah tradisi pertukaran ulos yang dilakukan dalam berbagai acara adat dan peristiwa penting, seperti pernikahan, pertemuan adat, atau kunjungan resmi. Pertukaran ulos dalam Hasondotan melambangkan hubungan kekerabatan, persahabatan, dan solidaritas antarindividu atau kelompok. Prosesi Hasondotan biasanya diiringi dengan doa dan ucapan syukur, serta merupakan bagian penting dari adat istiadat Batak.', 'hasondotan.jpeg'),
(3, 'Adat Batak Dalihan Na Tolu (Tradisi Keterkaitan Tiga Kali)', 'Adat Batak Dalihan Na Tolu adalah sistem kekerabatan tradisional suku Batak yang menekankan pentingnya keterkaitan antara tiga entitas, yaitu Tuhan, manusia, dan alam semesta. Konsep ini menekankan harmoni dan keseimbangan antara manusia dengan alam sekitarnya, serta keterhubungan manusia dengan Tuhan dan sesamanya. Adat Batak Dalihan Na Tolu mempengaruhi berbagai aspek kehidupan masyarakat Batak, termasuk sistem sosial, ekonomi, dan keagamaan.', 'dalihannatolu.jpeg'),
(4, 'Somba Marhula-Hula (Tradisi Pesta Panen)', 'Somba Marhula-Hula adalah tradisi pesta panen yang dilakukan oleh masyarakat Batak untuk merayakan hasil panen yang melimpah. Tradisi ini melibatkan berbagai kegiatan, seperti ritual keagamaan, tarian dan musik tradisional, serta pesta makan bersama. Somba Marhula-Hula tidak hanya sebagai ajang untuk merayakan kesuksesan dalam pertanian, tetapi juga sebagai wadah untuk mempererat hubungan antaranggota komunitas dan memperkokoh solidaritas sosial.', 'sombamarhulahula.jpeg'),
(5, 'Tendi (Tradisi Pertukaran Hadiah)', 'Tendi adalah tradisi pertukaran hadiah atau pemberian yang dilakukan dalam berbagai peristiwa penting dalam kehidupan masyarakat Batak, seperti pernikahan, pertemuan adat, atau acara perayaan lainnya. Pertukaran tendi biasanya melibatkan berbagai jenis barang atau benda yang memiliki nilai simbolis dan makna mendalam bagi penerima. Tradisi ini tidak hanya sebagai ungkapan rasa terima kasih atau penghormatan, tetapi juga sebagai sarana untuk mempererat hubungan sosial dan kekerabatan.', 'tendi.jpeg'),
(6, 'Udul Mekuji (Tradisi Pengucapan Syukur)', 'Udul Mekuji adalah tradisi pengucapan syukur yang dilakukan oleh masyarakat Batak sebagai ungkapan rasa terima kasih kepada Tuhan atas berkah dan rahmat-Nya. Tradisi ini sering dilakukan dalam berbagai acara adat dan keagamaan, seperti upacara pertanian, pernikahan, atau perayaan hari besar. Udul Mekuji melibatkan doa, nyanyian, dan ucapan syukur yang dilakukan secara bersama-sama oleh seluruh komunitas.', 'udulmekuji.jpeg'),
(7, 'Mangulosi (Tradisi Berkabung)', 'Mangulosi adalah tradisi berkabung yang dilakukan oleh masyarakat Batak sebagai ungkapan duka cita atas kepergian seseorang. Tradisi ini melibatkan berbagai kegiatan, seperti pemotongan rambut, pembersihan rumah, dan upacara adat yang dilakukan untuk menghormati dan mengenang orang yang telah meninggal. Mangulosi tidak hanya sebagai proses penyembuhan bagi keluarga yang ditinggalkan, tetapi juga sebagai wujud penghormatan terakhir kepada yang telah tiada.', 'mangulosi.jpeg'),
(8, 'Siraja Oloan (Tradisi Penobatan Raja)', 'Siraja Oloan adalah tradisi penobatan raja atau pemimpin adat dalam budaya Batak, terutama di Toba. Tradisi ini melibatkan serangkaian prosesi adat yang sangat seremonial, termasuk ritual keagamaan, upacara adat, dan pertunjukan tarian dan musik tradisional. Penobatan seorang raja dalam tradisi Siraja Oloan bukan hanya sebagai tindakan formal, tetapi juga sebagai pengakuan atas otoritas dan kekuasaan yang dimilikinya dalam menjaga kesatuan dan kedamaian masyarakat.', 'sirajaolahan.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `fullname`, `phone`, `email`, `password`) VALUES
(1, 'rizna y', '123456', '', '202cb962ac59075b964b07152d234b70'),
(2, 'a', '1', 'a@gmail.com', '202cb962ac59075b964b07152d234b70'),
(3, 'b', '123', 'b@gmail.com', '202cb962ac59075b964b07152d234b70'),
(4, 'c', '123', 'c@gmail.com', '202cb962ac59075b964b07152d234b70'),
(5, 'd', '123', 'd@gmail.com', '202cb962ac59075b964b07152d234b70'),
(6, 'riznaa', '123', 'riznaa@gmail.com', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Struktur dari tabel `warisanseni`
--

CREATE TABLE `warisanseni` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `konten` text NOT NULL,
  `gambar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `warisanseni`
--

INSERT INTO `warisanseni` (`id`, `judul`, `konten`, `gambar`) VALUES
(1, 'Tari Tortor (Tarian Tradisional Batak)', 'Tari Tortor adalah salah satu warisan seni yang paling ikonik dari budaya Batak. Tarian ini sering dianggap sebagai simbol kebanggaan dan identitas suku Batak. Tortor biasanya dipentaskan dalam berbagai acara adat, upacara keagamaan, dan perayaan kebudayaan. Gerakan dalam tarian Tortor sering kali diiringi oleh musik gondang sabangunan dan taganing, menciptakan ritme yang kuat dan memukau. Tari Tortor tidak hanya sebagai hiburan, tetapi juga sebagai medium untuk menyampaikan cerita-cerita mitologis, sejarah, dan nilai-nilai budaya Batak kepada generasi muda.', 'kerajaanbatak.jpeg'),
(2, 'Seni Ukir Kayu Batak', 'Seni ukir kayu adalah salah satu bentuk seni rupa tradisional yang berkembang pesat di kalangan masyarakat Batak. Ukiran kayu Batak sering ditemukan pada rumah adat, kapal, peralatan rumah tangga, dan berbagai artefak budaya lainnya. Motif-motif yang umum dalam seni ukir kayu Batak meliputi motif flora, fauna, geometris, dan motif-motif yang terinspirasi dari mitologi dan kepercayaan tradisional suku Batak. Setiap motif dan pola ukiran memiliki makna dan simbolisme yang dalam, mencerminkan kekayaan warisan budaya dan kepercayaan masyarakat Batak.', 'ukirkayu.jpeg'),
(3, 'Seni Tenun Ulos Batak', 'Seni tenun ulos adalah salah satu tradisi tenun yang paling terkenal di kalangan suku Batak. Ulos adalah kain tenun tradisional yang memiliki nilai simbolis yang sangat penting dalam budaya Batak. Proses pembuatan ulos melibatkan berbagai tahapan yang rumit, mulai dari persiapan benang hingga proses penenunan motif yang kompleks. Setiap motif pada ulos memiliki makna dan cerita yang kaya akan filosofi dan tradisi budaya Batak. Seni tenun ulos tidak hanya sebagai kegiatan praktis, tetapi juga sebagai bentuk seni dan ekspresi kreatif yang diwariskan dari generasi ke generasi.', 'ulos.jpeg'),
(4, 'Seni Patung Batak', 'Seni patung tradisional Batak mencakup berbagai bentuk patung yang terbuat dari berbagai bahan, termasuk kayu, batu, dan logam. Patung-patung Batak sering kali menggambarkan tokoh-tokoh mitologis, pahlawan, atau simbol-simbol keagamaan. Beberapa patung Batak juga memiliki fungsi ritual atau keagamaan, digunakan dalam berbagai upacara adat dan kegiatan keagamaan. Seni patung Batak mencerminkan kekayaan imajinasi dan keterampilan seni rupa masyarakat Batak yang telah berkembang selama berabad-abad.', 'sirajaolahan.jpeg'),
(5, 'Seni Anyaman Rotan Batak', 'Seni anyaman rotan merupakan salah satu bentuk seni kerajinan tangan tradisional yang sangat populer di kalangan suku Batak. Anyaman rotan digunakan untuk membuat berbagai macam produk, seperti keranjang, tas, tempat penyimpanan makanan, dan berbagai peralatan rumah tangga lainnya. Teknik anyaman yang digunakan oleh masyarakat Batak memiliki keunikan tersendiri, sering kali menghasilkan pola-pola yang rumit dan indah. Seni anyaman rotan tidak hanya sebagai bentuk seni praktis, tetapi juga sebagai wujud keahlian dan kreativitas masyarakat Batak dalam mengolah bahan alami menjadi produk yang berguna dan estetis.', 'anyaman.jpeg'),
(6, 'Seni Senjata Tradisional Batak', 'Seni senjata tradisional Batak mencakup berbagai jenis senjata yang digunakan dalam berbagai kegiatan pertempuran, olahraga, atau upacara adat. Contoh senjata tradisional Batak termasuk pedang, tombak, parang, dan berbagai jenis senjata tajam lainnya. Senjata-senjata ini sering dihiasi dengan ukiran-ukiran yang indah dan motif-motif tradisional Batak, menciptakan kombinasi antara kegunaan praktis dan keindahan seni rupa. Seni senjata tradisional Batak tidak hanya sebagai alat pertahanan, tetapi juga sebagai simbol keberanian, kehormatan, dan martabat suku Batak.', 'senjata.jpeg'),
(7, 'Seni Keramik Batak', 'Seni keramik merupakan salah satu warisan seni rupa yang kurang dikenal namun tak kalah penting dalam budaya Batak. Seni keramik Batak meliputi pembuatan berbagai jenis barang keramik, seperti vas, piring, mangkuk, dan berbagai hiasan rumah tangga lainnya. Pola dan motif yang digunakan dalam seni keramik Batak sering kali terinspirasi dari alam sekitar, mitologi, dan kepercayaan tradisional suku Batak. Meskipun produksi keramik tradisional Batak telah berkurang seiring dengan perkembangan industri, seni keramik tetap menjadi bagian penting dari warisan seni rupa Batak yang patut dilestarikan.', 'keramik.jpeg'),
(8, 'Seni Lukis Batik Batak', 'Seni lukis batik merupakan salah satu bentuk seni rupa yang berkembang pesat di kalangan masyarakat Batak. Lukisan batik Batak sering menggambarkan motif-motif tradisional, cerita-cerita mitologis, atau pemandangan alam yang khas. Proses pembuatan batik Batak melibatkan berbagai tahapan yang rumit, mulai dari penciptaan desain, pemberian lilin malam, pewarnaan, hingga proses finishing. Seni lukis batik Batak tidak hanya sebagai bentuk seni dekoratif, tetapi juga sebagai medium untuk menyampaikan cerita, nilai-nilai budaya, dan identitas suku Batak kepada dunia luar.', 'lukis.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `budaya`
--
ALTER TABLE `budaya`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sejarah`
--
ALTER TABLE `sejarah`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sejarawan`
--
ALTER TABLE `sejarawan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tradisi`
--
ALTER TABLE `tradisi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `warisanseni`
--
ALTER TABLE `warisanseni`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `budaya`
--
ALTER TABLE `budaya`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `sejarah`
--
ALTER TABLE `sejarah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `sejarawan`
--
ALTER TABLE `sejarawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `tradisi`
--
ALTER TABLE `tradisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `warisanseni`
--
ALTER TABLE `warisanseni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
