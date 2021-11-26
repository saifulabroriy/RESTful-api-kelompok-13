-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2021 at 05:59 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Tutorial', '2021-11-17 09:36:51'),
(2, 'Teknologi', '2021-11-17 09:36:51'),
(3, 'Web Development', '2021-11-17 09:36:51'),
(4, 'Pemrograman API', '2021-11-17 09:36:51'),
(5, 'PHP', '2021-11-17 09:36:51'),
(6, 'Python', '2021-11-17 09:39:46'),
(7, 'Javascript', '2021-11-17 09:40:07'),
(8, 'Cybersecurity', '2021-11-17 09:44:03'),
(9, 'Bash', '2021-11-17 09:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `category_id`, `title`, `body`, `author`, `created_at`) VALUES
(1, 5, 'Bahasa Pemrograman PHP (Hypertext Preprocessor)', 'PHP (PHP: Hypertext Preprocessor) adalah sebuah bahasa pemrograman server side scripting yang bersifat open source.Sebagai sebuah scripting language, PHP menjalankan instruksi pemrograman saat proses runtime. Hasil dari instruksi tentu akan berbeda tergantung data yang diproses.PHP merupakan bahasa pemrograman server-side, maka script dari PHP nantinya akan diproses di server. Jenis server yang sering digunakan bersama dengan PHP antara lain Apache, Nginx, dan LiteSpeed. Selain itu, PHP juga merupakan bahasa pemrograman yang bersifat open source. Pengguna bebas memodifikasi dan mengembangkan sesuai dengan kebutuhan mereka.', 'Saiful Abroriy', '2021-11-17 09:50:09'),
(2, 5, 'PHP OOP', 'Object Oriented Programming atau yang biasa di singkat OOP dalam bahasa PHP adalah suatu teknik / paradigma penulisan kode yang lebih terstruktur yang tertuju kepada suatu objek. Di dalam objek kita dapat menjalankan proses yang di inginkan maupun melakukan penyimpanan data. Pemrograman OOP juga terdapat di bahasa seperti Python dan Java. Di PHP sendiri dukungan yang di berikan untuk melakukan penulisan kode program beorientasi objek mulai dari versi PHP 5. Jadi bagi anda yang di Web Server nya di install PHP di bawah 5 tidak dapat di jalankan.', 'Saiful Abroriy', '2021-11-17 09:54:28'),
(3, 6, 'Pengertian Bahasa Pemrograman Python', 'Python adalah salah satu bahasa pemrograman yang dapat melakukan eksekusi sejumlah instruksi multi guna secara langsung (interpretatif) dengan metode orientasi objek (Object Oriented Programming) serta menggunakan semantik dinamis untuk memberikan tingkat keterbacaan syntax. Sebagian lain mengartikan Python sebagai bahasa yang kemampuan, menggabungkan kapabilitas, dan sintaksis kode yang sangat jelas, dan juga dilengkapi dengan fungsionalitas pustaka standar yang besar serta komprehensif. Walaupun Python tergolong bahasa pemrograman dengan level tinggi, nyatanya Python dirancang sedemikian rupa agar mudah dipelajari dan dipahami.', 'Aan Evian Nanda', '2021-11-17 09:58:03'),
(4, 6, 'Sejarah Python', 'Python dibuat dan dikembangkan oleh Guido Van Rossum, yaitu seorang programmer yang berasal dari Belanda. Pembuatannya berlangsung di kota Amsterdam, Belanda pada tahun 1990. Pada tahun 1995 Python dikembangkan lagi agar lebih kompatibel oleh Guido Van Rossum. Selanjutnya pada awal tahun 2000, terdapat pembaharuan versi Python hingga mencapai Versi 3 sampai saat ini. Pemilihan nama Python sendiri diambil dari sebuah acara televisi yang lumayan terkenal yang bernama Mothy Python Flying Circus yang merupakan acara sirkus favorit dari Guido van Rossum.', 'Aniisah Eka Rahmawati', '2021-11-17 09:58:03'),
(5, 3, 'Apa itu Web Development?', 'Web developer adalah seorang programmer yang membuat program dan aplikasi untuk world wide web. Seorang web developer tahu bagaimana cara membuat website dari nol, membuat kode custom jika memang Anda membutuhkan fitur khusus di website Anda, mengembangkan semua mulai dari layout website sampai fitur dan fungsi websitenya.', 'Saiful Abroriy', '2021-11-17 10:04:04'),
(6, 4, 'Apa itu API?', 'API atau Application Programming Interface adalah sebuah interface yang dapat menghubungkan aplikasi satu dengan aplikasi lainnya. Jadi, API berperan sebagai perantara antar berbagai aplikasi berbeda, baik dalam satu platform yang sama atau lintas platform.', 'Eka Zuni Selviana', '2021-11-17 10:04:04'),
(7, 8, 'Skill-Skill Cybersecurity', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore, obcaecati! Non odit vitae veniam molestias alias modi, sequi eligendi. Fuga maxime repudiandae saepe, est laudantium facilis minus fugit suscipit. Beatae quia unde doloribus perferendis voluptas porro voluptatibus. Cum at iure quidem quae rem dolorem, temporibus distinctio nostrum. Quos, tempora ipsum?', 'Saiful Abroriy', '2021-11-17 10:07:21'),
(8, 7, 'Manfaat Javascript Untuk Web', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore, obcaecati! Non odit vitae veniam molestias alias modi, sequi eligendi. Fuga maxime repudiandae saepe, est laudantium facilis minus fugit suscipit. Beatae quia unde doloribus perferendis voluptas porro voluptatibus. Cum at iure quidem quae rem dolorem, temporibus distinctio nostrum. Quos, tempora ipsum?', 'Saiful Abroriy', '2021-11-17 10:07:21'),
(9, 9, 'Perintah-Perintah Simpel Bash', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore, obcaecati! Non odit vitae veniam molestias alias modi, sequi eligendi. Fuga maxime repudiandae saepe, est laudantium facilis minus fugit suscipit. Beatae quia unde doloribus perferendis voluptas porro voluptatibus. Cum at iure quidem quae rem dolorem, temporibus distinctio nostrum. Quos, tempora ipsum?', 'Saiful Abroriy', '2021-11-17 10:07:21'),
(10, 1, 'Tutorial Django Python', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Inventore, obcaecati! Non odit vitae veniam molestias alias modi, sequi eligendi. Fuga maxime repudiandae saepe, est laudantium facilis minus fugit suscipit. Beatae quia unde doloribus perferendis voluptas porro voluptatibus. Cum at iure quidem quae rem dolorem, temporibus distinctio nostrum. Quos, tempora ipsum?', 'Saiful Abroriy', '2021-11-17 10:07:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
