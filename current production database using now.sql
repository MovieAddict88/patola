-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 23, 2025 at 04:33 PM
-- Server version: 10.11.15-MariaDB
-- PHP Version: 8.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cornerst_vpn`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `name`, `price`, `created_at`) VALUES
(1, 'CORNERSTONE-ITS PREMIUM MOBILE DATA', 50.00, '2025-12-21 17:11:44'),
(2, '3mbps', 200.00, '2025-12-22 01:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `admob_ads`
--

CREATE TABLE `admob_ads` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ad_unit_id` varchar(255) NOT NULL,
  `ad_type` varchar(255) NOT NULL DEFAULT 'banner',
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admob_settings`
--

CREATE TABLE `admob_settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_updates`
--

CREATE TABLE `app_updates` (
  `id` int(11) NOT NULL,
  `version_code` varchar(50) NOT NULL,
  `version_name` varchar(50) NOT NULL,
  `apk_path` varchar(255) NOT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `upload_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carriers`
--

CREATE TABLE `carriers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `commission_rate` decimal(5,2) NOT NULL,
  `commission_earned` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `created_at`) VALUES
(1, '001_create_app_updates_table.php', '2025-12-21 07:23:05'),
(2, '20240726_add_filesize_to_app_updates.php', '2025-12-21 07:23:05'),
(3, '20240727_add_uploaddate_to_app_updates.php', '2025-12-21 07:23:05'),
(4, '20240728_add_promo_id_to_configurations.php', '2025-12-21 07:23:05'),
(5, '20240802_add_is_reseller_to_users_table.php', '2025-12-21 07:23:05'),
(6, '20240802_create_reseller_tables.php', '2025-12-21 07:23:05'),
(7, '20240728_migrate_configurations_to_promos.php', '2025-12-21 07:23:42'),
(8, '20240801_create_troubleshooting_guides_table.php', '2025-12-21 07:23:42'),
(9, '20240803_add_commission_rate_to_resellers.php', '2025-12-21 07:37:49'),
(10, '001_create_migrations_table.php', '2025-12-21 17:10:26'),
(11, '002_create_accounts_table.php', '2025-12-21 17:10:26'),
(12, '003_add_account_id_and_client_limit_to_users_table.php', '2025-12-21 17:10:26'),
(13, '20240802_create_admob_ads_table.php', '2025-12-21 17:10:26'),
(14, '004_create_profile_promos_table.php', '2025-12-23 08:14:52'),
(15, '20251222_migration_fix.sql', '2025-12-23 12:22:52');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_time` time NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `amount`, `payment_date`, `payment_time`, `payment_method`, `reference_number`, `attachment_path`, `created_at`) VALUES
(1, 25, 100.00, '2025-12-22', '17:41:00', 'Cash', 'aw', NULL, '2025-12-22 09:42:07');

-- --------------------------------------------------------

--
-- Table structure for table `promos`
--

CREATE TABLE `promos` (
  `id` int(11) NOT NULL,
  `promo_name` varchar(255) NOT NULL,
  `icon_promo_path` varchar(255) NOT NULL,
  `carrier` varchar(255) DEFAULT NULL,
  `config_text` text DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `carrier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `promos`
--

INSERT INTO `promos` (`id`, `promo_name`, `icon_promo_path`, `carrier`, `config_text`, `is_active`, `carrier_id`) VALUES
(23, 'ML 10', 'assets/promo/ic_tnt.png', 'Talk n Text Prepaid Sim', 'jdjdd', 1, NULL),
(24, 'fififi', 'assets/promo/ic_globe.png', 'fufu', 'fiif', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resellers`
--

CREATE TABLE `resellers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `primary_color` varchar(7) DEFAULT NULL,
  `secondary_color` varchar(7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `commission_rate` decimal(5,2) NOT NULL DEFAULT 0.10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `resellers`
--

INSERT INTO `resellers` (`id`, `user_id`, `company_name`, `logo_path`, `primary_color`, `secondary_color`, `created_at`, `commission_rate`) VALUES
(19, 25, NULL, NULL, NULL, NULL, '2025-12-22 02:27:07', 0.10);

-- --------------------------------------------------------

--
-- Table structure for table `reseller_clients`
--

CREATE TABLE `reseller_clients` (
  `id` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `reseller_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `sale_date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `reseller_id`, `client_id`, `amount`, `sale_date`) VALUES
(1, 10, 11, 50.00, '2025-12-21 17:17:56'),
(2, 10, 12, 50.00, '2025-12-21 17:18:24'),
(3, 20, 21, 100.00, '2025-12-22 01:51:28'),
(4, 20, 22, 100.00, '2025-12-22 01:51:51'),
(5, 20, 23, 100.00, '2025-12-22 01:52:12'),
(6, 25, 26, 50.00, '2025-12-22 14:14:59'),
(7, 25, 27, 50.00, '2025-12-23 06:27:25'),
(8, 25, 28, 50.00, '2025-12-23 06:57:21'),
(9, 25, 29, 50.00, '2025-12-23 12:27:43');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'site_name', 'CS-MOBILE DATA'),
(2, 'site_icon', 'assets/icon_6948daa99e56a.png'),
(3, 'language', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `troubleshooting_guides`
--

CREATE TABLE `troubleshooting_guides` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `category` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `login_code` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT 0,
  `role` enum('admin','user','reseller') NOT NULL DEFAULT 'user',
  `daily_limit` bigint(20) UNSIGNED DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `promo_id` int(11) DEFAULT NULL,
  `reseller_id` int(11) DEFAULT NULL,
  `credits` decimal(10,2) DEFAULT 0.00,
  `expiration_date` date DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Unpaid',
  `payment` decimal(10,2) NOT NULL DEFAULT 0.00,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `billing_month` date DEFAULT NULL,
  `is_reseller` tinyint(1) NOT NULL DEFAULT 0,
  `account_id` int(11) DEFAULT NULL,
  `client_limit` int(11) NOT NULL DEFAULT 0,
  `address` text NOT NULL,
  `bytes_in` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `bytes_out` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `profile_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `login_code`, `device_id`, `banned`, `role`, `daily_limit`, `created_at`, `promo_id`, `reseller_id`, `credits`, `expiration_date`, `status`, `payment`, `first_name`, `last_name`, `contact_number`, `billing_month`, `is_reseller`, `account_id`, `client_limit`, `address`, `bytes_in`, `bytes_out`, `profile_id`, `email`) VALUES
(5, 'cornerstone', '$2y$10$anwZ8COroUfjEvhJEjfA4eeODBNbbxcrQzZCNBZYPnZp6EF5Netc6', NULL, NULL, 0, 'admin', 0, '2025-12-21 08:39:55', NULL, NULL, 0.00, NULL, 'Unpaid', 0.00, 'Admin', 'User', '0', NULL, 0, NULL, 0, '', 0, 0, NULL, NULL),
(9, 'admin1', '$2y$10$F4ovFtD881a6QtXL1dm4TeKscusntd4SUzgvNmUls6tP85Zbl6myK', '27683884', NULL, 0, 'user', 1073741824, '2025-12-21 17:16:45', NULL, NULL, 0.00, NULL, 'Unpaid', 0.00, 'Ronald', 'Torrejos', '09663016917', '2025-12-31', 0, NULL, 0, '', 0, 0, NULL, NULL),
(13, 'Ronald', '$2y$10$PHsQYtKrBH8B8srX8/vFROKf1K5Jz2bvGmf30CucyRhzrDrGEz.p.', NULL, NULL, 0, 'admin', 0, '2025-12-21 19:11:07', NULL, NULL, 0.00, NULL, 'Unpaid', 0.00, 'Admin', 'User', '0', NULL, 0, NULL, 0, '', 0, 0, NULL, NULL),
(17, 'admin', '$2y$10$PzDUxJ0wECd04LfaTPqRZOByRA.gSxXeyAhnnw0JeqcNBD0GtezVG', NULL, NULL, 0, 'admin', 0, '2025-12-22 00:43:29', NULL, NULL, 0.00, NULL, 'Unpaid', 0.00, 'Admin', 'User', 'N/A', NULL, 0, NULL, 0, 'N/A', 0, 0, NULL, NULL),
(18, 'admin2', '$2y$10$8EuevB0r8p9.xY.FZ7I7WOsyjEJrxJsp18avZYmzGrpmo0BcAEczC', NULL, NULL, 0, 'admin', 0, '2025-12-22 00:44:59', NULL, NULL, 0.00, NULL, 'Unpaid', 0.00, 'Admin', 'User', '0', NULL, 0, NULL, 0, '', 0, 0, NULL, NULL),
(25, 'Reseller1', '$2y$10$J/yy5eIgsFFS.PyTO/p4ue/lDlXbHOO.Mhy2qvkS1GlsZa0s8gepu', NULL, NULL, 0, 'reseller', 0, '2025-12-22 02:27:07', NULL, NULL, 300.00, NULL, 'Unpaid', 0.00, 'Ronald Limpiado Torrejos', '', '09663016917', NULL, 1, 1, 10, 'Zone 9, Bonbon', 0, 0, NULL, NULL),
(28, 'Client 1', '$2y$10$H2Rc4pY4HzwURgkL1RPrEuC/W19srsPczv0PpiM.g.rF7FpzU4Pwq', '43447813', 'cde582064bb9d9cc', 0, 'user', 0, '2025-12-23 06:57:21', NULL, 25, 0.00, '2025-12-23', 'Unpaid', 0.00, 'Client', 'User', 'N/A', NULL, 0, NULL, 0, 'N/A', 0, 0, NULL, NULL),
(29, 'adminnn', '$2y$10$emEvLG.Npx6I8rflhSZBN.frjy3Bh8f0NhK9aKW.S7mnGFiwF.fte', '37924321', 'cde582064bb9d9cc', 0, 'user', 0, '2025-12-23 12:27:43', NULL, 25, 0.00, '2025-12-31', 'Unpaid', 0.00, 'Client', 'User', 'N/A', NULL, 0, NULL, 0, 'N/A', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vpn_profiles`
--

CREATE TABLE `vpn_profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ovpn_config` text NOT NULL,
  `type` enum('Premium','Freemium') NOT NULL DEFAULT 'Premium',
  `promo_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `icon_path` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vpn_sessions`
--

CREATE TABLE `vpn_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `ip_address` varchar(255) NOT NULL,
  `bytes_in` bigint(20) DEFAULT NULL,
  `bytes_out` bigint(20) DEFAULT NULL,
  `session_status` varchar(20) NOT NULL DEFAULT 'active',
  `profile_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `vpn_sessions`
--

INSERT INTO `vpn_sessions` (`id`, `user_id`, `start_time`, `end_time`, `ip_address`, `bytes_in`, `bytes_out`, `session_status`, `profile_id`, `session_id`) VALUES
(2, 28, '2025-12-23 03:17:53', '2025-12-23 03:17:55', '64.226.60.108', 0, 0, 'inactive', 3, NULL),
(3, 28, '2025-12-23 03:17:59', '2025-12-23 03:18:00', '64.226.60.108', 0, 0, 'inactive', 3, NULL),
(4, 28, '2025-12-23 03:21:38', '2025-12-23 03:21:40', '64.226.60.108', 0, 0, 'inactive', 4, NULL),
(5, 28, '2025-12-23 03:21:47', '2025-12-23 03:21:58', '64.226.60.108', 0, 0, 'inactive', 4, NULL),
(6, 28, '2025-12-23 03:22:03', '2025-12-23 03:22:06', '64.226.60.108', 0, 0, 'inactive', 4, NULL),
(7, 28, '2025-12-23 03:23:07', '2025-12-23 03:23:21', '64.226.60.108', 0, 0, 'inactive', 4, NULL),
(8, 28, '2025-12-23 03:23:25', '2025-12-23 04:03:12', '64.226.60.108', 0, 76, 'closed', 4, NULL),
(9, 28, '2025-12-23 04:03:12', '2025-12-23 04:03:26', '64.226.60.108', 312464, 93426, 'inactive', 5, NULL),
(10, 28, '2025-12-23 04:03:27', '2025-12-23 04:21:37', '64.226.60.108', 0, 0, 'closed', 5, NULL),
(11, 28, '2025-12-23 04:21:37', '2025-12-23 04:22:22', '64.226.60.108', 9304534, 598863, 'inactive', 6, NULL),
(12, 28, '2025-12-23 04:34:39', '2025-12-23 05:53:45', '64.226.60.108', 0, 0, 'closed', 6, NULL),
(13, 28, '2025-12-23 05:53:45', NULL, '110.54.226.182', 0, 200, 'active', 6, NULL),
(14, 29, '2025-12-23 08:08:30', NULL, '110.54.226.182', 0, 0, 'active', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zip_password`
--

CREATE TABLE `zip_password` (
  `id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admob_ads`
--
ALTER TABLE `admob_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admob_settings`
--
ALTER TABLE `admob_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_updates`
--
ALTER TABLE `app_updates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carriers`
--
ALTER TABLE `carriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reseller_id` (`reseller_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `promos`
--
ALTER TABLE `promos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resellers`
--
ALTER TABLE `resellers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `reseller_clients`
--
ALTER TABLE `reseller_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reseller_id` (`reseller_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reseller_id` (`reseller_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `troubleshooting_guides`
--
ALTER TABLE `troubleshooting_guides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `login_code` (`login_code`),
  ADD KEY `promo_id` (`promo_id`);

--
-- Indexes for table `vpn_profiles`
--
ALTER TABLE `vpn_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `promo_id` (`promo_id`);

--
-- Indexes for table `vpn_sessions`
--
ALTER TABLE `vpn_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `profile_id` (`profile_id`);

--
-- Indexes for table `zip_password`
--
ALTER TABLE `zip_password`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admob_ads`
--
ALTER TABLE `admob_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admob_settings`
--
ALTER TABLE `admob_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_updates`
--
ALTER TABLE `app_updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `promos`
--
ALTER TABLE `promos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `resellers`
--
ALTER TABLE `resellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `reseller_clients`
--
ALTER TABLE `reseller_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `troubleshooting_guides`
--
ALTER TABLE `troubleshooting_guides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `vpn_profiles`
--
ALTER TABLE `vpn_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vpn_sessions`
--
ALTER TABLE `vpn_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `zip_password`
--
ALTER TABLE `zip_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
