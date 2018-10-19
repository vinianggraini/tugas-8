-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2018 at 06:23 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL,
  `judul_artikel` varchar(100) NOT NULL,
  `isi_artikel` text NOT NULL,
  `author_artikel` varchar(50) NOT NULL,
  `tanggal_artikel` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id_artikel`, `judul_artikel`, `isi_artikel`, `author_artikel`, `tanggal_artikel`, `id_kategori`) VALUES
(6, 'Hari Kopi Internasional', 'Entah sejak kapan tepatnya saya mulai mencecap kopi. Berawal dari kebiasaan sang Mama yang suka meminum kopi, sepertinya masa SMA mungkin, perkenalan saya dengan kopi terjadi. Ya, hanya sekedar kopi biasa, kopi sachet yang banyak tersedia di warung-warung, bukan kopi yang tersedia di berbagai kedai kopi seperti tren saat ini. Perjalanan kopi buat saya awalnya biasa saja. Sampai akhirnya, kopi dan kata menjadi satu rangkaian rasa yang tidak bisa dilepaskan lagi. ', 'Vini Anggraini', '2018-10-18 13:44:43', 1),
(7, 'Memaksimalkan Peran di Era Digital Dengan Laptop ASUS', 'â€œJika apa yang kutuliskan mampu membius, maka kupastikan itu muncul dari pemikirian serius. Bukan karena aku sosok jenius, hanya sajaâ€¦ kalimat-kalimatku mudah tersampaikan dengan Laptop Asus.â€ Wuiii, awal paragraph bawaannya sudah puitis, ya. Sebagai seorang Feeling Introvert, saya memang senang merangkai kata, terlebih jika sifatnya diksi atau fiksi. Buat saya, kata-kata yang tersusun dengan indah itu, mampu membawa pembaca ke dalam imajinasi lain, sesuai dengan pemikirannya.', 'Vini Anggraini', '2018-10-18 15:21:58', 2),
(8, '[Thank You I Learn] Belajar Memahami', 'â€œOmbak di lautan saja, bisa memecahkan batu di pinggir pantai, lalu, kenapa hatimu bergitu keras?â€ Ini semacam pikiran yang kerap kali berlair-lari dalam otak saya. Saya sedang belajar memahami apa-apa yang saat ini Allah berikan kepada saya, terlebih lagi jika hal tersebut bertentangan dengan nurani saya. Well, bahasan kali ini ingin saya bagi, karena selama ini saya banyak belajar dari proses kehidupan, terkhusus dari segala kesalahan-kesalahan saya.', 'Vini Anggraini', '2018-10-19 14:37:44', 2),
(9, 'Ristra, Rangkaian Cantik Untuk Perempuan Aktif', 'Assalamualaikum, haey... Kali ini saya mau ngomongin kecantikan aka kosmetik, ya. Eh, kok tumben? Iya, sesekali boleh lah ya. Karena perempuan mah enggak jauh-jauh dari urusan cantik, which is kosmetik. Nah, kebetulan sudah hampir 3 minggu ini saya menggunakan rangkaian produk dari Ristra Cosmetodermatology dan RISTRA Decorative Series. Alhamdulillah, setelah 3 minggu dicoba, cucok sis. Cirinya ya gampang, kulit wajah saya masih aman, enggak bruntusan, dan terasa lebih lembut. ', 'Vini Anggraini', '2018-10-19 14:39:43', 3),
(10, 'Tentang Pose Yoga', 'Bicara soal olahraga yoga, harus saya akui kalau olahraga satu ini teramat membuat saya jatuh hati. Namun bagi sebagian orang, olahraga ini akan membosankan, karena gerakan-gerakannya selow. Itâ€™s oke, kan setiap orang punya hak untuk sukanya di bidang apa. Pun dalam menentukan kategori olahraga. Intinya, olahraga apapun, itu lebih baik, daripada tidak sama sekali. Sepakat?', 'Vini Anggraini', '2018-10-19 14:44:29', 4);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Hiburan'),
(2, 'Motifasi'),
(3, 'Kecantikan'),
(4, 'Kesehatan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id_artikel`),
  ADD KEY `RELASI_KATEGORI` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id_artikel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artikel`
--
ALTER TABLE `artikel`
  ADD CONSTRAINT `RELASI_KATEGORI` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
