-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2026 at 11:30 AM
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
-- Database: `train_view_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT 'pending',
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `room_id`, `check_in`, `check_out`, `status`, `booking_date`) VALUES
(2, 6, 5, '2026-07-15', '2026-07-08', '', '2026-07-11 11:34:04'),
(3, 7, 1, '2026-07-16', '2026-07-18', '', '2026-07-11 16:32:52'),
(4, 6, 1, '2026-07-20', '2026-07-27', '', '2026-07-12 15:41:48'),
(5, 6, 5, '2026-07-02', '2026-07-02', '', '2026-07-12 15:48:19'),
(6, 18, 2, '2026-07-13', '2026-07-15', '', '2026-07-12 19:36:47'),
(7, 18, 2, '2026-07-30', '2026-07-31', '', '2026-07-12 19:37:09'),
(9, 19, 5, '2026-07-23', '2026-07-26', '', '2026-07-12 19:46:12'),
(10, 19, 3, '2026-07-16', '2026-07-12', '', '2026-07-12 19:49:40'),
(11, 19, 3, '2026-07-08', '2026-07-14', '', '2026-07-12 20:05:32'),
(13, 19, 5, '2026-07-29', '2026-07-31', 'pending', '2026-07-15 07:56:00'),
(14, 19, 5, '2026-07-15', '2026-07-22', '', '2026-07-15 08:08:13');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `capacity` int(11) DEFAULT NULL,
  `status` enum('available','booked','maintenance') DEFAULT 'available',
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `room_name`, `room_type`, `price`, `capacity`, `status`, `description`) VALUES
(1, 'Two-Bedroom Chalet (8 pax)', 'Chalet', 12000.00, 8, 'available', '1 bunk bed and 1 large double bed (x2 sets)'),
(2, 'Superior Triple Room', 'Triple', 6000.00, 3, 'available', '1 single bed and 1 large double bed'),
(3, 'Two-Bedroom Chalet (6 pax)', 'Chalet', 10000.00, 6, 'available', '1 single bed and 1 large double bed (x2 sets)'),
(4, 'Executive Suite', 'Suite', 15000.00, 5, 'available', '1 extra-large double bed, 1 bunk bed, 2 sofa beds'),
(5, 'Superior Family Room', 'Family', 8000.00, 4, 'available', '1 bunk bed and 1 large double bed'),
(6, 'Deluxe Double Room', 'Double', 4500.00, 2, 'available', '1 extra-large double bed');

-- --------------------------------------------------------

--
-- Table structure for table `service_requests`
--

CREATE TABLE `service_requests` (
  `request_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL,
  `request_type` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_requests`
--

INSERT INTO `service_requests` (`request_id`, `user_id`, `room_number`, `request_type`, `message`, `status`, `created_at`) VALUES
(1, 7, '1', 'Extra Towels', 'plz give soon', 'Completed', '2026-07-12 18:27:50'),
(2, 7, '2', 'Food Order', 'give', 'Completed', '2026-07-12 18:28:50'),
(3, 7, '2', 'Food Order', 'give', 'Completed', '2026-07-12 18:29:00'),
(4, 19, '4', 'Room Cleaning', 'plz come soon', 'Completed', '2026-07-12 19:54:28'),
(5, 19, '5', 'Extra Towels', 'plz give ', 'Completed', '2026-07-12 20:17:47'),
(6, 19, '1', 'Food Order', 'plz come soon i m hungry..', 'Completed', '2026-07-12 20:19:19'),
(7, 19, '5', 'Room Cleaning', 'come soon', 'Completed', '2026-07-12 20:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('customer','staff','admin') NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `email`, `created_at`) VALUES
(6, 'root', '$2y$10$/SLev6I3dJTsmn3wStJozOEqg7Jcn4j1rOS5uwdGjuYxA6vQsV4KC', 'customer', NULL, '2026-07-11 08:33:30'),
(7, 'nimesha', '$2y$10$H29AU.xpZdpoA07RGdUBQuCvyhGjmnrdMtE45WdM.ZQj3KUTnHLq2', 'customer', NULL, '2026-07-11 11:44:49'),
(16, 'nipuni', 'nipu', 'admin', NULL, '2026-07-12 15:00:57'),
(17, 'sadeepa', '$2y$10$fKY.nEwhuRcOtRBauxfhcePy5nnhNdZ03zxIop7iFbBOLCWhFUPxa', 'staff', NULL, '2026-07-12 17:19:14'),
(18, 'sasini', '$2y$10$gb5a8SiM0KprAa3Cx2Ep9eOraMRooXFhvWw1I4dc/V4JRdge1f.La', 'customer', NULL, '2026-07-12 19:36:04'),
(19, 'nimal', '$2y$10$WiaR9txTK0XRkJ2HCmk0qum2hPTHnXkrDpn9sXmgvb/2sgbbYFaiG', 'customer', NULL, '2026-07-12 19:43:22'),
(20, 'kavi', '$2y$10$FQ08czr.N2qYrijRDQR5COcCDZxcDSdHbrmQaLbsbEV6INNWhFjUG', 'staff', NULL, '2026-07-12 19:53:08'),
(21, 'kavi', '$2y$10$qSq.AQ4aNtBCWlCTNk/owedJmp0ULp7sksn2AX6U8tpyqhpbZ776i', 'staff', NULL, '2026-07-12 19:56:25'),
(22, 'kavi', '$2y$10$kPi2cqPKRwwc9WpEtI2ixuu8rbopSw5/kNYe.AQAWho26QnK29ooG', 'customer', NULL, '2026-07-12 20:03:20'),
(23, 'kavi', '$2y$10$cQR5V5ieyJz9cMwIkJErGeX3Mb2KcsJoV8GssaUR8KuR7FHEuxJx.', 'staff', NULL, '2026-07-12 20:03:36'),
(26, 'sumudu', '$2y$10$Rzv.LvMM6aWyMkxWyRPu9uXbtyn1jJuw.5Lo/NkDPBrYm6oR23IFq', 'staff', NULL, '2026-07-13 12:26:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `service_requests`
--
ALTER TABLE `service_requests`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_requests`
--
ALTER TABLE `service_requests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
