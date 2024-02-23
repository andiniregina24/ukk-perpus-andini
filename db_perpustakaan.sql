-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2024 at 01:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `BukuID` int(11) NOT NULL,
  `Sampul` varchar(255) NOT NULL,
  `Judul` varchar(255) NOT NULL,
  `Penulis` varchar(255) NOT NULL,
  `Penerbit` varchar(255) NOT NULL,
  `TahunTerbit` int(11) NOT NULL,
  `KategoriID` int(11) DEFAULT NULL,
  `DeskripsiBuku` text DEFAULT NULL,
  `Stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`BukuID`, `Sampul`, `Judul`, `Penulis`, `Penerbit`, `TahunTerbit`, `KategoriID`, `DeskripsiBuku`, `Stok`) VALUES
(10, 'assasination classroom.jpg', 'Assasination Classroom', 'Yuusei Matsui', 'Jakarta : Program Studi Pendidikan Bahasa Jepang FBS UNJ', 2017, 13, 'mengisahkan tentang kehidupan sehari-hari dari seorang makhluk mirip gurita berkekuatan luar biasa yang bekerja sebagai seorang wali kelas di sebuah sekolah menengah pertama, dan para siswa didiknya berusaha membunuhnya demi melindungi Bumi dari kehancuran. Para siswa ini dianggap \"tidak pantas\" berada di sekolah mereka dan juga diberikan pelajaran di gedung terpisah.', 50),
(11, 'laskar pelangi.jpg', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', 2015, 1, 'Menceritakan kehidupan 10 anak yang tidak mampu, tetapi memiliki semangat juang untuk melanjutkan pendidikannya di kampung Gantung, Kepulauan Bangka Belitung. Sebagian besar dari kesepuluh anak yang menempuh pendidikan di SD Muhammadiyah Gantung merupakan anak dari para penambang timah di pulau dengan perolehan kekayaan alam timah yang terbesar di dunia.', 50),
(14, 'sejarah dunia.jpg', 'Sejarah Dunia Yang Disembunyikan', 'Jonathan Black', 'Alvabeta', 2015, 18, 'Merupakan buku yang mengungkapkan tentang keraguan dan kepercayaan kita akan sejarah mitologi Yunani dan Mesir Kuno serta cerita rakyat Yahudi yang tidak dapat kita lihat langsung kebenarannya. Buku ini ditulis dengan tujuan memberitahu pembaca tentang fakta dasar sejarah yang berbeda dari yang kita tahu. Pembaca akan mendapatkan pengetahuan baru dan lebih tercerahkan akan wawasan sejarah dunia.', 25),
(15, 'jokoway.jpg', 'Jokoway : Jalan Kepemimpinan Jokowi', 'Eko Sulistiyo', 'Moka Media', 2019, 15, 'Sebagai seorang â€œPemimpin pasca-eliteâ€, Jokowi secara struktural harus memperlihatkan watak kepemimpinan tertentu, yang bukan merupakan reperkusi atau pengulangan dari tradisi elite. Di dalam beberapa hal, pawai rakyat yang menyertai Jokowi ke istana, selepas dari dilantik di Majelis Permusyawaratan Rakyat (MPR), bisa kita lihat sebagai peristiwa â€œAntropologisâ€ yang merefleksikan penyatuan pemimpin dengan rakyat.', 25),
(22, 'memory police.jpg', 'The Memory Police', 'Yoko Ogawa', 'Gramedia Pustaka Utama', 2020, 4, 'Kenangan merupakan hal yang begitu esensial bagi manusia. Kenangan dapat membuat kita mengingat berbagai macam peristiwa dalam ingatan. Namun apa jadinya jika manusia kehilangan ingatannya, bahkan akan hal-hal yang sederhana?\r\nBagaimana rasanya jika tidak dapat mengingat boneka? Atau seperti apa benda yang disebut mainan? Benda tersebut ada namun ingatan akan benda itu perlahan memudar, beserta kenangan yang menyertainya.', 30);

-- --------------------------------------------------------

--
-- Table structure for table `kategoribuku`
--

CREATE TABLE `kategoribuku` (
  `KategoriID` int(11) NOT NULL,
  `NamaKategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kategoribuku`
--

INSERT INTO `kategoribuku` (`KategoriID`, `NamaKategori`) VALUES
(1, 'Novel'),
(4, 'Fiksi ilmiah'),
(5, 'Geografi'),
(6, 'Biologi'),
(9, 'Kimia'),
(10, 'Cerpen'),
(13, 'Komik'),
(15, 'Biografi'),
(18, 'Sejarah');

-- --------------------------------------------------------

--
-- Table structure for table `koleksipribadi`
--

CREATE TABLE `koleksipribadi` (
  `KoleksiID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `PeminjamanID` int(11) NOT NULL,
  `KodePinjam` char(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `TanggalPeminjaman` date NOT NULL,
  `TanggalPengembalian` date NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `StatusPeminjaman` enum('dipinjam','dikembalikan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`PeminjamanID`, `KodePinjam`, `UserID`, `BukuID`, `TanggalPeminjaman`, `TanggalPengembalian`, `Jumlah`, `StatusPeminjaman`) VALUES
(10, 'PMB001', 10, 10, '2024-02-12', '2024-02-19', 1, 'dikembalikan'),
(11, 'PMB002', 11, 10, '2024-02-12', '2024-02-19', 2, 'dikembalikan'),
(12, 'PMB003', 16, 11, '2024-02-05', '2024-02-12', 1, 'dikembalikan'),
(14, 'PMB004', 10, 10, '2024-02-05', '2024-02-12', 1, 'dikembalikan'),
(18, 'PMB005', 14, 11, '2024-02-12', '2024-02-19', 2, 'dikembalikan'),
(19, 'PMB006', 10, 10, '2024-02-08', '2024-02-15', 1, 'dikembalikan'),
(20, 'PMB007', 10, 14, '2024-02-08', '2024-02-15', 1, 'dikembalikan'),
(21, 'PMB008', 10, 10, '2024-02-12', '2024-02-19', 1, 'dikembalikan');

--
-- Triggers `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `kembali_buku` AFTER UPDATE ON `peminjaman` FOR EACH ROW begin 
update buku set Stok = Stok+old.Jumlah
where BukuID = old.BukuID;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tambah_buku` AFTER INSERT ON `peminjaman` FOR EACH ROW BEGIN 
UPDATE buku set Stok = Stok - new.Jumlah
WHERE BukuID = new.BukuID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ulasanbuku`
--

CREATE TABLE `ulasanbuku` (
  `UlasanID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `BukuID` int(11) NOT NULL,
  `Ulasan` text NOT NULL,
  `Rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ulasanbuku`
--

INSERT INTO `ulasanbuku` (`UlasanID`, `UserID`, `BukuID`, `Ulasan`, `Rating`) VALUES
(29, 10, 10, 'Cerita yang sangat menarik, recomended!', 9),
(30, 11, 10, 'Kalian wajib baca pokoknya!', 10),
(31, 16, 11, 'Menarik untuk dibaca', 8),
(32, 14, 11, 'Bagusss Bgt!', 10),
(33, 13, 22, 'Rekomendasi bgt ', 7);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `NamaLengkap` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `level` enum('admin','petugas','peminjam') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Username`, `Password`, `Email`, `NamaLengkap`, `Alamat`, `level`) VALUES
(5, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'Admin Perpus', 'Jl. kebangsaan ', 'admin'),
(10, 'andini', 'b3e0d57ba78cbdc6fcba9c7a467e8fad', 'andini@gmail.com', 'Andini Regina', 'Bandung Barat', 'peminjam'),
(11, 'akhdalna', '5aa0e17f61dfa2f6365a1301476285ae', 'dae@gmail.com', 'Akhda Layalia', 'Citapen', 'peminjam'),
(13, 'sitikmrh', 'db04eb4b07e0aaf8d1d477ae342bdff9', 'siti@gmail.com', 'Siti Komariah', 'Pasir Paku', 'peminjam'),
(14, 'fadelia', '764d36f3e1aaed6ccd3e1bdac39502f6', 'lia@gmail.com', 'Fadelia Putri', 'Jl. Asia ', 'peminjam'),
(15, 'petugas', 'afb91ef692fd08c445e8cb1bab2ccf9c', 'petugas@gmail.com', 'Petugas perpus', 'Cisarua', 'petugas'),
(16, 'aul', '950a5e3732fd173428154f84954a82b7', 'aul@gmail.com', 'Aulia', 'Galanggang', 'peminjam'),
(17, 'peminjam', '55f3894bc5fc71fead8412d321c2952c', 'peminjam@gmail.com', 'peminjam', 'jl. ppp', 'peminjam');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`BukuID`),
  ADD KEY `KategoriID` (`KategoriID`);

--
-- Indexes for table `kategoribuku`
--
ALTER TABLE `kategoribuku`
  ADD PRIMARY KEY (`KategoriID`);

--
-- Indexes for table `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD PRIMARY KEY (`KoleksiID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`PeminjamanID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indexes for table `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD PRIMARY KEY (`UlasanID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BukuID` (`BukuID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `BukuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `kategoribuku`
--
ALTER TABLE `kategoribuku`
  MODIFY `KategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  MODIFY `KoleksiID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `PeminjamanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  MODIFY `UlasanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`KategoriID`) REFERENCES `kategoribuku` (`KategoriID`);

--
-- Constraints for table `koleksipribadi`
--
ALTER TABLE `koleksipribadi`
  ADD CONSTRAINT `koleksipribadi_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`);

--
-- Constraints for table `ulasanbuku`
--
ALTER TABLE `ulasanbuku`
  ADD CONSTRAINT `ulasanbuku_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `ulasanbuku_ibfk_2` FOREIGN KEY (`BukuID`) REFERENCES `buku` (`BukuID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
