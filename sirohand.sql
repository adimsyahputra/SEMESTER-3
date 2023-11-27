-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Nov 2023 pada 07.35
-- Versi server: 10.4.25-MariaDB
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sirohand`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bulan`
--

CREATE TABLE `bulan` (
  `id_bulan` int(10) NOT NULL,
  `nama_bulan` varchar(100) NOT NULL,
  `jumlah_produk_terjual` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bulan`
--

INSERT INTO `bulan` (`id_bulan`, `nama_bulan`, `jumlah_produk_terjual`) VALUES
(101, 'Januari', 100),
(102, 'Februari', 120),
(103, 'Maret', 90),
(104, 'April', 102),
(105, 'Mei', 80),
(106, 'Juni', 90),
(107, 'Juli', 70),
(108, 'Agustus', 151),
(109, 'September', 98),
(110, 'Oktober', 101),
(111, 'November', 90),
(112, 'Desember', 137);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama`) VALUES
(1, 'Boucad'),
(2, 'Kalung'),
(3, 'Gelang'),
(4, 'Gantungan Kunci'),
(5, 'Cincin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(10) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `waktu_jual` datetime NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `nama_produk`, `harga`, `waktu_jual`, `jumlah`) VALUES
(1, 'buket snack', 20000, '2023-11-23 06:35:18', 2),
(2, 'gelang manik', 5000, '2023-11-27 04:24:45', 1),
(3, 'buket snack mini', 20000, '2023-11-27 09:35:18', 1),
(4, 'gelang tali', 5000, '2023-11-27 10:24:45', 3),
(5, 'buket bunga', 40000, '2023-11-27 12:01:18', 4),
(6, 'buket snack sedang', 35000, '2023-11-27 12:35:18', 1),
(7, 'buket snack jumbo', 40000, '2023-11-27 14:09:30', 1),
(8, 'buket snack mini', 20000, '2023-11-28 12:35:18', 5),
(9, 'gelang tali', 5000, '2023-11-28 14:35:18', 4),
(10, 'gelang nama', 7000, '2023-11-28 15:45:10', 1),
(11, 'buket snack mini', 20000, '2023-11-29 09:35:18', 2),
(12, 'buket snack mini', 20000, '2023-11-29 17:24:45', 1),
(13, 'gelang nama', 9000, '2023-11-30 08:01:18', 4),
(14, 'cincin manik', 3000, '2023-11-30 08:35:10', 6),
(15, 'kalung kupu kupu', 12000, '2023-11-30 10:09:30', 1),
(16, 'buket snack mini', 20000, '2023-11-30 12:35:18', 1),
(17, 'gelang tali', 5000, '2023-11-30 14:35:18', 2),
(18, 'cincin nama', 5000, '2023-11-30 15:45:10', 1),
(19, 'gelang warna warni', 5000, '2023-11-30 16:40:10', 1),
(20, 'gelang lucu', 5000, '2023-11-30 17:00:10', 1),
(21, 'buket snack mini', 20000, '2023-12-01 09:35:18', 2),
(22, 'buket snack mini', 20000, '2023-12-01 14:24:45', 2),
(23, 'gelang nama', 9000, '2023-12-15 08:01:18', 2),
(24, 'cincin manik', 3000, '2023-12-21 08:35:10', 6),
(25, 'kalung kupu kupu', 12000, '2023-12-25 10:09:30', 1),
(26, 'buket snack mini', 20000, '2023-12-25 12:35:18', 1),
(27, 'gelang tali', 5000, '2023-12-25 14:35:18', 2),
(28, 'cincin nama', 5000, '2023-12-25 15:45:10', 1),
(29, 'gelang warna warni', 5000, '2023-12-29 16:40:10', 1),
(30, 'gelang lucu', 5000, '2023-12-30 15:00:10', 1),
(31, 'buket snack mini', 20000, '2024-01-01 09:35:18', 2),
(32, 'buket snack mini', 20000, '2024-01-01 13:24:45', 3),
(33, 'gelang nama', 9000, '2024-01-01 15:01:18', 4),
(34, 'buket bunga', 35000, '2024-01-02 08:35:10', 2),
(35, 'kalung kupu kupu', 12000, '2024-01-02 13:09:30', 4),
(36, 'buket snack jumbo', 40000, '2024-01-04 08:35:18', 1),
(37, 'gelang tali', 5000, '2024-01-04 14:35:18', 2),
(38, 'cincin nama', 5000, '2024-01-04 15:45:10', 1),
(39, 'gelang warna warni', 5000, '2024-01-05 09:40:10', 1),
(40, 'gelang lucu', 5000, '2024-01-05 16:00:10', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `harga` double DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `stok` enum('habis','tersedia') DEFAULT 'tersedia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `kategori_id`, `nama`, `harga`, `foto`, `detail`, `stok`) VALUES
(1, 1, 'Boucad Bunga', 50000, '2WyZU2TlZZ77uT4ceDb5.jpg', 'Boucad bunga warna warni', 'tersedia'),
(2, 1, 'Boucad Makanan', 35000, 'DlRPgzrlSvIZ094bNRKv.jpg', 'Berisi 10 macam makanan ringan', 'tersedia'),
(3, 1, 'Boucad Uang', 45000, NULL, 'Bisa custom sesuai keinginan', 'tersedia'),
(4, 2, 'Kalung Manik', 10000, 'E7XzYp72oQrqd9hMM6RH.jpg', 'bisa di pake dengan hijab maupun non hijab', 'tersedia'),
(5, 3, 'gelang tali', 5000, 'pbRDbFsWmSXUDuhBekbS.jpg', 'bagus aja', 'tersedia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun`
--

CREATE TABLE `tahun` (
  `id` int(11) NOT NULL,
  `tahun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tahun`
--

INSERT INTO `tahun` (`id`, `tahun`) VALUES
(2, 2022),
(2, 2023);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`) VALUES
(1, 'admin', '$2a$12$ZKmI.nuaBIHYuqE1z8.QqOPThSkouWHOJ2/yfJ2MlTAl68xiQ9jNq');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bulan`
--
ALTER TABLE `bulan`
  ADD PRIMARY KEY (`id_bulan`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `nama` (`nama`),
  ADD KEY `kategori_produk` (`kategori_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bulan`
--
ALTER TABLE `bulan`
  MODIFY `id_bulan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `kategori_produk` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
