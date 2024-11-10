-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2024 at 02:19 PM
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
-- Database: `autoparts`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_description` varchar(200) NOT NULL,
  `category_picture` varchar(250) NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`, `category_picture`, `is_deleted`, `created_at`, `updated_at`) VALUES
(102, 'Headset', 'Experience Immersive Sound with the Ultimate Gaming Headset! Step into the game like never before with this high-quality gaming headset, designed to deliver an unmatched audio experience. Equipped wit', 'HEADSET2-removebg-preview.png', 0, '2024-11-02 13:16:29', '2024-11-02 13:16:29'),
(103, 'Keyboard ', 'Elevate your gaming experience with this premium gaming keyboard, designed for professional gamers. It features customizable RGB lighting, ultra-fast response times, and mechanical switches for a comf', 'FANTECH_MK876V2_ATOM87_RGB_MECHANICAL_KEYBOARD_SUMI_EDITION_-_BLACK-removebg-preview.png', 0, '2024-11-02 14:39:20', '2024-11-02 14:39:20'),
(104, 'Mouse ', 'Take your gaming performance to the next level with this advanced gaming mouse, designed for precision, speed, and comfort. It features high DPI sensitivity with customizable settings, allowing you to', 'FANTECH_WG12RS_RAIGOR_III_WIRELESS_GAMING_MOUSE_-_BLACK_-removebg-preview.png', 0, '2024-11-02 14:49:53', '2024-11-02 14:49:53'),
(105, 'Chair ', 'Experience ultimate comfort and support during long gaming sessions with this high-quality gaming chair. Designed with ergonomic features, it offers adjustable armrests, reclining backrest, and a head', 'FANTECH_LEDARE_GC192_GAMING_CHAIR___GREY-removebg-preview.png', 0, '2024-11-02 15:24:44', '2024-11-02 15:24:44'),
(106, 'Desk', 'Upgrade your gaming setup with this sleek, functional gaming desk designed for performance and style. With a spacious surface to accommodate multiple monitors, a dedicated cable management system, and', 'FANTECH_TIGRIS_GD214_GAMING_DESK-removebg-preview.png', 0, '2024-11-02 15:32:19', '2024-11-02 15:32:19'),
(107, 'Microphone', 'Achieve crystal-clear communication with this professional-grade gaming microphone, perfect for streaming, team chat, and content creation. It features high-definition sound capture, background noise ', 'Fantech-MC20-Professional-Condenser-Microphone-2-removebg-preview.png', 0, '2024-11-02 15:38:33', '2024-11-02 15:38:33');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_us_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT 1,
  `order_total` float NOT NULL,
  `order_status` enum('pending','cancelled','delivered') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_picture` varchar(200) NOT NULL,
  `product_price` float NOT NULL,
  `product_rate` enum('1','2','3','4','5') NOT NULL,
  `product_discount` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_state` enum('inStock','outOfStock') NOT NULL,
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(50) NOT NULL,
  `user_last_name` varchar(50) NOT NULL,
  `user_gender` enum('male','female') NOT NULL,
  `user_birth_date` date NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_phone_number` varchar(20) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_status` enum('active','deactivated') NOT NULL,
  `user_role` enum('superAdmin','admin','customer') NOT NULL DEFAULT 'customer',
  `is_deleted` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_us_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK_category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_us_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
