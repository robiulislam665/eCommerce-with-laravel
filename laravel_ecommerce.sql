-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2019 at 09:23 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Super Admin' COMMENT 'admin|Super Admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone_no`, `avatar`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'robiulislam.info665@gmail.com', '$2y$10$tPvZw2VfwP3BoHFsMb76C.klRqRljGPCJBv5DKR2VgeAbPCMoqWpC', '01675942429', NULL, 'Super Admin', 'xInhAeGv1pix0yKXZxLXnzDW5PgeNmPVI2PjrXRC0Vzto1XCln6bL1AHIKAr', '2019-01-30 17:27:17', '2019-02-02 14:57:12');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Huawei', 'Huawei is a leading global provider of information and communications technology (ICT) infrastructure and smart devices. With integrated solutions across four key domains – telecom networks, IT, smart devices, and cloud services – we are committed to bringing digital to every person, home and organization for a fully connected, intelligent world.', '1548088140.png', '2019-01-21 10:29:00', '2019-01-21 10:29:00'),
(2, 'iPhone', 'The iPhone is a smartphone made by Apple that combines a computer, iPod, digital camera and cellular phone into one device with a touchscreen interface. The iPhone runs the iOS operating system (OS), and as of 2017, there were 2.2 million apps available for it through the Apple App Store, according to Statista.', '1548088294.png', '2019-01-21 10:31:34', '2019-01-21 10:31:34'),
(3, 'Samsung', 'The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.', '1548088367.png', '2019-01-21 10:32:47', '2019-01-21 10:32:47'),
(4, 'Xaomi', 'The \"MI\" in our logo stands for “Mobile Internet”. It also has other meanings, including \"Mission Impossible\", because Xiaomi faced many challenges that\r\nhad seemed impossible to defy in our early days.', '1548088629.png', '2019-01-21 10:37:09', '2019-01-21 10:37:09'),
(5, 'Others', NULL, '1548089872.png', '2019-01-21 10:57:52', '2019-01-21 10:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `order_id`, `ip_address`, `product_quantity`, `created_at`, `updated_at`) VALUES
(9, 7, NULL, NULL, '127.0.0.1', 1, '2019-01-27 14:56:24', '2019-01-27 14:56:24'),
(10, 14, 10, 4, '127.0.0.1', 2, '2019-01-28 03:54:54', '2019-02-04 11:51:14'),
(11, 13, 10, 5, '127.0.0.1', 2, '2019-01-30 10:43:41', '2019-02-04 11:54:18'),
(12, 14, NULL, NULL, '::1', 2, '2019-01-31 14:29:57', '2019-01-31 14:30:12'),
(13, 13, NULL, NULL, '::1', 1, '2019-01-31 14:30:01', '2019-01-31 14:30:01'),
(14, 12, NULL, NULL, '::1', 1, '2019-01-31 14:30:03', '2019-01-31 14:30:03'),
(15, 7, 10, 5, '127.0.0.1', 1, '2019-02-04 11:53:32', '2019-02-04 11:54:18'),
(16, 8, 10, 6, '127.0.0.1', 1, '2019-02-04 13:08:51', '2019-02-04 13:10:03'),
(17, 13, 10, 6, '127.0.0.1', 1, '2019-02-04 13:09:00', '2019-02-04 13:10:03'),
(18, 13, NULL, NULL, '127.0.0.1', 2, '2019-02-05 12:41:56', '2019-02-05 13:34:30'),
(19, 8, NULL, NULL, '127.0.0.1', 1, '2019-02-05 13:37:49', '2019-02-05 13:37:49'),
(24, 13, 10, NULL, '127.0.0.1', 2, '2019-02-05 13:46:06', '2019-02-05 13:46:56'),
(25, 12, 10, NULL, '127.0.0.1', 1, '2019-02-05 13:46:07', '2019-02-05 13:46:07'),
(26, 11, 10, NULL, '127.0.0.1', 1, '2019-02-05 13:46:54', '2019-02-05 13:46:54'),
(27, 7, 10, NULL, '127.0.0.1', 1, '2019-02-05 13:46:59', '2019-02-05 13:46:59'),
(28, 9, 10, NULL, '127.0.0.1', 1, '2019-02-05 13:47:03', '2019-02-05 13:47:03'),
(29, 6, 10, NULL, '127.0.0.1', 1, '2019-02-05 13:49:18', '2019-02-05 13:49:18'),
(30, 5, 10, NULL, '127.0.0.1', 1, '2019-02-05 13:49:25', '2019-02-05 13:49:25'),
(31, 4, 10, NULL, '127.0.0.1', 1, '2019-02-05 13:49:28', '2019-02-05 13:49:28'),
(32, 1, 10, NULL, '127.0.0.1', 1, '2019-02-05 13:49:32', '2019-02-05 13:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(2, 'Mobile', 'MAKING QUALITY TECHNOLOGY\r\nACCESSIBLE TO EVERYONE.', '1548088785.png', NULL, '2019-01-21 10:39:45', '2019-01-21 10:39:45'),
(3, 'Household', 'Household needed all .....', '1548089674.png', NULL, '2019-01-21 10:54:34', '2019-01-21 10:54:34'),
(4, 'Fasion', NULL, '1548089715.png', NULL, '2019-01-21 10:55:15', '2019-01-21 10:55:15'),
(5, 'Sony', NULL, '1548090174.png', 2, '2019-01-21 11:02:55', '2019-01-21 11:02:55'),
(6, 'samsung Mobile', 'The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', '1548090460.png', 2, '2019-01-21 11:07:40', '2019-01-21 11:07:40'),
(7, 'Fan', 'Fun...The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', '1548090725.png', 3, '2019-01-21 11:12:05', '2019-01-21 11:12:05'),
(8, 'Bulb', 'light The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', '1548091038.png', 3, '2019-01-21 11:17:18', '2019-01-21 11:17:18'),
(9, 'Womens', 'Women', '1548092690.png', 4, '2019-01-21 11:23:22', '2019-01-21 11:44:50'),
(10, 'Mens', 'men Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '1548091532.png', 4, '2019-01-21 11:25:32', '2019-01-21 11:25:32'),
(11, 'Boys Collection', 'boys collection Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', '1548091958.jpg', 4, '2019-01-21 11:32:38', '2019-01-21 11:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_11_28_201929_create_products_table', 1),
(4, '2018_11_29_084335_create_categories_table', 1),
(5, '2018_11_29_084559_create_brands_table', 1),
(7, '2018_11_29_091258_create_product_images_table', 1),
(9, '2019_01_25_093549_create_carts_table', 2),
(10, '2019_01_29_180836_create_settings_table', 3),
(11, '2019_01_29_190326_create_payments_table', 4),
(12, '2019_01_25_093402_create_orders_table', 5),
(14, '2018_11_29_084720_create_admins_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `is_seen_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `payment_id`, `ip_address`, `name`, `phone_no`, `shipping_address`, `email`, `message`, `is_paid`, `is_completed`, `is_seen_by_admin`, `transaction_id`, `created_at`, `updated_at`) VALUES
(6, 10, 3, '127.0.0.1', 'Robiul Islam', '01741434481', 'Dhaka Mirpur 1', 'robiulislam.info665@gmail.com', 'Fine', 1, 1, 1, '123456', '2019-02-04 13:10:03', '2019-02-04 13:10:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '1',
  `no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'payment no',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'agent|personal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `image`, `short_name`, `priority`, `no`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Cash_in', 'cash.jpg', 'cash_in', 1, NULL, NULL, '2019-01-29 19:11:01', '2019-01-29 19:11:01'),
(2, 'Bkash', 'bkash.jpg', 'bkash', 2, '01741434481', 'personal', '2019-01-29 19:11:01', '2019-01-29 19:11:01'),
(3, 'Rocket', 'rocket.jpg', 'rocket', 3, '01741434481', 'personal', '2019-01-29 19:11:01', '2019-01-29 19:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `offer_price` int(11) DEFAULT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `title`, `description`, `slug`, `quantity`, `price`, `status`, `offer_price`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 'Xiaomi Redmi Note 5', 'Xiaomi presents the Redmi Note 5 as their main mid-range model in 2018 following the success of the Xiaomi Mi A1, although unfortunately for lovers of pure Android it has the MIUI ROM. The Xiaomi Redmi Note 5 does not stand out in terms of design, as it has the same aesthetics as the Redmi 5 Plus but with a double rear camera, which is in a vertical position following the lead of the Apple iPhone X. A good useful surface of 77% that forces the use of on-screen buttons, which can be a downside for some users.\r\n\r\nRegarding the hardware, it is mounted with the latest Qualcomm SOC from the 630 range, the Octa core Snapdragon 636 that accompanies the Adreno 509 GPU, with good enough power and consumption for day-to-day use. In terms of the camera, the manufacturer initially announced a new Sony sensor, the IMX486 with an f/2.0 aperture, although the unit we have tested comes with a Samsung sensor. It is accompanied on the back by a second 5MP sensor for a bokeh effect. On the front, likewise, the manufacturer indicated a camera with the 20MP Sony IMX376 sensor with an f/2.0 aperture, but the unit tested had an Omnivision OV13855. Xiaomi has focused on the camera AI that with the double camera can more accurately identify objects and faces, with it also being used for facial unlocking. The sensor pixel size of 1.4μm and the f/1.9 aperture also help to capture clearer images.', 'xiaomi-redmi-note-5', 5, 20000, 0, NULL, 1, '2019-01-21 10:47:03', '2019-01-21 10:47:03'),
(2, 2, 3, 'Xiaomi Redmi Note 5 pro', 'Xiaomi presents the Redmi Note 5 as their main mid-range model in 2018 following the success of the Xiaomi Mi A1, although unfortunately for lovers of pure Android it has the MIUI ROM. The Xiaomi Redmi Note 5 does not stand out in terms of design, as it has the same aesthetics as the Redmi 5 Plus but with a double rear camera, which is in a vertical position following the lead of the Apple iPhone X. A good useful surface of 77% that forces the use of on-screen buttons, which can be a downside for some users.\r\n\r\nRegarding the hardware, it is mounted with the latest Qualcomm SOC from the 630 range, the Octa core Snapdragon 636 that accompanies the Adreno 509 GPU, with good enough power and consumption for day-to-day use. In terms of the camera, the manufacturer initially announced a new Sony sensor, the IMX486 with an f/2.0 aperture, although the unit we have tested comes with a Samsung sensor. It is accompanied on the back by a second 5MP sensor for a bokeh effect. On the front, likewise, the manufacturer indicated a camera with the 20MP Sony IMX376 sensor with an f/2.0 aperture, but the unit tested had an Omnivision OV13855. Xiaomi has focused on the camera AI that with the double camera can more accurately identify objects and faces, with it also being used for facial unlocking. The sensor pixel size of 1.4μm and the f/1.9 aperture also help to capture clearer images.', 'xiaomi-redmi-note-5-pro', 5, 18500, 0, NULL, 1, '2019-01-21 10:48:09', '2019-01-21 10:48:09'),
(3, 2, 3, 'Samsung Galaxy S6', 'The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', 'samsung-galaxy-s6', 10, 13990, 0, NULL, 1, '2019-01-21 10:52:51', '2019-01-21 10:52:51'),
(4, 3, 5, 'Table', 'The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', 'table', 1, 400, 0, NULL, 1, '2019-01-21 11:00:24', '2019-01-21 11:00:24'),
(5, 5, 2, 'iphon3', 'iphone ...The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', 'iphon3', 9, 90090, 0, NULL, 1, '2019-01-21 11:05:29', '2019-01-21 11:05:29'),
(6, 6, 3, 'Samsung Galaxy core prime', 'The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', 'samsung-galaxy-core-prime', 7, 13000, 0, NULL, 1, '2019-01-21 11:09:49', '2019-01-21 11:09:49'),
(7, 7, 5, 'Ceiling Fan', 'Ceiling  faan...The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', 'ceiling-fan', 18, 1890, 0, NULL, 1, '2019-01-21 11:13:35', '2019-01-21 11:13:35'),
(8, 7, 5, 'Table Fan', 'table fan The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', 'table-fan', 2, 890, 0, NULL, 1, '2019-01-21 11:15:01', '2019-01-21 11:15:01'),
(9, 8, 5, 'Yellow bulb', 'Yellow bulb The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', 'yellow-bulb', 1, 300, 0, NULL, 1, '2019-01-21 11:20:00', '2019-01-21 11:20:00'),
(10, 8, 5, 'LED bulb', 'led bulb The Vision 2020 is at the core of our commitment to create a better world full of richer digital experiences, through innovative technology and products.\r\nThe goal of the vision is to become a beloved brand, an innovative company, and an admired company. For this, we dedicate our efforts to creativity and innovation, shared value with our partners, and our great people.\r\nWe have delivered world best products and services through passion for innovation and optimal operation. \r\nWe look forward to exploring new business areas such as healthcare and automotive electronics, and continue our journey through history of innovation. \r\nSamsung Electronics will welcome new challenges and opportunities with joy.', 'led-bulb', 12, 560, 0, NULL, 1, '2019-01-21 11:21:42', '2019-01-21 11:21:42'),
(11, 10, 5, 'White T-shirt', 't-shirt', 'white-t-shirt', 15, 290, 0, NULL, 1, '2019-01-21 11:29:05', '2019-01-21 11:29:05'),
(12, 10, 5, 'Printed Shirt', 'printed shirt', 'printed-shirt', 21, 670, 0, NULL, 1, '2019-01-21 11:30:56', '2019-01-21 11:30:56'),
(13, 11, 5, 'White T-shirt', 'white t-shirt Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 'white-t-shirt', 20, 220, 0, NULL, 1, '2019-01-21 11:35:53', '2019-01-21 11:35:53'),
(14, 9, 5, 'Women lehonga', 'lehonga', 'women-lehonga', 12, 1390, 0, NULL, 1, '2019-01-21 11:40:07', '2019-01-21 11:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '1548089223.png', '2019-01-21 10:47:03', '2019-01-21 10:47:03'),
(2, 2, '1548089289.png', '2019-01-21 10:48:09', '2019-01-21 10:48:09'),
(3, 3, '1548089571.png', '2019-01-21 10:52:51', '2019-01-21 10:52:51'),
(4, 4, '1548090024.png', '2019-01-21 11:00:24', '2019-01-21 11:00:24'),
(5, 5, '1548090329.png', '2019-01-21 11:05:30', '2019-01-21 11:05:30'),
(6, 6, '1548090589.png', '2019-01-21 11:09:49', '2019-01-21 11:09:49'),
(7, 7, '1548090815.png', '2019-01-21 11:13:35', '2019-01-21 11:13:35'),
(8, 8, '1548090901.png', '2019-01-21 11:15:01', '2019-01-21 11:15:01'),
(9, 9, '1548091201.png', '2019-01-21 11:20:01', '2019-01-21 11:20:01'),
(10, 10, '1548091302.png', '2019-01-21 11:21:43', '2019-01-21 11:21:43'),
(11, 11, '1548091745.jpg', '2019-01-21 11:29:05', '2019-01-21 11:29:05'),
(12, 12, '1548091856.jpg', '2019-01-21 11:30:56', '2019-01-21 11:30:56'),
(13, 13, '1548092153.png', '2019-01-21 11:35:53', '2019-01-21 11:35:53'),
(14, 14, '1548092408.jpg', '2019-01-21 11:40:08', '2019-01-21 11:40:08'),
(15, 15, '1548092537.jpg', '2019-01-21 11:42:17', '2019-01-21 11:42:17');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` int(10) UNSIGNED NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `email`, `name`, `phone_no`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 'robiul@gmail.com', 'Robiul', '01741434481', 100, '2019-01-29 18:15:20', '2019-01-29 18:15:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0=Inactive|1=Active|2=Ban',
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `phone_no`, `email`, `password`, `street_address`, `status`, `ip_address`, `remember_token`, `created_at`, `updated_at`) VALUES
(10, 'Robiul', 'Islam', 'robiulislam', '01741434481', 'robiulislam.info665@gmail.com', '$2y$10$ZD960WKphu1gZC/8SYda0u6G9clYwfW61mlNQivnBlGitJl8lKAle', 'robiulislam.info665@gmail.com', 1, '127.0.0.1', 'ykLfj7Nq7wEkp62iXtdcbTyZKauC7oDpdY70WMXcAWKXc9MmUOowpy0WNt0p', '2019-01-22 07:46:26', '2019-01-24 12:59:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_short_name_unique` (`short_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_no_unique` (`phone_no`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
