-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2025 at 01:14 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'icon-chart-bar', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'icon-server', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'icon-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'icon-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'icon-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'icon-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'icon-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 7, 'Helpers', 'icon-cogs', '', NULL, '2025-05-22 03:10:28', '2025-05-22 03:10:28'),
(9, 8, 8, 'Scaffold', 'icon-keyboard', 'helpers/scaffold', NULL, '2025-05-22 03:10:28', '2025-05-22 03:10:28'),
(10, 8, 9, 'Database terminal', 'icon-database', 'helpers/terminal/database', NULL, '2025-05-22 03:10:28', '2025-05-22 03:10:28'),
(11, 8, 10, 'Laravel artisan', 'icon-terminal', 'helpers/terminal/artisan', NULL, '2025-05-22 03:10:28', '2025-05-22 03:10:28'),
(12, 8, 11, 'Routes', 'icon-list-alt', 'helpers/routes', NULL, '2025-05-22 03:10:28', '2025-05-22 03:10:28'),
(13, 0, 11, 'Attendances', 'icon-file', 'attendances', NULL, '2025-05-22 03:15:14', '2025-05-22 03:15:14');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '127.0.0.1', '[]', '2025-05-22 02:15:42', '2025-05-22 02:15:42'),
(2, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2025-05-22 02:15:54', '2025-05-22 02:15:54'),
(3, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2025-05-22 02:16:00', '2025-05-22 02:16:00'),
(4, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2025-05-22 02:16:02', '2025-05-22 02:16:02'),
(5, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2025-05-22 02:16:03', '2025-05-22 02:16:03'),
(6, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2025-05-22 02:16:06', '2025-05-22 02:16:06'),
(7, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2025-05-22 02:16:07', '2025-05-22 02:16:07'),
(8, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2025-05-22 02:16:09', '2025-05-22 02:16:09'),
(9, 1, 'admin/auth/users/create', 'GET', '127.0.0.1', '[]', '2025-05-22 02:17:22', '2025-05-22 02:17:22'),
(10, 1, 'admin/auth/users', 'POST', '127.0.0.1', '{\"username\":\"kaushik\",\"name\":\"kaushik\",\"password\":\"*****-filtered-out-*****\",\"password_confirmation\":\"123456789\",\"search_terms\":null,\"roles\":[null],\"permissions\":[null],\"_token\":\"dLQRIeyZBfZ3YTfYOaqP5vto6dkOFZ3mZwFckJ3R\"}', '2025-05-22 02:17:54', '2025-05-22 02:17:54'),
(11, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2025-05-22 02:17:54', '2025-05-22 02:17:54'),
(12, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2025-05-22 02:17:59', '2025-05-22 02:17:59'),
(13, 1, 'admin/auth/roles/create', 'GET', '127.0.0.1', '[]', '2025-05-22 02:18:01', '2025-05-22 02:18:01'),
(14, 1, 'admin/auth/roles', 'POST', '127.0.0.1', '{\"slug\":\"attendance\",\"name\":\"Attendance\",\"permissions\":[null],\"_token\":\"dLQRIeyZBfZ3YTfYOaqP5vto6dkOFZ3mZwFckJ3R\"}', '2025-05-22 02:19:19', '2025-05-22 02:19:19'),
(15, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2025-05-22 02:19:20', '2025-05-22 02:19:20'),
(16, 1, 'admin/auth/roles/2/edit', 'GET', '127.0.0.1', '[]', '2025-05-22 02:19:29', '2025-05-22 02:19:29'),
(17, 1, 'admin/auth/roles/2', 'PUT', '127.0.0.1', '{\"slug\":\"attendance\",\"name\":\"Attendance\",\"permissions\":[\"1\",null],\"_token\":\"dLQRIeyZBfZ3YTfYOaqP5vto6dkOFZ3mZwFckJ3R\",\"_method\":\"PUT\"}', '2025-05-22 02:19:34', '2025-05-22 02:19:34'),
(18, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2025-05-22 02:19:34', '2025-05-22 02:19:34'),
(19, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2025-05-22 02:19:39', '2025-05-22 02:19:39'),
(20, 1, 'admin/auth/users/2/edit', 'GET', '127.0.0.1', '[]', '2025-05-22 02:19:40', '2025-05-22 02:19:40'),
(21, 1, 'admin/auth/users/2', 'PUT', '127.0.0.1', '{\"username\":\"kaushik\",\"name\":\"kaushik\",\"password\":\"*****-filtered-out-*****\",\"password_confirmation\":\"$2y$12$ZtMlb5ZagSlrCWlEBqXf1.4rxJkOdoBkMeHuvZ.N\\/Ft0fz\\/3WiMEW\",\"roles\":[\"2\",null],\"search_terms\":null,\"permissions\":[\"1\",null],\"_token\":\"dLQRIeyZBfZ3YTfYOaqP5vto6dkOFZ3mZwFckJ3R\",\"_method\":\"PUT\"}', '2025-05-22 02:19:53', '2025-05-22 02:19:53'),
(22, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2025-05-22 02:19:53', '2025-05-22 02:19:53'),
(23, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2025-05-22 02:20:02', '2025-05-22 02:20:02'),
(24, 1, 'admin/auth/permissions', 'GET', '127.0.0.1', '[]', '2025-05-22 02:20:03', '2025-05-22 02:20:03'),
(25, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2025-05-22 02:20:09', '2025-05-22 02:20:09'),
(26, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2025-05-22 02:20:17', '2025-05-22 02:20:17'),
(27, 1, 'admin/auth/users', 'GET', '127.0.0.1', '[]', '2025-05-22 02:20:18', '2025-05-22 02:20:18'),
(28, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2025-05-22 02:20:49', '2025-05-22 02:20:49'),
(29, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2025-05-22 02:21:36', '2025-05-22 02:21:36'),
(30, 2, 'admin', 'GET', '127.0.0.1', '[]', '2025-05-22 02:21:48', '2025-05-22 02:21:48'),
(31, 2, 'admin', 'GET', '127.0.0.1', '[]', '2025-05-22 02:21:52', '2025-05-22 02:21:52'),
(32, 2, 'admin/auth/logout', 'GET', '127.0.0.1', '[]', '2025-05-22 02:21:56', '2025-05-22 02:21:56'),
(33, 1, 'admin', 'GET', '127.0.0.1', '[]', '2025-05-22 02:22:02', '2025-05-22 02:22:02'),
(34, 1, 'admin', 'GET', '127.0.0.1', '[]', '2025-05-22 03:12:31', '2025-05-22 03:12:31'),
(35, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2025-05-22 03:12:34', '2025-05-22 03:12:34'),
(36, 1, 'admin/helpers/scaffold', 'POST', '127.0.0.1', '{\"table_name\":\"attendances\",\"model_name\":\"App\\\\Models\\\\Attendance\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\AttendanceController\",\"create\":[\"controller\",\"menu_item\"],\"fields\":[{\"name\":\"user_id\",\"type\":\"integer\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"date\",\"type\":\"date\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"status\",\"type\":\"enum\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:15:14', '2025-05-22 03:15:14'),
(37, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2025-05-22 03:15:14', '2025-05-22 03:15:14'),
(38, 1, 'admin/helpers/scaffold', 'GET', '127.0.0.1', '[]', '2025-05-22 03:15:35', '2025-05-22 03:15:35'),
(39, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 03:15:37', '2025-05-22 03:15:37'),
(40, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 03:19:40', '2025-05-22 03:19:40'),
(41, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 03:23:26', '2025-05-22 03:23:26'),
(42, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:23:28', '2025-05-22 03:23:28'),
(43, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"12\",\"22\",\"52\",\"48\",\"9\",\"38\",\"36\",\"14\",\"4\",\"31\",\"7\",\"29\",\"30\",\"27\",null],\"search_terms\":null,\"date\":\"2025-05-23\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:23:42', '2025-05-22 03:23:42'),
(44, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:23:42', '2025-05-22 03:23:42'),
(45, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:25:59', '2025-05-22 03:25:59'),
(46, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"12\",\"22\",\"52\",\"32\",\"4\",\"14\",\"31\",\"7\",\"16\",\"27\",\"30\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\",\"_previous_\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/attendances\"}', '2025-05-22 03:26:12', '2025-05-22 03:26:12'),
(47, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:26:13', '2025-05-22 03:26:13'),
(48, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:26:54', '2025-05-22 03:26:54'),
(49, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"46\",\"38\",\"9\",\"36\",\"14\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:27:03', '2025-05-22 03:27:03'),
(50, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:27:03', '2025-05-22 03:27:03'),
(51, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:28:31', '2025-05-22 03:28:31'),
(52, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"12\",\"22\",\"48\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:28:40', '2025-05-22 03:28:40'),
(53, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:28:41', '2025-05-22 03:28:41'),
(54, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:28:58', '2025-05-22 03:28:58'),
(55, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"46\",\"22\",\"48\",\"36\",\"4\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:29:05', '2025-05-22 03:29:05'),
(56, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:29:06', '2025-05-22 03:29:06'),
(57, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:30:55', '2025-05-22 03:30:55'),
(58, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"46\",\"38\",\"9\",\"36\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:31:03', '2025-05-22 03:31:03'),
(59, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:31:03', '2025-05-22 03:31:03'),
(60, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:32:20', '2025-05-22 03:32:20'),
(61, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:32:23', '2025-05-22 03:32:23'),
(62, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 03:32:25', '2025-05-22 03:32:25'),
(63, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:32:27', '2025-05-22 03:32:27'),
(64, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"46\",\"38\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:32:34', '2025-05-22 03:32:34'),
(65, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:32:35', '2025-05-22 03:32:35'),
(66, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:33:31', '2025-05-22 03:33:31'),
(67, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"46\",\"38\",\"9\",\"36\",\"32\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:33:39', '2025-05-22 03:33:39'),
(68, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:33:40', '2025-05-22 03:33:40'),
(69, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"46\",\"38\",\"9\",\"32\",\"36\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:33:45', '2025-05-22 03:33:45'),
(70, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:33:46', '2025-05-22 03:33:46'),
(71, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:38:31', '2025-05-22 03:38:31'),
(72, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:39:24', '2025-05-22 03:39:24'),
(73, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:40:43', '2025-05-22 03:40:43'),
(74, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"46\",\"38\",\"48\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"1\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:40:50', '2025-05-22 03:40:50'),
(75, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:40:51', '2025-05-22 03:40:51'),
(76, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:41:53', '2025-05-22 03:41:53'),
(77, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"22\",\"52\",\"32\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:42:02', '2025-05-22 03:42:02'),
(78, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:42:03', '2025-05-22 03:42:03'),
(79, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:45:30', '2025-05-22 03:45:30'),
(80, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"search_terms\":null,\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:45:37', '2025-05-22 03:45:37'),
(81, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:45:37', '2025-05-22 03:45:37'),
(82, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"search_terms\":null,\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:45:41', '2025-05-22 03:45:41'),
(83, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:45:41', '2025-05-22 03:45:41'),
(84, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 03:45:51', '2025-05-22 03:45:51'),
(85, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:45:57', '2025-05-22 03:45:57'),
(86, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:47:41', '2025-05-22 03:47:41'),
(87, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_ids\":[\"12\",\"22\",\"48\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:47:48', '2025-05-22 03:47:48'),
(88, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:47:49', '2025-05-22 03:47:49'),
(89, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:49:47', '2025-05-22 03:49:47'),
(90, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"46\",\"52\",\"9\",\"4\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:49:53', '2025-05-22 03:49:53'),
(91, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:49:54', '2025-05-22 03:49:54'),
(92, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:51:53', '2025-05-22 03:51:53'),
(93, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"46\",\"52\",\"9\",\"36\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 03:51:59', '2025-05-22 03:51:59'),
(94, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:52:00', '2025-05-22 03:52:00'),
(95, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 03:53:32', '2025-05-22 03:53:32'),
(96, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:00:32', '2025-05-22 04:00:32'),
(97, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:00:46', '2025-05-22 04:00:46'),
(98, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:00:58', '2025-05-22 04:00:58'),
(99, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:01:00', '2025-05-22 04:01:00'),
(100, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:01:01', '2025-05-22 04:01:01'),
(101, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"10\",\"20\",null],\"search_terms\":null,\"date\":\"2025-05-24\",\"status\":\"absent\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 04:01:15', '2025-05-22 04:01:15'),
(102, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:01:15', '2025-05-22 04:01:15'),
(103, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:01:17', '2025-05-22 04:01:17'),
(104, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:01:25', '2025-05-22 04:01:25'),
(105, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:01:56', '2025-05-22 04:01:56'),
(106, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:04:12', '2025-05-22 04:04:12'),
(107, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2025-05-22 04:04:16', '2025-05-22 04:04:16'),
(108, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2025-05-22 04:04:58', '2025-05-22 04:04:58'),
(109, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:05:00', '2025-05-22 04:05:00'),
(110, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"33\",\"42\",\"18\",\"48\",\"25\",\"51\",null],\"search_terms\":null,\"date\":\"2025-05-24\",\"status\":\"present\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 04:05:31', '2025-05-22 04:05:31'),
(111, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:05:32', '2025-05-22 04:05:32'),
(112, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:05:34', '2025-05-22 04:05:34'),
(113, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2025-05-22 04:05:37', '2025-05-22 04:05:37'),
(114, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:06:48', '2025-05-22 04:06:48'),
(115, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2025-05-22 04:06:51', '2025-05-22 04:06:51'),
(116, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2025-05-22 04:07:14', '2025-05-22 04:07:14'),
(117, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2025-05-22 04:08:32', '2025-05-22 04:08:32'),
(118, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"1\"}', '2025-05-22 04:09:27', '2025-05-22 04:09:27'),
(119, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2025-05-22 04:09:47', '2025-05-22 04:09:47'),
(120, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\",\"per_page\":\"10\"}', '2025-05-22 04:11:36', '2025-05-22 04:11:36'),
(121, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"per_page\":\"10\",\"page\":\"1\"}', '2025-05-22 04:11:38', '2025-05-22 04:11:38'),
(122, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"per_page\":\"10\",\"page\":\"2\"}', '2025-05-22 04:11:40', '2025-05-22 04:11:40'),
(123, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"per_page\":\"10\",\"page\":\"3\"}', '2025-05-22 04:11:41', '2025-05-22 04:11:41'),
(124, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:15:18', '2025-05-22 04:15:18'),
(125, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:15:21', '2025-05-22 04:15:21'),
(126, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"46\",null],\"search_terms\":null,\"date\":\"2025-05-25\",\"status\":\"absent\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 04:15:32', '2025-05-22 04:15:32'),
(127, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:15:33', '2025-05-22 04:15:33'),
(128, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:16:25', '2025-05-22 04:16:25'),
(129, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:18:11', '2025-05-22 04:18:11'),
(130, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"22\",null],\"search_terms\":null,\"date\":\"2025-05-25\",\"status\":\"present\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 04:18:31', '2025-05-22 04:18:31'),
(131, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:18:32', '2025-05-22 04:18:32'),
(132, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:21:40', '2025-05-22 04:21:40'),
(133, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:21:42', '2025-05-22 04:21:42'),
(134, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2025-05-22 04:21:46', '2025-05-22 04:21:46'),
(135, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:21:49', '2025-05-22 04:21:49'),
(136, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"1\",\"45\",null],\"search_terms\":null,\"date\":\"2025-05-29\",\"status\":\"halfday\",\"_token\":\"SYTrkeo3hLBmWxASgt38MsbKv0Vc5apYuMuNONUg\"}', '2025-05-22 04:22:08', '2025-05-22 04:22:08'),
(137, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-22 04:22:09', '2025-05-22 04:22:09'),
(138, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-22 04:22:12', '2025-05-22 04:22:12'),
(139, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"page\":\"2\"}', '2025-05-22 04:22:15', '2025-05-22 04:22:15'),
(140, 1, 'admin', 'GET', '127.0.0.1', '[]', '2025-05-23 01:53:43', '2025-05-23 01:53:43'),
(141, 1, 'admin', 'GET', '127.0.0.1', '[]', '2025-05-23 01:53:45', '2025-05-23 01:53:45'),
(142, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-23 01:53:51', '2025-05-23 01:53:51'),
(143, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"per_page\":\"100\"}', '2025-05-23 01:53:59', '2025-05-23 01:53:59'),
(144, 1, 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_model\":\"App_Models_Attendance\",\"_action\":\"OpenAdmin_Admin_Grid_Tools_BatchDelete\",\"_key\":\"58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,79,80,82,83,84,85,86,87,88,89,90,91\",\"_token\":\"I8bHAMZahJfYtY6ACfl5oAv192vY9AhdLlnk9lnY\"}', '2025-05-23 01:54:07', '2025-05-23 01:54:07'),
(145, 1, 'admin/attendances/58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,79,80,82,83,84,85,86,87,88,89,90,91', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"I8bHAMZahJfYtY6ACfl5oAv192vY9AhdLlnk9lnY\"}', '2025-05-23 01:54:10', '2025-05-23 01:54:10'),
(146, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"per_page\":\"100\"}', '2025-05-23 01:54:11', '2025-05-23 01:54:11'),
(147, 1, 'admin/attendances', 'GET', '127.0.0.1', '{\"per_page\":\"100\"}', '2025-05-23 01:54:11', '2025-05-23 01:54:11'),
(148, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-23 01:54:41', '2025-05-23 01:54:41'),
(149, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"53\",\"46\",\"38\",null],\"search_terms\":null,\"date\":\"2025-05-22\",\"status\":\"present\",\"_token\":\"I8bHAMZahJfYtY6ACfl5oAv192vY9AhdLlnk9lnY\"}', '2025-05-23 01:54:57', '2025-05-23 01:54:57'),
(150, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-23 01:54:58', '2025-05-23 01:54:58'),
(151, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-23 01:55:00', '2025-05-23 01:55:00'),
(152, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-23 01:55:01', '2025-05-23 01:55:01'),
(153, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-23 03:18:17', '2025-05-23 03:18:17'),
(154, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"55\",\"53\",\"54\",null],\"search_terms\":null,\"date\":\"2025-05-23\",\"status\":\"present\",\"_token\":\"I8bHAMZahJfYtY6ACfl5oAv192vY9AhdLlnk9lnY\"}', '2025-05-23 03:18:29', '2025-05-23 03:18:29'),
(155, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-23 03:18:30', '2025-05-23 03:18:30'),
(156, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-23 03:18:32', '2025-05-23 03:18:32'),
(157, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-23 03:30:18', '2025-05-23 03:30:18'),
(158, 1, 'admin', 'GET', '127.0.0.1', '[]', '2025-05-23 05:30:09', '2025-05-23 05:30:09'),
(159, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-23 05:30:15', '2025-05-23 05:30:15'),
(160, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-23 05:30:18', '2025-05-23 05:30:18'),
(161, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-23 05:30:22', '2025-05-23 05:30:22'),
(162, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"55\",\"53\",null],\"search_terms\":null,\"date\":\"2025-05-24\",\"status\":\"halfday\",\"_token\":\"I8bHAMZahJfYtY6ACfl5oAv192vY9AhdLlnk9lnY\"}', '2025-05-23 05:30:37', '2025-05-23 05:30:37'),
(163, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-23 05:30:40', '2025-05-23 05:30:40'),
(164, 1, 'admin/attendances', 'POST', '127.0.0.1', '{\"user_id\":[\"55\",\"53\",null],\"search_terms\":null,\"date\":\"2025-05-25\",\"status\":\"absent\",\"_token\":\"I8bHAMZahJfYtY6ACfl5oAv192vY9AhdLlnk9lnY\"}', '2025-05-23 05:30:50', '2025-05-23 05:30:50'),
(165, 1, 'admin/attendances/create', 'GET', '127.0.0.1', '[]', '2025-05-23 05:30:52', '2025-05-23 05:30:52'),
(166, 1, 'admin/attendances', 'GET', '127.0.0.1', '[]', '2025-05-23 05:31:00', '2025-05-23 05:31:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2025-05-22 03:10:28', '2025-05-22 03:10:28');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2025-05-22 02:15:13', '2025-05-22 02:15:13'),
(2, 'Attendance', 'attendance', '2025-05-22 02:19:19', '2025-05-22 02:19:19');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$12$WNPOAvF6dYtOBpj/OjStseT8vR4Ajw/kbRbAi.vuSWqnPEHVESTkG', 'Administrator', NULL, NULL, '2025-05-22 02:15:13', '2025-05-22 02:15:13'),
(2, 'kaushik', '$2y$12$ZtMlb5ZagSlrCWlEBqXf1.4rxJkOdoBkMeHuvZ.N/Ft0fz/3WiMEW', 'kaushik', 'images/photo-1633332755192-727a05c4013d.jpeg', NULL, '2025-05-22 02:17:54', '2025-05-22 02:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_user_permissions`
--

INSERT INTO `admin_user_permissions` (`user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `status` enum('present','absent','halfday') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `user_id`, `date`, `status`, `created_at`, `updated_at`) VALUES
(92, 53, '2025-05-22', 'present', '2025-05-23 01:54:57', '2025-05-23 01:54:57'),
(95, 55, '2025-05-23', 'present', '2025-05-23 03:18:29', '2025-05-23 03:18:29'),
(96, 53, '2025-05-23', 'present', '2025-05-23 03:18:29', '2025-05-23 03:18:29'),
(97, 54, '2025-05-23', 'present', '2025-05-23 03:18:29', '2025-05-23 03:18:29'),
(98, 55, '2025-05-24', 'halfday', '2025-05-23 05:30:37', '2025-05-23 05:30:37'),
(99, 53, '2025-05-24', 'halfday', '2025-05-23 05:30:37', '2025-05-23 05:30:37'),
(100, 55, '2025-05-25', 'absent', '2025-05-23 05:30:51', '2025-05-23 05:30:51'),
(101, 53, '2025-05-25', 'absent', '2025-05-23 05:30:51', '2025-05-23 05:30:51');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_05_22_060526_create_attendances_table', 1),
(6, '2016_01_04_173148_create_admin_tables', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(53, 'Kaushik Dey', 'kaushik0077dey@gmail.com', NULL, '$2y$12$C5TCZegptUaOmtb9gSANHefUFtyplmlmwq6ELd7ow0/SR1gKBoutG', NULL, '2025-05-23 00:18:52', '2025-05-23 00:18:52'),
(54, 'test', 'test@gmail.com', NULL, '$2y$12$ev7p31yirQsDUCUIaCrn7eZWyGyFDtEi2eZgO48iL/dZsh3vHhWXi', NULL, '2025-05-23 01:58:54', '2025-05-23 01:58:54'),
(55, 'HTML', 'html@gmail.com', NULL, '$2y$12$uTS/n76Pm4NR7qUGYYw5v.u9rUyfJrUQ.RgNAE7WfSWedsQ1d64Qi', NULL, '2025-05-23 01:59:31', '2025-05-23 01:59:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
