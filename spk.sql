-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
-- GILANG RAMADHAN NUGRAHA
-- Host: 127.0.0.1
-- Generation Time: May 05, 2019 at 05:26 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spk`
--

-- --------------------------------------------------------

--
-- Table structure for table `alternative`
--

CREATE TABLE `alternative` (
  `id_alternative` smallint(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alternative`
--

INSERT INTO `alternative` (`id_alternative`, `name`) VALUES
(1, 'Aggun'),
(2, 'Karim'),
(3, 'Sahammudin'),
(4, 'Juman'),
(5, 'Heri'),
(6, 'Dea'),
(7, 'Siska'),
(8, 'Ananda'),
(9, 'Sukma'),
(10, 'Riska');

-- --------------------------------------------------------

--
-- Table structure for table `evaluasi`
--

CREATE TABLE `evaluasi` (
  `id_alternative` smallint(10) UNSIGNED NOT NULL,
  `id_kriteria` tinyint(5) UNSIGNED NOT NULL,
  `value` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evaluasi`
--

INSERT INTO `evaluasi` (`id_alternative`, `id_kriteria`, `value`) VALUES
(1, 1, 45),
(1, 2, 71),
(1, 3, 43),
(1, 4, 4),
(1, 5, 27),
(2, 1, 65),
(2, 2, 33),
(2, 3, 35),
(2, 4, 3),
(2, 5, 49),
(3, 1, 71),
(3, 2, 28),
(3, 3, 57),
(3, 4, 5),
(3, 5, 35),
(4, 1, 35),
(4, 2, 39),
(4, 3, 49),
(4, 4, 4),
(4, 5, 25),
(5, 1, 50),
(5, 2, 25),
(5, 3, 51),
(5, 4, 1),
(5, 5, 67),
(6, 1, 79),
(6, 2, 20),
(6, 3, 35),
(6, 4, 3),
(6, 5, 69),
(7, 1, 63),
(7, 2, 38),
(7, 3, 29),
(7, 4, 2),
(7, 5, 38),
(8, 1, 37),
(8, 2, 66),
(8, 3, 37),
(8, 4, 3),
(8, 5, 21),
(9, 1, 29),
(9, 2, 21),
(9, 3, 63),
(9, 4, 4),
(9, 5, 50),
(10, 1, 33),
(10, 2, 49),
(10, 3, 28),
(10, 4, 3),
(10, 5, 79);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` tinyint(5) UNSIGNED NOT NULL,
  `kriteria` varchar(100) NOT NULL,
  `bobot` float NOT NULL,
  `atribut` set('benefit','cost') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `kriteria`, `bobot`, `atribut`) VALUES
(1, 'Prestasi', 0.35, 'benefit'),
(2, 'Jabatan', 0.25, 'benefit'),
(3, 'Absensi', 0.15, 'benefit'),
(4, 'Lama Kerja', 0.15, 'benefit'),
(5, 'loyalitas', 0.1, 'benefit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alternative`
--
ALTER TABLE `alternative`
  ADD PRIMARY KEY (`id_alternative`);

--
-- Indexes for table `evaluasi`
--
ALTER TABLE `evaluasi`
  ADD PRIMARY KEY (`id_alternative`,`id_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alternative`
--
ALTER TABLE `alternative`
  MODIFY `id_alternative` smallint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `evaluasi`
--
ALTER TABLE `evaluasi`
  ADD CONSTRAINT `evaluasi_ibfk_1` FOREIGN KEY (`id_alternative`) REFERENCES `alternative` (`id_alternative`),
  ADD CONSTRAINT `evaluasi_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
