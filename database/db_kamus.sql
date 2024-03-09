-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2024 at 02:36 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kamus`
--

-- --------------------------------------------------------

--
-- Table structure for table `words`
--

CREATE TABLE `words` (
  `id` int(11) NOT NULL,
  `hanzi` varchar(50) NOT NULL,
  `pengucapan` varchar(50) NOT NULL,
  `terjemahan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `words`
--

INSERT INTO `words` (`id`, `hanzi`, `pengucapan`, `terjemahan`) VALUES
(1, '你好', 'Nǐ hǎo', 'Hai / Halo'),
(2, '你叫什么名字', 'Nǐ jiào shénme míngzì', 'Siapa namamu?'),
(3, '谢谢', 'Xièxiè', 'Terima kasih'),
(4, '再见', 'Zàijiàn', 'Selamat tinggal'),
(5, '再见', 'Zàijiàn!', 'Sampai jumpa'),
(6, '好了', 'Hǎo le', 'Baiklah'),
(7, '加油', 'Jiāyóu', 'Semangat'),
(8, '救命', 'Jiùmìng', 'Tolong'),
(9, '下午', 'xià wǔ', 'Siang/Sore'),
(10, '迟到', 'chí dào', 'Terlambat'),
(11, '准时', 'zhǔn shí', 'Tepat waktu'),
(12, '堵车', 'dǔ chē', 'Macet'),
(13, '这边', 'zhè biān', 'Sebelah sini'),
(14, '请问', 'qǐng wèn', 'Mohon tanya / permisi'),
(15, '早', 'zǎo', 'Pagi'),
(16, '晚安', 'wǎn’ān', 'Selamat malam'),
(17, '对不起', 'Duìbùqǐ', 'Maaf (Ketika merasa sangat bersalah)'),
(18, '你在幹嘛', 'Nǐ zài gàn ma', 'Kamu sedang apa?'),
(19, '很高兴认识你', 'Hěn gāoxìng rènshí nǐ', 'Senang berkenalan denganmu'),
(20, '我能帮助你吗', 'Wǒ néng bāngzhù nǐ ma?', 'Ada yang bisa saya bantu?'),
(21, '迟到', 'chí dào', 'Terlambat'),
(22, '准时', 'zhǔn shí', 'Tepat waktu'),
(23, '饭馆（儿）', 'fàn guǎn(ér)', 'Restoran'),
(24, '坐', 'zuò', 'Duduk'),
(25, '什么 ?', 'Shenme?', 'Apa?'),
(26, '祝你生日快乐！', 'Zhù nǐ shēngrì kuàilè!', 'Selamat berulang tahun'),
(27, '多保重！', 'Duō bǎozhòng!', 'Jaga diri baik-baik!'),
(28, '当然可以', 'Dāngrán kěyǐ', 'Tentu saja, bisa'),
(29, '别客氣', 'Bié kèqi', 'Jangan sungkan'),
(30, '放鬆 !', 'Fàngsōng!', 'Relaks/santai!'),
(31, '现在', 'Xiànzài', 'Sekarang'),
(32, '迟到', 'Chídào', 'Terlambat'),
(33, '包裹', 'Bāoguǒ', 'Dibungkus'),
(34, '贵', 'guì', 'Mahal/berharga'),
(35, '星期四', 'Xīngqī sì', 'kamis'),
(36, '星期五', 'Xīngqī wǔ ', 'Jumat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `words`
--
ALTER TABLE `words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
