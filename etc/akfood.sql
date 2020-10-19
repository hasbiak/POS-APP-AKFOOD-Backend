-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Okt 2020 pada 09.56
-- Versi server: 10.4.13-MariaDB
-- Versi PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akfood`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_created_at` datetime NOT NULL,
  `category_updated_at` datetime NOT NULL,
  `category_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_created_at`, `category_updated_at`, `category_status`) VALUES
(1, 'Food', '2020-08-12 06:41:36', '2020-08-12 06:41:36', 1),
(2, 'Drink', '2020-08-12 06:42:12', '2020-08-12 06:42:12', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `history_user_name` varchar(255) NOT NULL,
  `history_invoices` int(11) NOT NULL,
  `history_subtotal` int(11) NOT NULL,
  `history_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`history_id`, `history_user_name`, `history_invoices`, `history_subtotal`, `history_created_at`) VALUES
(1, 'hasbi', 1256952451, 11000, '2020-10-16 22:40:58'),
(2, 'hasbi', 1835729446, 27500, '2020-10-16 22:41:52'),
(3, 'hasbi', 1171808808, 137500, '2020-10-16 22:42:09'),
(4, 'Hasbi Alwi Kusmana', 1517515358, 33000, '2020-10-17 00:24:36'),
(5, 'Hasbi Alwi Kusmana', 1671030794, 11000, '2020-10-19 13:44:03'),
(6, 'Hasbi Alwi Kusmana', 1887548871, 27500, '2020-10-19 13:44:31'),
(7, 'Hasbi Alwi Kusmana', 1930118161, 11000, '2020-10-19 13:44:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `orders_qty` int(11) NOT NULL,
  `orders_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`orders_id`, `history_id`, `product_id`, `orders_qty`, `orders_total`) VALUES
(1, 1, 1, 1, 11000),
(2, 2, 2, 1, 16500),
(3, 2, 1, 1, 11000),
(4, 3, 2, 5, 82500),
(5, 3, 1, 5, 55000),
(6, 4, 3, 1, 5500),
(7, 4, 2, 1, 16500),
(8, 4, 1, 1, 11000),
(9, 5, 1, 1, 11000),
(10, 6, 1, 1, 11000),
(11, 6, 2, 1, 16500),
(12, 7, 1, 1, 11000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_created_at` datetime NOT NULL,
  `product_updated_at` datetime NOT NULL,
  `product_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_price`, `product_image`, `product_created_at`, `product_updated_at`, `product_status`) VALUES
(1, 2, 'Espresso', 10000, '2020-10-16T15-14-17.663Z-cappucino.jpg', '2020-10-16 22:11:01', '2020-10-16 22:14:17', 1),
(2, 2, 'Cofee Latte', 15000, '2020-10-16T15-16-29.801Z-cofee-latte.jpg', '2020-10-16 22:16:29', '2020-10-16 22:16:42', 1),
(3, 2, 'Cappucino', 5000, '2020-10-16T17-20-17.755Z-cappucino.jpg', '2020-10-17 00:20:17', '2020-10-17 00:20:17', 1),
(4, 2, 'Red Velvet Latte ', 33000, '2020-10-16T17-20-58.509Z-red-velvet-latte.jpg', '2020-10-17 00:20:58', '2020-10-17 00:20:58', 1),
(5, 1, 'Choco Rhum', 28000, '2020-10-16T17-21-30.765Z-choco-rhum.jpg', '2020-10-17 00:21:30', '2020-10-17 00:22:54', 1),
(6, 1, 'Black Forest', 30000, '2020-10-16T17-22-03.597Z-black-forest.jpg', '2020-10-17 00:22:03', '2020-10-17 00:22:03', 1),
(7, 1, 'Chicken Katsu Dabu-dabu', 60000, '2020-10-16T17-22-34.260Z-chicken-katsu.jpg', '2020-10-17 00:22:34', '2020-10-17 00:22:34', 1),
(8, 1, 'Salmon Truffle Teriyaki', 60000, '2020-10-16T17-23-31.498Z-salmon-truffle.jpg', '2020-10-17 00:23:31', '2020-10-17 00:23:31', 1),
(9, 1, 'Wiener Schnitzel', 69000, '2020-10-16T17-23-59.775Z-wiener-schnitzel.jpg', '2020-10-17 00:23:59', '2020-10-17 00:23:59', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_role` int(1) NOT NULL,
  `user_status` int(1) NOT NULL,
  `user_created_at` datetime NOT NULL,
  `user_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`, `user_name`, `user_role`, `user_status`, `user_created_at`, `user_updated_at`) VALUES
(1, 'hasbialwi70@gmail.com', '$2b$10$vo5ihcFMuapofMEJe1.pxucXmYNXO5RR393arvTwf5GaZa6n1.ThG', 'Hasbi Alwi Kusmana', 1, 1, '2020-10-14 23:36:52', '2020-10-14 23:36:52'),
(2, 'hasbi@gmail.com', '$2b$10$vdw03q461jkZ9/EmLJbrqOwK4o8.6SIb/c84Tw0nIrhGICCEHIsV2', 'Hasbi AK', 2, 1, '2020-10-16 22:39:41', '2020-10-16 22:51:40'),
(3, 'hasbi1@gmail.com', '$2b$10$Y4gbfzWVLupvFKCqd3nWNOWqU3HrO1kY8bvZ1bGRfcbtzFop8E6Be', 'Hasbi', 2, 0, '2020-10-19 06:10:58', '2020-10-19 06:10:58');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
