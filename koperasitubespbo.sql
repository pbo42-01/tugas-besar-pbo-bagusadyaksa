-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2019 at 09:01 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasitubespbo`
--

-- --------------------------------------------------------

--
-- Table structure for table `koperasi`
--

CREATE TABLE `koperasi` (
  `idKoperasi` int(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(40) NOT NULL,
  `noTlpn` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `idNasabah` int(5) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `alamat` varchar(45) NOT NULL,
  `NIK` int(25) NOT NULL,
  `tglLahir` date NOT NULL,
  `idKoperasi` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `idPinjam` int(5) NOT NULL,
  `namaPinjaman` varchar(15) NOT NULL,
  `jmlhPinjaman` int(20) NOT NULL,
  `tglPinjam` date NOT NULL,
  `idNasabah` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `simpan`
--

CREATE TABLE `simpan` (
  `idSimpanan` int(5) NOT NULL,
  `tglSimpan` date NOT NULL,
  `namaSimpan` varchar(15) NOT NULL,
  `jumlahSimpan` int(25) NOT NULL,
  `idNasabah` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `koperasi`
--
ALTER TABLE `koperasi`
  ADD PRIMARY KEY (`idKoperasi`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`idNasabah`),
  ADD KEY `fk_noor` (`idKoperasi`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`idPinjam`),
  ADD KEY `fkk_noor` (`idNasabah`);

--
-- Indexes for table `simpan`
--
ALTER TABLE `simpan`
  ADD PRIMARY KEY (`idSimpanan`),
  ADD KEY `fkkk_noor` (`idNasabah`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD CONSTRAINT `fk_noor` FOREIGN KEY (`idKoperasi`) REFERENCES `koperasi` (`idKoperasi`);

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `fkk_noor` FOREIGN KEY (`idNasabah`) REFERENCES `nasabah` (`idNasabah`);

--
-- Constraints for table `simpan`
--
ALTER TABLE `simpan`
  ADD CONSTRAINT `fkkk_noor` FOREIGN KEY (`idNasabah`) REFERENCES `nasabah` (`idNasabah`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
