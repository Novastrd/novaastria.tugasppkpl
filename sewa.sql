-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Des 2021 pada 04.01
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sewa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bayar`
--

CREATE TABLE `bayar` (
  `id_bayar` int(11) NOT NULL,
  `id_sewa` int(11) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `status_bayar` enum('Lunas','DP') NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `kurang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `bayar`
--

INSERT INTO `bayar` (`id_bayar`, `id_sewa`, `tgl_bayar`, `status_bayar`, `total_bayar`, `kurang`) VALUES
(13, 17, '2021-12-07', 'Lunas', 10000000, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jaminan`
--

CREATE TABLE `jaminan` (
  `id_jaminan` int(11) NOT NULL,
  `jenis_jaminan` enum('STNK Motor','KTP') NOT NULL,
  `no_jaminan` varchar(20) NOT NULL,
  `atas_nama` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jaminan`
--

INSERT INTO `jaminan` (`id_jaminan`, `jenis_jaminan`, `no_jaminan`, `atas_nama`) VALUES
(19, 'KTP', '3245232', 'rico');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(11) NOT NULL,
  `no_polisi` char(10) NOT NULL,
  `merek` varchar(20) NOT NULL,
  `jenis` enum('Matic','Manual') NOT NULL,
  `warna` varchar(15) NOT NULL,
  `status_mobil` enum('Disewa','Tidak Disewa') NOT NULL DEFAULT 'Tidak Disewa',
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `no_polisi`, `merek`, `jenis`, `warna`, `status_mobil`, `harga`) VALUES
(9, '21', 'w', 'Manual', 'w', 'Disewa', 222);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_sewa` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `denda` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyewa`
--

CREATE TABLE `penyewa` (
  `id_penyewa` int(11) NOT NULL,
  `nama_penyewa` varchar(45) DEFAULT NULL,
  `alamat_penyewa` varchar(45) DEFAULT NULL,
  `notlp_penyewa` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penyewa`
--

INSERT INTO `penyewa` (`id_penyewa`, `nama_penyewa`, `alamat_penyewa`, `notlp_penyewa`) VALUES
(7, 'rico', 'indramayu', '2143');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sewa`
--

CREATE TABLE `sewa` (
  `id_sewa` int(11) NOT NULL,
  `id_mobil` int(11) NOT NULL,
  `id_penyewa` int(11) NOT NULL,
  `id_sopir` int(11) DEFAULT NULL,
  `id_jaminan` int(11) NOT NULL,
  `tgl_sewa` date NOT NULL,
  `lama_sewa` int(11) NOT NULL,
  `harga_sewa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sewa`
--

INSERT INTO `sewa` (`id_sewa`, `id_mobil`, `id_penyewa`, `id_sopir`, `id_jaminan`, `tgl_sewa`, `lama_sewa`, `harga_sewa`) VALUES
(17, 9, 7, 5, 19, '2021-12-07', 30, 56660);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sopir`
--

CREATE TABLE `sopir` (
  `id_sopir` int(11) NOT NULL,
  `nama_sopir` varchar(45) DEFAULT NULL,
  `alamat_sopir` varchar(45) DEFAULT NULL,
  `no_tlp_sopir` char(13) NOT NULL,
  `status_sopir` enum('Disewa','Tidak Disewa') NOT NULL DEFAULT 'Tidak Disewa'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sopir`
--

INSERT INTO `sopir` (`id_sopir`, `nama_sopir`, `alamat_sopir`, `no_tlp_sopir`, `status_sopir`) VALUES
(5, 'miftah', 'paoman', '24332', 'Disewa');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bayar`
--
ALTER TABLE `bayar`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `id_bayar` (`id_bayar`),
  ADD KEY `id_sewa` (`id_sewa`);

--
-- Indeks untuk tabel `jaminan`
--
ALTER TABLE `jaminan`
  ADD PRIMARY KEY (`id_jaminan`),
  ADD KEY `id_jaminan` (`id_jaminan`);

--
-- Indeks untuk tabel `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`),
  ADD KEY `id_mobil` (`id_mobil`);

--
-- Indeks untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `id_pengembalian` (`id_pengembalian`),
  ADD KEY `id_sewa` (`id_sewa`);

--
-- Indeks untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  ADD PRIMARY KEY (`id_penyewa`),
  ADD KEY `id_penyewa` (`id_penyewa`);

--
-- Indeks untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `id_sewa` (`id_sewa`),
  ADD KEY `id_penyewa` (`id_penyewa`),
  ADD KEY `id_mobil` (`id_mobil`),
  ADD KEY `id_sopir` (`id_sopir`),
  ADD KEY `id_jaminan` (`id_jaminan`);

--
-- Indeks untuk tabel `sopir`
--
ALTER TABLE `sopir`
  ADD PRIMARY KEY (`id_sopir`),
  ADD KEY `id_sopir` (`id_sopir`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bayar`
--
ALTER TABLE `bayar`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `jaminan`
--
ALTER TABLE `jaminan`
  MODIFY `id_jaminan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `mobil`
--
ALTER TABLE `mobil`
  MODIFY `id_mobil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `penyewa`
--
ALTER TABLE `penyewa`
  MODIFY `id_penyewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id_sewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `sopir`
--
ALTER TABLE `sopir`
  MODIFY `id_sopir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bayar`
--
ALTER TABLE `bayar`
  ADD CONSTRAINT `bayar_ibfk_1` FOREIGN KEY (`id_sewa`) REFERENCES `sewa` (`id_sewa`);

--
-- Ketidakleluasaan untuk tabel `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_sewa`) REFERENCES `sewa` (`id_sewa`);

--
-- Ketidakleluasaan untuk tabel `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`id_jaminan`) REFERENCES `jaminan` (`id_jaminan`),
  ADD CONSTRAINT `sewa_ibfk_2` FOREIGN KEY (`id_penyewa`) REFERENCES `penyewa` (`id_penyewa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sewa_ibfk_3` FOREIGN KEY (`id_sopir`) REFERENCES `sopir` (`id_sopir`),
  ADD CONSTRAINT `sewa_ibfk_4` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id_mobil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
