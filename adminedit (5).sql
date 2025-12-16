-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 02:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adminedit`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
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
-- Table structure for table `jobs`
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
-- Table structure for table `job_batches`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_13_015410_create_products_table', 1),
(5, '2024_10_02_050651_create_posts_table', 1),
(6, '2024_10_02_071842_create_events_table', 1),
(7, '2024_11_13_093005_dashboard_controller', 2),
(8, '2024_11_18_180217_create_payments_table', 2),
(9, '2024_11_18_182818_add_unique_to_email_on_users_table', 3),
(10, '2024_11_21_134221_create_payments_table', 3),
(11, '2024_11_21_183049_add_payment_code_to_payments_table', 4),
(12, '2024_11_24_143716_create_orders_table', 5),
(13, '2024_11_24_164303_create_payments_table', 6),
(14, '2024_11_25_011530_create_payments_table', 7),
(15, '2024_11_27_073035_add_address_to_payments_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `payment_code` varchar(255) DEFAULT NULL,
  `payment_details` text DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_method`, `payment_code`, `payment_details`, `total_amount`, `items`, `address`, `created_at`, `updated_at`) VALUES
(66, 'bank-transfer', '4500000402723', 'Payment via Bank Transfer. Your payment code is 4500000402723.', 45000.00, '[{\"id\":\"4\",\"title\":\"Latte \\\"Velvet Touch\\\"\",\"price\":45000,\"image\":\"http://127.0.0.1:8000/storage/products/dGapMUCZiXm2HK4tZuvEooqXwdarTtTr81vwVYUl.jpg\",\"quantity\":1}]', 'dusun mekar,02,benteng,Burau', '2024-11-27 01:05:00', '2024-11-27 01:05:00'),
(69, 'cash', NULL, 'Payment via Cash on Delivery', 25000.00, '[{\"id\":\"3\",\"title\":\"Espresso \\\"Jet Fuel\\\"\",\"price\":25000,\"image\":\"http://127.0.0.1:8000/storage/products/KJAZJhPa6zVSdcgjVwAL8vHVhiJEIDVxDQQIeyFl.jpg\",\"quantity\":1}]', 'dusun mekar,02,benteng,Burau', '2024-11-27 01:07:52', '2024-11-27 01:07:52'),
(70, 'bank-transfer', '6750000703780', 'Payment via Bank Transfer. Your payment code is 6750000703780.', 67500.00, '[{\"id\":\"5\",\"title\":\"Americano \\\"Straight Shooter\\\"\",\"price\":27500,\"image\":\"http://127.0.0.1:8000/storage/products/ayG49rROvH10JKtXgQ7X4MDstmCMhJlsKeJ5yBRw.jpg\",\"quantity\":1},{\"id\":\"12\",\"title\":\"Affogato\",\"price\":40000,\"image\":\"http://127.0.0.1:8000/storage/products/CUkMWUy1mrNf5oLTctMBHBHP1FMBt4FyJuNH41Ve.jpg\",\"quantity\":1}]', 'dg tata', '2024-11-27 01:09:51', '2024-11-27 01:09:51'),
(71, 'credit-card', '2500000316534', 'Payment via Credit Card. Your payment code is 2500000316534.', 25000.00, '[{\"id\":\"3\",\"title\":\"Espresso \\\"Jet Fuel\\\"\",\"price\":25000,\"image\":\"http://127.0.0.1:8000/storage/products/KJAZJhPa6zVSdcgjVwAL8vHVhiJEIDVxDQQIeyFl.jpg\",\"quantity\":1}]', 'dusun mekar,02,benteng,Burau', '2024-11-27 01:12:28', '2024-11-27 01:12:28'),
(72, 'cash', NULL, 'Payment via Cash on Delivery', 27500.00, '[{\"id\":\"5\",\"title\":\"Americano \\\"Straight Shooter\\\"\",\"price\":27500,\"image\":\"http://127.0.0.1:8000/storage/products/ayG49rROvH10JKtXgQ7X4MDstmCMhJlsKeJ5yBRw.jpg\",\"quantity\":1}]', 'dg tata 1', '2024-11-28 04:02:54', '2024-11-28 04:02:54'),
(73, 'bank-transfer', '2750000540357', 'Payment via Bank Transfer. Your payment code is 2750000540357.', 27500.00, '[{\"id\":\"5\",\"title\":\"Americano \\\"Straight Shooter\\\"\",\"price\":27500,\"image\":\"http://127.0.0.1:8000/storage/products/ayG49rROvH10JKtXgQ7X4MDstmCMhJlsKeJ5yBRw.jpg\",\"quantity\":1}]', 'dg tata 1', '2024-11-28 04:03:02', '2024-11-28 04:03:02'),
(74, 'bank-transfer', '4500000666711', 'Payment via Bank Transfer. Your payment code is 4500000666711.', 45000.00, '[{\"id\":\"4\",\"title\":\"Latte \\\"Velvet Touch\\\"\",\"price\":45000,\"image\":\"http://127.0.0.1:8000/storage/products/dGapMUCZiXm2HK4tZuvEooqXwdarTtTr81vwVYUl.jpg\",\"quantity\":1}]', 'dg tata 1', '2024-11-28 04:08:22', '2024-11-28 04:08:22'),
(75, 'cash', '4500000666711', 'Payment via Cash on Delivery', 45000.00, '[{\"id\":\"4\",\"title\":\"Latte \\\"Velvet Touch\\\"\",\"price\":45000,\"image\":\"http://127.0.0.1:8000/storage/products/dGapMUCZiXm2HK4tZuvEooqXwdarTtTr81vwVYUl.jpg\",\"quantity\":1}]', 'dg tata 1', '2024-11-28 04:08:45', '2024-11-28 04:08:45'),
(76, 'cash', NULL, 'Payment via Cash on Delivery', 115000.00, '[{\"id\":\"4\",\"title\":\"Latte \\\"Velvet Touch\\\"\",\"price\":45000,\"image\":\"http://127.0.0.1:8000/storage/products/dGapMUCZiXm2HK4tZuvEooqXwdarTtTr81vwVYUl.jpg\",\"quantity\":2},{\"id\":\"3\",\"title\":\"Espresso \\\"Jet Fuel\\\"\",\"price\":25000,\"image\":\"http://127.0.0.1:8000/storage/products/KJAZJhPa6zVSdcgjVwAL8vHVhiJEIDVxDQQIeyFl.jpg\",\"quantity\":1}]', 'cuki', '2024-11-28 06:33:28', '2024-11-28 06:33:28'),
(77, 'cash', NULL, 'Payment via Cash on Delivery', 115000.00, '[{\"id\":\"4\",\"title\":\"Latte \\\"Velvet Touch\\\"\",\"price\":45000,\"image\":\"http://127.0.0.1:8000/storage/products/dGapMUCZiXm2HK4tZuvEooqXwdarTtTr81vwVYUl.jpg\",\"quantity\":2},{\"id\":\"3\",\"title\":\"Espresso \\\"Jet Fuel\\\"\",\"price\":25000,\"image\":\"http://127.0.0.1:8000/storage/products/KJAZJhPa6zVSdcgjVwAL8vHVhiJEIDVxDQQIeyFl.jpg\",\"quantity\":1}]', 'dusun mekar,02,benteng,Burau', '2024-11-28 06:48:34', '2024-11-28 06:48:34'),
(78, 'bank-transfer', '11500000586982', 'Payment via Bank Transfer. Your payment code is 11500000586982.', 115000.00, '[{\"id\":\"4\",\"title\":\"Latte \\\"Velvet Touch\\\"\",\"price\":45000,\"image\":\"http://127.0.0.1:8000/storage/products/dGapMUCZiXm2HK4tZuvEooqXwdarTtTr81vwVYUl.jpg\",\"quantity\":2},{\"id\":\"3\",\"title\":\"Espresso \\\"Jet Fuel\\\"\",\"price\":25000,\"image\":\"http://127.0.0.1:8000/storage/products/KJAZJhPa6zVSdcgjVwAL8vHVhiJEIDVxDQQIeyFl.jpg\",\"quantity\":1}]', 'dusun mekar,02,benteng,Burau', '2024-11-28 06:48:45', '2024-11-28 06:48:45'),
(79, 'credit-card', '5000000392710', 'Payment via Credit Card. Your payment code is 5000000392710.', 50000.00, '[{\"id\":\"3\",\"title\":\"Espresso \\\"Jet Fuel\\\"\",\"price\":25000,\"image\":\"http://127.0.0.1:8000/storage/products/KJAZJhPa6zVSdcgjVwAL8vHVhiJEIDVxDQQIeyFl.jpg\",\"quantity\":2}]', 'bima', '2024-11-28 07:00:00', '2024-11-28 07:00:00'),
(80, 'credit-card', '7250000596409', 'Payment via Credit Card. Your payment code is 7250000596409.', 72500.00, '[{\"id\":\"4\",\"title\":\"Latte \\\"Velvet Touch\\\"\",\"price\":45000,\"image\":\"http://127.0.0.1:8000/storage/products/dGapMUCZiXm2HK4tZuvEooqXwdarTtTr81vwVYUl.jpg\",\"quantity\":1},{\"id\":\"5\",\"title\":\"Americano \\\"Straight Shooter\\\"\",\"price\":27500,\"image\":\"http://127.0.0.1:8000/storage/products/ayG49rROvH10JKtXgQ7X4MDstmCMhJlsKeJ5yBRw.jpg\",\"quantity\":1}]', 'dg tata 1', '2024-11-28 09:27:46', '2024-11-28 09:27:46'),
(81, 'cash', '7250000596409', 'Payment via Cash on Delivery', 72500.00, '[{\"id\":\"4\",\"title\":\"Latte \\\"Velvet Touch\\\"\",\"price\":45000,\"image\":\"http://127.0.0.1:8000/storage/products/dGapMUCZiXm2HK4tZuvEooqXwdarTtTr81vwVYUl.jpg\",\"quantity\":1},{\"id\":\"5\",\"title\":\"Americano \\\"Straight Shooter\\\"\",\"price\":27500,\"image\":\"http://127.0.0.1:8000/storage/products/ayG49rROvH10JKtXgQ7X4MDstmCMhJlsKeJ5yBRw.jpg\",\"quantity\":1}]', 'dg tata 1', '2024-11-28 09:28:14', '2024-11-28 09:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` bigint(20) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `title`, `description`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, '0bFDkyhYk6ejD6VQavkCK0kt62m2lFxAL02D73I5.jpg', 'Cppuccino \"Fluffy Cloud\"', '<p>Kopi dengan busa susu lembut, cocok untuk momen santai</p>', 30000, 1, '2024-10-21 02:41:07', '2024-11-09 12:03:44'),
(3, 'KJAZJhPa6zVSdcgjVwAL8vHVhiJEIDVxDQQIeyFl.jpg', 'Espresso \"Jet Fuel\"', '<p>Kopi pekat dan kuat, siap memberikan dorongan energi instan</p>', 25000, 6, '2024-11-09 11:47:59', '2024-11-09 11:50:14'),
(4, 'dGapMUCZiXm2HK4tZuvEooqXwdarTtTr81vwVYUl.jpg', 'Latte \"Velvet Touch\"', '<p>Perpaduan kopi dan susu creamy, lembut dan menyenangkan</p>', 45000, 9, '2024-11-09 12:05:17', '2024-11-09 12:05:17'),
(5, 'ayG49rROvH10JKtXgQ7X4MDstmCMhJlsKeJ5yBRw.jpg', 'Americano \"Straight Shooter\"', '<p>Kopi hitam murni, sederhana dan kuat</p>', 27500, 5, '2024-11-09 12:07:22', '2024-11-09 12:07:22'),
(6, 'KyP4l6CnAno9U1wDB5JsYuJlgwweiUY71SO1iPom.jpg', 'Mocha \"Choco Rush\"', '<p>Kopi perpaduan dengan coklat, memberikan rasa manis dan kaya</p>', 43900, 10, '2024-11-09 12:09:19', '2024-11-09 12:09:19'),
(10, 'WRcIazGi1HeIgMGzpwKUymNkkz2FA3AAstbGavGD.jpg', 'Flat White', '<p>Espresso dengan susu panas, halus dan memuaskan</p>', 27900, 70, '2024-11-21 02:05:47', '2024-11-21 05:17:15'),
(11, 'HYDlJn4sLKIiPSeGZm4R3337zeIei7BcdIxTABlv.jpg', 'Macchiato', '<p>Espresso dengan sedikit susu, kuat tapi ringan</p>', 30900, 16, '2024-11-21 02:07:06', '2024-11-21 05:17:02'),
(12, 'CUkMWUy1mrNf5oLTctMBHBHP1FMBt4FyJuNH41Ve.jpg', 'Affogato', '<p>Espresso dengan es krim vanilla, kombinasi manis dan pahit</p>', 40000, 10, '2024-11-21 02:09:23', '2024-11-21 05:16:47'),
(13, 'KC332KhWf8JzgmpbGHQjv9GqFkBZv3sVZ0yUp8Ap.jpg', 'Cold Brew', '<p>Kopi seduh dingin, halus dan menyegarkan</p>', 34900, 20, '2024-11-21 02:10:34', '2024-11-21 05:16:33'),
(14, 'Fzz8flsbSLN3e8gNfgPUO3u2sd7uIIuuV8fybDmA.jpg', 'Matcha bima', '<p>Perpaduan kopi dan&nbsp;matcha, memberikan rasa manis&nbsp;</p>', 50000, 1, '2024-11-21 02:13:48', '2024-11-24 18:52:03');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
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
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ekh8DE77lsnTvYBl9TO9IysyOgQK0KDVhlxNhL1B', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2JLVmNTWkNOc040cUhJaFcwWUFIRENyYjUyOFVvSm1qanIyOFJvdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1732842508),
('fMNG355AdGfr4ULpcQhtZxu6rriKsNjYtHDxJ6q3', 10, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNWhLMXM0YTllbXJuUjl2aWxSeEpGNVRVbWZiREZ4MG9PNXdRYmRYcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEwO30=', 1732815033);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'aril', 'aril@gmail.com', NULL, '$2y$12$3AwhRO3/f6X5eMQ5E.3k/eul5YQnRkSZIvbxhTqQ.jf1Yt2imjva2', NULL, '2024-11-21 05:25:19', '2024-11-21 05:25:19'),
(2, 'aril', 'bima@gmail.com', NULL, '$2y$12$n/a3KAw6C77HfYF1nuvc8u6dmuTD4.Gm/uOwk8qhaPDHDoKjnuCGO', NULL, '2024-11-21 17:30:32', '2024-11-21 17:30:32'),
(3, 'aril', 'aril1@gmail.com', NULL, '$2y$12$v/kGoNsg9rQmDWIZJ9jSIeM3TAJYDk6Er652fYQLdwrGJ78JG5Rc6', NULL, '2024-11-21 17:30:49', '2024-11-21 17:30:49'),
(4, 'aril', 'cogil@gmail.com', NULL, '$2y$12$uLAi.KsEpmrwoxRucClfJu.S2JE1DM5q/shemlXm5OV1vKeHTBKn6', NULL, '2024-11-24 07:46:24', '2024-11-24 07:46:24'),
(5, 'aril', 'aril5@gmail.com', NULL, '$2y$12$nX5ZcInum/B/VW9z9av4YOYNRq4jWloNg04L9gugEyKHOeoVLIcli', NULL, '2024-11-24 18:33:18', '2024-11-24 18:33:18'),
(6, 'bima', 'bima5@gmail.com', NULL, '$2y$12$scA61wV5w18ZOlP2Gf8pe.QxOQ6IZ95ZQfZGHsC2TxkoC8u/nBife', NULL, '2024-11-24 18:47:46', '2024-11-24 18:47:46'),
(7, 'Arielt dumung takke puang', 'ariltakkepuang@gmail.com', NULL, '$2y$12$e1y6DVHQ17H3Q9n0jSAS7uIXY1RxYUnho9JZaYyXruuufdGiznR..', NULL, '2024-11-26 23:48:53', '2024-11-26 23:48:53'),
(8, 'yuss', 'yuss04@gmail.com', NULL, '$2y$12$KFz07vEjGQ9Q6n.BOtoTzeniOx5/P2zS5Y3R/fBJM2Q5V7iWIZwZK', NULL, '2024-11-28 04:20:11', '2024-11-28 04:20:11'),
(9, 'zumar', 'zumar@gmail.com', NULL, '$2y$12$C/PQlUEs.1V1.0csO1CcOe4E.vTYwo.1tF4Aw5kbEoh0VfOs.znym', NULL, '2024-11-28 09:19:26', '2024-11-28 09:19:26'),
(10, 'zumar', 'zumar1@gmail.com', NULL, '$2y$12$UcF.d0XxYQP8g/XprbFTKusdBW9d9p/vIFkfuoci9JXztD57JMn/m', NULL, '2024-11-28 09:24:08', '2024-11-28 09:24:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
