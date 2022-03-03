-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2022 at 11:35 PM
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
-- Database: `pasien`
--

-- --------------------------------------------------------

--
-- Table structure for table `daerah`
--

CREATE TABLE `daerah` (
  `id` int(11) NOT NULL,
  `kota` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daerah`
--

INSERT INTO `daerah` (`id`, `kota`) VALUES
(1, 'pekanbaru'),
(2, 'dumai');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `ttl` varchar(255) NOT NULL,
  `no_hp` varchar(255) NOT NULL,
  `jenis_kelamin` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `dokter` varchar(255) NOT NULL,
  `pembiayaan` varchar(255) NOT NULL,
  `tanggal_konsultasi_kembali` date NOT NULL,
  `pakai_baju_warna` varchar(255) NOT NULL,
  `vaksin` int(11) NOT NULL,
  `rumah_sakit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id`, `tanggal_masuk`, `nama`, `alamat`, `ttl`, `no_hp`, `jenis_kelamin`, `status`, `dokter`, `pembiayaan`, `tanggal_konsultasi_kembali`, `pakai_baju_warna`, `vaksin`, `rumah_sakit`) VALUES
(1, '2022-03-04', 'budiman', 'Jl.kartini', 'pekanbaru, 27 sep 1979', '08127501295', 'Pria', 'OTG', 'dr. Budi', 'pribadi', '2022-03-14', 'Hijau', 1, 4),
(2, '2022-03-02', 'susi', 'Jl.Surabaya', 'Mojokerto, 1 jan 1975', '08237568399', 'Wanita', 'Positif', 'dr. Sari', 'BPJS', '2022-03-14', 'Biru', 2, 4),
(3, '2022-03-04', 'Parto', 'jl.teratai', 'bekasi, 12 mar 1965', '08261728344', 'Pria', 'OTG', 'dr.kris', 'prudential', '2022-03-14', 'Kuning', 0, 5),
(4, '2022-03-04', 'Candra', 'jl.Semeru', 'banten, 12 okt 1955', '08261748344', 'Pria', 'Positif', 'dr.marjo', 'Pribadi', '2022-03-14', 'Abu-abu', 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `rumah_sakit`
--

CREATE TABLE `rumah_sakit` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `daerah_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rumah_sakit`
--

INSERT INTO `rumah_sakit` (`id`, `nama`, `daerah_id`) VALUES
(4, 'santa maria', 1),
(5, 'awal bros', 1),
(6, 'rsud dumai', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daerah`
--
ALTER TABLE `daerah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rumah_sakit` (`rumah_sakit`);

--
-- Indexes for table `rumah_sakit`
--
ALTER TABLE `rumah_sakit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daerah_id` (`daerah_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daerah`
--
ALTER TABLE `daerah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rumah_sakit`
--
ALTER TABLE `rumah_sakit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`rumah_sakit`) REFERENCES `rumah_sakit` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rumah_sakit`
--
ALTER TABLE `rumah_sakit`
  ADD CONSTRAINT `rumah_sakit_ibfk_1` FOREIGN KEY (`daerah_id`) REFERENCES `daerah` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
