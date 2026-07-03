-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jul 2026 pada 10.02
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbhabittracker`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `habits`
--

CREATE TABLE `habits` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `nama_habit` varchar(100) NOT NULL,
  `kategori` enum('Kesehatan','Belajar','Olahraga','Produktivitas','Lainnya') NOT NULL DEFAULT 'Lainnya',
  `warna` varchar(7) NOT NULL DEFAULT '#6366f1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `habits`
--

INSERT INTO `habits` (`id`, `user_id`, `nama_habit`, `kategori`, `warna`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Olahraga 30 Menit', 'Olahraga', '#10b981', 1, '2026-07-03 07:05:45', '2026-07-03 07:05:45'),
(2, 1, 'Baca Buku', 'Belajar', '#6366f1', 1, '2026-07-03 07:05:45', '2026-07-03 07:05:45'),
(3, 1, 'Minum Air 8 Gelas', 'Kesehatan', '#0ea5e9', 1, '2026-07-03 07:05:45', '2026-07-03 07:05:45'),
(4, 1, 'Ngoding 1 Jam', 'Produktivitas', '#f59e0b', 1, '2026-07-03 07:05:45', '2026-07-03 07:05:45'),
(6, 2, 'Olahraga 30 Menit', 'Olahraga', '#ef4444', 1, '2026-07-03 07:55:53', '2026-07-03 07:55:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `habit_logs`
--

CREATE TABLE `habit_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `habit_id` int(10) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `catatan` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `habit_logs`
--

INSERT INTO `habit_logs` (`id`, `habit_id`, `tanggal`, `status`, `catatan`, `created_at`) VALUES
(1, 1, '2026-06-27', 1, NULL, '2026-07-03 07:05:45'),
(2, 1, '2026-06-28', 1, NULL, '2026-07-03 07:05:45'),
(3, 1, '2026-06-29', 1, NULL, '2026-07-03 07:05:45'),
(4, 1, '2026-06-30', 0, NULL, '2026-07-03 07:05:45'),
(5, 1, '2026-07-01', 1, NULL, '2026-07-03 07:05:45'),
(6, 1, '2026-07-02', 1, NULL, '2026-07-03 07:05:45'),
(7, 1, '2026-07-03', 1, NULL, '2026-07-03 07:05:45'),
(8, 2, '2026-06-27', 1, NULL, '2026-07-03 07:05:45'),
(9, 2, '2026-06-28', 1, NULL, '2026-07-03 07:05:45'),
(10, 2, '2026-06-30', 1, NULL, '2026-07-03 07:05:45'),
(11, 2, '2026-07-01', 1, NULL, '2026-07-03 07:05:45'),
(12, 2, '2026-07-02', 1, NULL, '2026-07-03 07:05:45'),
(13, 3, '2026-06-29', 1, NULL, '2026-07-03 07:05:45'),
(14, 3, '2026-06-30', 1, NULL, '2026-07-03 07:05:45'),
(15, 3, '2026-07-01', 1, NULL, '2026-07-03 07:05:45'),
(16, 3, '2026-07-02', 1, NULL, '2026-07-03 07:05:45'),
(17, 3, '2026-07-03', 1, NULL, '2026-07-03 07:05:45'),
(18, 4, '2026-07-01', 1, NULL, '2026-07-03 07:05:45'),
(19, 4, '2026-07-02', 1, NULL, '2026-07-03 07:05:45'),
(20, 4, '2026-07-03', 1, NULL, '2026-07-03 07:05:45'),
(25, 6, '2026-07-03', 1, NULL, '2026-07-03 07:56:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `data` text,
  `last_active` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `data`, `last_active`) VALUES
('8hptaqoaeehfvlfk611fikf9t3', 2, 'user_id|s:1:\"2\";name|s:6:\"Fathul\";username|s:6:\"fathul\";', '2026-07-03 07:58:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `created_at`) VALUES
(1, 'Demo User', 'demo', '$2y$12$kH9i7mZ3xQpLnRvT8uWsOeE6dKcJbAyFgNXoMsPwVqIU4lh0tY1rC', '2026-07-03 07:05:45'),
(2, 'Fathul', 'fathul', '$2y$10$vc7tsIaNc7k0dxBX.pseE.dfVJVBACs9CXimmOhs6cOsi8Usuw8TW', '2026-07-03 07:28:18'),
(3, 'Ibnu', 'ibnu', '$2y$10$qJiBiRPowx0Cmy9Ul9DoYO7QR/TeW9KjH9bO/S8EMU3hr4W1hSray', '2026-07-03 07:58:01');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `habits`
--
ALTER TABLE `habits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_habits_user` (`user_id`);

--
-- Indeks untuk tabel `habit_logs`
--
ALTER TABLE `habit_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_log_per_hari` (`habit_id`,`tanggal`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `fk_sessions_user` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `habits`
--
ALTER TABLE `habits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `habit_logs`
--
ALTER TABLE `habit_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `habits`
--
ALTER TABLE `habits`
  ADD CONSTRAINT `fk_habits_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `habit_logs`
--
ALTER TABLE `habit_logs`
  ADD CONSTRAINT `fk_logs_habit` FOREIGN KEY (`habit_id`) REFERENCES `habits` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_sessions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
