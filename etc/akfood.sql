-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Sep 2020 pada 05.55
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
  `category_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_created_at`, `category_updated_at`) VALUES
(1, 'Drinks', '2020-08-12 13:08:19', '2020-08-26 17:43:11'),
(2, 'Foods', '2020-08-13 03:56:17', '2020-08-26 17:43:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `history`
--

CREATE TABLE `history` (
  `history_id` int(11) NOT NULL,
  `history_invoice` int(6) NOT NULL,
  `history_subtotal` int(15) NOT NULL,
  `history_created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `history`
--

INSERT INTO `history` (`history_id`, `history_invoice`, `history_subtotal`, `history_created_at`) VALUES
(1, 763528, 55000, '2020-08-26 16:10:47'),
(2, 611691, 83600, '2020-08-26 16:11:27'),
(3, 647501, 127600, '2020-08-26 16:11:36'),
(4, 477166, 264000, '2020-08-26 16:11:47'),
(5, 602531, 0, '2020-08-27 22:51:16'),
(6, 260070, 0, '2020-08-30 07:14:08'),
(7, 903832, 0, '2020-08-30 17:41:13'),
(8, 169733, 0, '2020-08-31 00:34:51'),
(9, 813970, 0, '2020-08-31 00:34:52'),
(10, 279453, 0, '2020-08-31 00:34:55'),
(11, 809692, 0, '2020-08-31 00:34:55'),
(12, 703429, 0, '2020-08-31 00:34:55'),
(13, 240343, 0, '2020-08-31 00:34:59'),
(14, 506387, 0, '2020-08-31 00:35:00'),
(15, 342972, 0, '2020-08-31 00:35:00'),
(16, 977722, 0, '2020-08-31 00:35:01'),
(17, 405191, 0, '2020-08-31 00:37:57'),
(18, 309363, 0, '2020-08-31 01:54:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_qty` int(6) NOT NULL,
  `order_total_price` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`orders_id`, `history_id`, `product_id`, `order_qty`, `order_total_price`) VALUES
(1, 1, 1, 2, 20000),
(2, 1, 2, 2, 30000),
(3, 2, 3, 2, 10000),
(4, 2, 4, 2, 66000),
(5, 3, 5, 2, 56000),
(6, 3, 6, 2, 60000),
(7, 4, 7, 2, 120000),
(8, 4, 8, 2, 120000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_price` int(15) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `product_updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_image`, `product_price`, `category_id`, `product_created_at`, `product_updated_at`, `product_status`) VALUES
(1, 'Espresso', 'product_image-2020-09-07T03-45-42.758Z-bear.png', 10000, 1, '2020-08-12 08:15:23', '2020-09-07 03:45:42', 1),
(2, 'Coffee Latte', 'product_image-2020-09-07T08-02-11.862Z-chocorum.png', 30000, 1, '2020-08-13 00:01:26', '2020-09-07 08:02:11', 1),
(3, 'Cappuccino', 'product_image-2020-09-07T03-58-03.042Z-bear.png', 5000, 1, '2020-08-13 00:01:41', '2020-09-07 03:58:03', 1),
(4, 'Red Velvet Latte', 'product_image-2020-09-07T04-00-17.450Z-redvelvet.png', 33000, 1, '2020-08-13 00:02:12', '2020-09-07 04:00:17', 1),
(5, 'Choco Rum', '', 28000, 1, '2020-08-13 00:02:28', '2020-08-13 00:03:17', 1),
(6, 'Black Forest', '', 30000, 1, '2020-08-13 00:03:48', '2020-09-01 10:52:00', 1),
(7, 'Chicken Katsu Dabu-dabu', '', 60000, 2, '2020-08-13 00:04:07', '0000-00-00 00:00:00', 1),
(8, 'Salmon Truffle Teriyaki', '', 60000, 2, '2020-08-13 00:04:22', '0000-00-00 00:00:00', 1),
(9, 'Wiener Schnitzel', '', 69000, 2, '2020-08-13 00:04:35', '0000-00-00 00:00:00', 1),
(31, 'chocorum', 'product_image-2020-09-07T13-07-27.136Z-chocorum.png', 15000, 2, '2020-09-07 13:07:27', '0000-00-00 00:00:00', 1);

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
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`, `user_name`, `user_role`, `user_status`, `user_created_at`, `user_updated_at`) VALUES
(1, 'hasbialwi70@gmail.com', '$2b$10$W1X6HdALpH0Xuk3cYiNbduJquGRp1GGJAxjnoyARdnXLGHgegSk6O', 'hasbiak', 2, 1, '2020-09-06 18:25:11', '2020-09-01 04:03:59'),
(2, 'hasbialwi77@gmail.com', '$2b$10$9yg7HoZ8Iz5kRN2FRN5dNOFOVC8mM9ecQmZJlg6pdlzOHbWwAErBO', 'Hasbi', 2, 1, '2020-09-06 20:48:43', '2020-09-06 16:17:17'),
(8, 'hasbialwi78gmail.com', '$2b$10$SaaYsSpQV0CMPtOng8YPgOSk7ozLRrWoekhBqpY6Mk.tfS/XFINNi', 'Hasbi', 2, 0, '2020-09-07 07:20:00', '2020-09-07 07:20:00'),
(9, 'hasbialwi70gmail.com', '$2b$10$gFOY57JQ5riU2rD0KRKFaO6nvtvjqwifS3nEs7YxaB1JJHq10Z5h6', 'Hasbi', 2, 0, '2020-09-07 07:24:52', '2020-09-07 07:24:52'),
(10, 'hasbialwi80gmail.com', '$2b$10$.4p08L5stI7yz9D.rFBL6.GDCeh1lEN564lzRM.iI7XzG7jXyvzRy', 'Hasbi', 2, 0, '2020-09-07 07:50:56', '2020-09-07 07:50:56'),
(11, 'hasbialwi80@gmail.com', '12345678', 'Hasbi', 2, 1, '2020-09-07 07:52:52', '2020-09-07 07:51:39');

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
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
