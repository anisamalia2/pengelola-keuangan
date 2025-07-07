-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Waktu pembuatan: 07 Jul 2025 pada 18.42
-- Versi server: 8.0.42
-- Versi PHP: 8.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rpl`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `idNotifikasi` int NOT NULL,
  `idPengguna` int DEFAULT NULL,
  `jenis` varchar(50) DEFAULT NULL,
  `pesan` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasukan`
--

CREATE TABLE `pemasukan` (
  `idPemasukan` int NOT NULL,
  `idPengguna` int DEFAULT NULL,
  `idTransaksi` int DEFAULT NULL,
  `deskripsiPemasukan` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pemasukan`
--

INSERT INTO `pemasukan` (`idPemasukan`, `idPengguna`, `idTransaksi`, `deskripsiPemasukan`) VALUES
(1, 1, 2, 'Gaji ');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `idPengeluaran` int NOT NULL,
  `idPengguna` int DEFAULT NULL,
  `idTransaksi` int DEFAULT NULL,
  `deskripsiPengeluaran` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pengeluaran`
--

INSERT INTO `pengeluaran` (`idPengeluaran`, `idPengguna`, `idTransaksi`, `deskripsiPengeluaran`) VALUES
(2, 1, 3, 'kebutuhan dapur'),
(3, 1, 4, 'shopee'),
(4, 1, 5, 'jajan'),
(5, 1, 6, 'jajan'),
(6, 1, 7, 'hp'),
(9, 1, 10, 'jajan'),
(10, 1, 11, 'makan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `idPengguna` int NOT NULL,
  `namaPengguna` varchar(100) DEFAULT NULL,
  `noTelp` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `fotoProfil` varchar(255) DEFAULT NULL,
  `notifikasiAktif` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`idPengguna`, `namaPengguna`, `noTelp`, `email`, `password`, `fotoProfil`, `notifikasiAktif`) VALUES
(1, 'anisa', '8124093275', 'liaa@gmail.com', NULL, 'foto_1751912667.jpeg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `idTransaksi` int NOT NULL,
  `tanggalTransaksi` date DEFAULT NULL,
  `jenisTransaksi` varchar(50) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `idPengguna` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`idTransaksi`, `tanggalTransaksi`, `jenisTransaksi`, `jumlah`, `idPengguna`) VALUES
(2, '2025-06-01', 'Pemasukan', 10000000, 1),
(3, '2025-06-02', 'Pengeluaran', 50000, 1),
(4, '2025-06-11', 'Pengeluaran', 120000, 1),
(5, '2025-06-12', 'Pengeluaran', 35000, 1),
(6, '2025-06-13', 'Pengeluaran', 15000, 1),
(7, '2025-06-17', 'Pengeluaran', 3650000, 1),
(10, '2025-06-24', 'Pengeluaran', 32000, 1),
(11, '2025-06-11', 'Pengeluaran', 12000, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`idNotifikasi`),
  ADD KEY `idPengguna` (`idPengguna`);

--
-- Indeks untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`idPemasukan`),
  ADD KEY `idPengguna` (`idPengguna`),
  ADD KEY `idTransaksi` (`idTransaksi`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`idPengeluaran`),
  ADD KEY `idPengguna` (`idPengguna`),
  ADD KEY `idTransaksi` (`idTransaksi`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`idPengguna`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idTransaksi`),
  ADD KEY `idPengguna` (`idPengguna`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `idNotifikasi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `idPemasukan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `idPengeluaran` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `idPengguna` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `idTransaksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `notifikasi_ibfk_1` FOREIGN KEY (`idPengguna`) REFERENCES `pengguna` (`idPengguna`);

--
-- Ketidakleluasaan untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD CONSTRAINT `pemasukan_ibfk_1` FOREIGN KEY (`idPengguna`) REFERENCES `pengguna` (`idPengguna`),
  ADD CONSTRAINT `pemasukan_ibfk_2` FOREIGN KEY (`idTransaksi`) REFERENCES `transaksi` (`idTransaksi`);

--
-- Ketidakleluasaan untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `pengeluaran_ibfk_1` FOREIGN KEY (`idPengguna`) REFERENCES `pengguna` (`idPengguna`),
  ADD CONSTRAINT `pengeluaran_ibfk_2` FOREIGN KEY (`idTransaksi`) REFERENCES `transaksi` (`idTransaksi`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`idPengguna`) REFERENCES `pengguna` (`idPengguna`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
