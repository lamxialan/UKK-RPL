-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Nov 2026 pada 13.54
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peminjaman_alat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alat`
--

CREATE TABLE `alat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kategori_id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kode` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0,
  `kondisi` enum('baik','rusak ringan','rusak berat') NOT NULL DEFAULT 'baik',
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `alat`
--

INSERT INTO `alat` (`id`, `kategori_id`, `nama`, `kode`, `stok`, `kondisi`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Proyektor Epson EB-X500', 'ELK-001', 5, 'baik', 'Resolusi XGA 3600 lumens HDMI/VGA', '2026-11-05 00:27:13', '2026-11-05 01:00:34'),
(2, 1, 'Kamera DSLR Canon EOS 3000D', 'ELK-002', 3, 'baik', 'Lengkap dengan lensa kit 18-55mm dan tas', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(3, 1, 'Wireless Mic Boya BY-WM4 PRO', 'ELK-003', 4, 'baik', 'Dual channel wireless clip-on microphone', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(4, 1, 'Speaker Portable Baretone 15 Inch', 'ELK-004', 2, 'rusak ringan', 'Tombol bluetooth longgar namun mic dan aux normal', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(5, 2, 'Multimeter Digital Sanwa CD800a', 'LAB-001', 8, 'baik', 'True RMS digital multimeter akurasi tinggi', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(6, 2, 'Digital Storage Oscilloscope Rigol DS1054Z', 'LAB-002', 2, 'baik', '4 Channel 50 MHz bandwidth', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(7, 2, 'Mikroskop Binokuler Olympus CX23', 'LAB-003', 0, 'rusak berat', 'Lensa objektif retak dan fokus macet, dalam perbaikan', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(8, 3, 'Mesin Bor Listrik Bosch GSB 550', 'PRK-001', 6, 'baik', 'Impact drill 13mm 550 Watt lengkap set mata bor', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(9, 3, 'Mesin Gerinda Tangan Makita 9553B', 'PRK-002', 4, 'baik', 'Ukuran 4 inch daya 710 Watt', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(10, 3, 'Tool Kit Kunci & Tang Set Tekiro 21 Pcs', 'PRK-003', 5, 'baik', 'Bahan chrome vanadium dalam hardcase box', '2026-11-05 00:27:13', '2026-11-05 00:27:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('peminjaman_alat_cache_livewire-rate-limiter:056fc329aaaa757d31db450f525da23fde4d1b36', 'i:1;', 1793838159),
('peminjaman_alat_cache_livewire-rate-limiter:056fc329aaaa757d31db450f525da23fde4d1b36:timer', 'i:1793838159;', 1793838159);

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Elektronik & Multimedia', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(2, 'Laboratorium & Instrumen Ukur', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(3, 'Perkakas & Teknik Mesin', '2026-11-05 00:27:13', '2026-11-05 00:27:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `aksi` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id`, `user_id`, `aksi`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 1, 'Inisialisasi', 'Database awal sistem peminjaman alat berhasil di-seed (3 Akun: Admin, Petugas, Peminjam).', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(2, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(3, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(4, 1, 'Login', 'Pengguna Admin (admin@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(5, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(6, 3, 'Pengajuan Pinjam', 'Peminjaman alat \'Proyektor Epson EB-X500\' sebanyak 2 unit diajukan oleh Peminjam.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(7, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(8, 2, 'Setujui Peminjaman', 'Peminjaman #1 (Proyektor Epson EB-X500) disetujui oleh Petugas.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(9, 2, 'Pengembalian Alat', 'Alat #Proyektor Epson EB-X500 telah dikembalikan oleh Peminjam. Diterima oleh Petugas.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(10, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(11, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(12, 2, 'Tolak Peminjaman', 'Peminjaman #2 ditolak oleh Petugas. Alasan: Alat sedang dalam perbaikan berkala oleh teknisi.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(13, 1, 'Login', 'Pengguna Admin (admin@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(14, 1, 'Cetak Laporan', 'Laporan peminjaman dicetak oleh Admin (admin) dengan filter tanggal: 2026-10-29 s/d 2026-11-05, Status: semua.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(15, 1, 'Cetak Laporan', 'Laporan peminjaman dicetak oleh Admin (admin) dengan filter tanggal: 2026-10-29 s/d 2026-11-05, Status: semua.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(16, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(17, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(18, 1, 'Login', 'Pengguna Admin (admin@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(19, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(20, 3, 'Pengajuan Pinjam', 'Peminjaman alat \'Proyektor Epson EB-X500\' sebanyak 2 unit diajukan oleh Peminjam.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(21, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(22, 2, 'Setujui Peminjaman', 'Peminjaman #3 (Proyektor Epson EB-X500) disetujui oleh Petugas.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(23, 2, 'Pengembalian Alat', 'Alat #Proyektor Epson EB-X500 telah dikembalikan oleh Peminjam. Diterima oleh Petugas.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(24, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(25, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(26, 2, 'Tolak Peminjaman', 'Peminjaman #4 ditolak oleh Petugas. Alasan: Alat sedang dalam perbaikan berkala oleh teknisi.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(27, 1, 'Login', 'Pengguna Admin (admin@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(28, 1, 'Cetak Laporan', 'Laporan peminjaman dicetak oleh Admin (admin) dengan filter tanggal: 2026-10-29 s/d 2026-11-05, Status: semua.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(29, 1, 'Cetak Laporan', 'Laporan peminjaman dicetak oleh Admin (admin) dengan filter tanggal: 2026-10-29 s/d 2026-11-05, Status: semua.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(30, 1, 'Login', 'Pengguna Admin (admin@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 00:50:26', '2026-11-05 00:50:26'),
(31, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(32, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(33, 1, 'Login', 'Pengguna Admin (admin@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(34, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(35, 3, 'Pengajuan Pinjam', 'Peminjaman alat \'Proyektor Epson EB-X500\' sebanyak 2 unit diajukan oleh Peminjam.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(36, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(37, 2, 'Setujui Peminjaman', 'Peminjaman #5 (Proyektor Epson EB-X500) disetujui oleh Petugas.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(38, 2, 'Pengembalian Alat', 'Alat #Proyektor Epson EB-X500 telah dikembalikan oleh Peminjam. Diterima oleh Petugas.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(39, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(40, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(41, 2, 'Tolak Peminjaman', 'Peminjaman #6 ditolak oleh Petugas. Alasan: Alat sedang dalam perbaikan berkala oleh teknisi.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(42, 1, 'Login', 'Pengguna Admin (admin@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(43, 1, 'Cetak Laporan', 'Laporan peminjaman dicetak oleh Admin (admin) dengan filter tanggal: 2026-10-29 s/d 2026-11-05, Status: semua.', '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(44, 1, 'Cetak Laporan', 'Laporan peminjaman dicetak oleh Admin (admin) dengan filter tanggal: 2026-10-29 s/d 2026-11-05, Status: semua.', '2026-11-05 01:00:35', '2026-11-05 01:00:35'),
(45, 2, 'Login', 'Pengguna Petugas (petugas@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:09:04', '2026-11-05 01:09:04'),
(46, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:09:32', '2026-11-05 01:09:32'),
(47, 3, 'Login', 'Pengguna Peminjam (peminjam@peminjaman.test) berhasil masuk ke dalam sistem.', '2026-11-05 01:21:40', '2026-11-05 01:21:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_11_04_090030_add_role_to_users_table', 1),
(5, '2026_11_04_090104_create_kategoris_table', 1),
(6, '2026_11_04_090105_create_alats_table', 1),
(7, '2026_11_04_090150_create_peminjamen_table', 1),
(8, '2026_11_04_090151_create_log_aktivitas_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `alat_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT 1,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali_rencana` date NOT NULL,
  `tanggal_kembali_aktual` date DEFAULT NULL,
  `status` enum('menunggu','disetujui','ditolak','dikembalikan') NOT NULL DEFAULT 'menunggu',
  `catatan` text DEFAULT NULL,
  `alasan_penolakan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id`, `user_id`, `alat_id`, `jumlah`, `tanggal_pinjam`, `tanggal_kembali_rencana`, `tanggal_kembali_aktual`, `status`, `catatan`, `alasan_penolakan`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 2, '2026-11-05', '2026-11-08', '2026-11-05', 'dikembalikan', 'Uji peminjaman proyektor oleh peminjam', NULL, '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(2, 3, 1, 1, '2026-11-05', '2026-11-06', NULL, 'ditolak', 'Uji penolakan', 'Alat sedang dalam perbaikan berkala oleh teknisi.', '2026-11-05 00:28:00', '2026-11-05 00:28:00'),
(3, 3, 1, 2, '2026-11-05', '2026-11-08', '2026-11-05', 'dikembalikan', 'Uji peminjaman proyektor oleh peminjam', NULL, '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(4, 3, 1, 1, '2026-11-05', '2026-11-06', NULL, 'ditolak', 'Uji penolakan', 'Alat sedang dalam perbaikan berkala oleh teknisi.', '2026-11-05 00:29:36', '2026-11-05 00:29:36'),
(5, 3, 1, 2, '2026-11-05', '2026-11-08', '2026-11-05', 'dikembalikan', 'Uji peminjaman proyektor oleh peminjam', NULL, '2026-11-05 01:00:34', '2026-11-05 01:00:34'),
(6, 3, 1, 1, '2026-11-05', '2026-11-06', NULL, 'ditolak', 'Uji penolakan', 'Alat sedang dalam perbaikan berkala oleh teknisi.', '2026-11-05 01:00:34', '2026-11-05 01:00:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('a6otwshaloHJpzbvAh0I4lDGyEq9jeuuQui091PX', NULL, '127.0.0.1', 'curl/8.16.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiT3RYMXNlODhLWUlwZGFGYXhBc2hqeDRtOXVsSmZiRHBYNmhXT1hMbSI7czo4OiJmaWxhbWVudCI7YToxOntzOjEzOiJub3RpZmljYXRpb25zIjthOjE6e3M6NzoibWFpbGJveCI7czo2NDoiMWU1MGJkY2E4NWZhZmEyNjNkM2Q2MTliMmE4YTJiMjJkZDc1NWQzMzg0MmYwOGZmZjBlMWJhYTYzZmU3ODk1NCI7fX1zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2xvZ2luIjtzOjU6InJvdXRlIjtzOjI1OiJmaWxhbWVudC5hZG1pbi5hdXRoLmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1793834929),
('jtCQOjTY6ZKnjAl6FFtqjLfKEwNDE98l24hxIxTx', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiM0lTNG16Z2FLNWFSVWUxSnhHUHBVSWxBVWpyVUtLY2tIOVF4dmg1cSI7czo4OiJmaWxhbWVudCI7YToxOntzOjEzOiJub3RpZmljYXRpb25zIjthOjE6e3M6NzoibWFpbGJveCI7czo0MDoiOGFkWDFkQVVVZElwWThNcmtMRzIwdFliSzVEaUJGaGFEamlnRjF4ciI7fX1zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluIjtzOjU6InJvdXRlIjtzOjMwOiJmaWxhbWVudC5hZG1pbi5wYWdlcy5kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTozO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiJhNTQwZDhiYmYxYWQ2OWIzMDQ1OTgyZTRjN2Y5ZDE5NTExNzBlMWY4OTg3MGU0ZGEyYjRiNDM1NDQyNzA5YTE0Ijt9', 1793838237),
('QMcNIahOqj2tU6jiI6ssfP5NAliBGt8QAVc9Pfgv', NULL, '127.0.0.1', 'curl/8.16.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiR3F2R2Z1cTVTeUN3eUpGc0lKSVhPNGQ5WFk1dzgxM3ROam9iYmtpMCI7czo4OiJmaWxhbWVudCI7YToxOntzOjEzOiJub3RpZmljYXRpb25zIjthOjE6e3M6NzoibWFpbGJveCI7czo2NDoiNTk4YTBlNDUzNDZjMWE0YmY2NjVkNWIwOGRiZjFmYTVmYTg2Yzk1ZDQ3MjE0MzdjZjljNTE0ZTYyYjQ4YjE1OCI7fX1zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozMzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2xvZ2luIjtzOjU6InJvdXRlIjtzOjI1OiJmaWxhbWVudC5hZG1pbi5hdXRoLmxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1793834935);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','petugas','peminjam') NOT NULL DEFAULT 'peminjam',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@peminjaman.test', NULL, '$2y$12$Tr2zQOOBSOheUBxzTELWx.J8eIk7Xq/wZG6Gzk/to2fHYA2wT.Qe2', 'admin', 'exhi4jCt6lZrqkp0EeA4Y9UNAF9vh6zIxsHDCP7bk7H5WwSKcldETk0jMa7D', '2026-11-05 00:27:12', '2026-11-05 00:27:12'),
(2, 'Petugas', 'petugas@peminjaman.test', NULL, '$2y$12$xUzvggfOCRj0S3uvF7YitOmrRvE6a2hhXQH2oIFB53oxWgQC2z7xu', 'petugas', 'T4MNpZWXjVi19IFNxXZ4f5KuFq43EZaRyUSTcBsI3EZPmNme7wUnUpRpUqy5', '2026-11-05 00:27:13', '2026-11-05 00:27:13'),
(3, 'Peminjam', 'peminjam@peminjaman.test', NULL, '$2y$12$.OXJDiE8petvYUxxlLeeUemGXJa6lPTgEQ/Nl.IgU.SN.yFNvSe9u', 'peminjam', 'plT0Uhwsx9hKcJJRmRXviOgs40h1halq1gxLuTAjUssF9aGBy59RgTKRSHv8', '2026-11-05 00:27:13', '2026-11-05 00:27:13');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alat_kode_unique` (`kode`),
  ADD KEY `alat_kategori_id_foreign` (`kategori_id`);

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_aktivitas_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `peminjaman_user_id_foreign` (`user_id`),
  ADD KEY `peminjaman_alat_id_foreign` (`alat_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alat`
--
ALTER TABLE `alat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alat`
--
ALTER TABLE `alat`
  ADD CONSTRAINT `alat_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD CONSTRAINT `log_aktivitas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_alat_id_foreign` FOREIGN KEY (`alat_id`) REFERENCES `alat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `peminjaman_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
