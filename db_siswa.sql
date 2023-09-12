-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2023 at 05:59 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_siswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`) VALUES
(1, 'SASTRA'),
(2, 'SASTRA'),
(4, 'IPA');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id` int(11) NOT NULL,
  `nama_kota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id`, `nama_kota`) VALUES
(1, 'Balikpapan'),
(2, 'Banjarmasin'),
(3, 'Surabaya'),
(4, 'Medan'),
(5, 'Surabaya');

-- --------------------------------------------------------

--
-- Table structure for table `orangtua`
--

CREATE TABLE `orangtua` (
  `id` int(11) NOT NULL,
  `nama_ayah` varchar(50) NOT NULL,
  `nama_ibu` varchar(50) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kota_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orangtua`
--

INSERT INTO `orangtua` (`id`, `nama_ayah`, `nama_ibu`, `no_hp`, `alamat`, `kota_id`) VALUES
(1, 'Agus', 'Sinta', '4545454', 'jl.karang anyar no.11', 1),
(2, 'Syarif', 'Fia', '7875', 'jl.batu butok no.3', 2),
(3, 'supri', 'siska', '87485142566', 'ioswjmkldsmkn', 3),
(6, 'idris', 'siti', '865454', 'fdbvcbvcb', 1),
(7, 'Adam', 'Aisyah', '8974542', 'jl.kurang', 4);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `orangtua_id` int(11) NOT NULL,
  `kota_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nama`, `jenis_kelamin`, `no_hp`, `alamat`, `kelas_id`, `orangtua_id`, `kota_id`) VALUES
(2, 'Dino', 'L', '8796512', 'jl.bali ', 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`) VALUES
(1, 'Satria', 'satria', 'f865b53623b121fd34ee5426c792e5c33af8c227');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orangtua`
--
ALTER TABLE `orangtua`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kota_id` (`kota_id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `orangtua_id` (`orangtua_id`),
  ADD KEY `kota_id` (`kota_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orangtua`
--
ALTER TABLE `orangtua`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orangtua`
--
ALTER TABLE `orangtua`
  ADD CONSTRAINT `orangtua_ibfk_1` FOREIGN KEY (`kota_id`) REFERENCES `kota` (`id`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`),
  ADD CONSTRAINT `siswa_ibfk_2` FOREIGN KEY (`orangtua_id`) REFERENCES `orangtua` (`id`),
  ADD CONSTRAINT `siswa_ibfk_3` FOREIGN KEY (`kota_id`) REFERENCES `kota` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
