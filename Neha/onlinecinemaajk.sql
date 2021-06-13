create database onlinecinemaajk;
use onlinecinemaajk;

SHOW VARIABLES LIKE 'sql_mode';
set global sql_mode='';
SET SQL_SAFE_UPDATES = 0;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2019 at 02:21 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinecinemaajk`
--

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `serial_id` int(11) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `room_number` int(11) NOT NULL,
  `movie_id` varchar(128) NOT NULL,
  `gambar` varchar(128) NOT NULL,
  `roles` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` VALUES
(1, 18, 'kingMidas', 690, 1, '', 'master'),
(2, 19, 'jackolatern', 690, 1, '', 'user');
select * from room;

select count(room_number) as Number_Of_Users_In_Room from room where room_number=697;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `gambar` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
select * from users;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `gambar`) VALUES
(18, 'kingMidas', '$2b$10$V9St4zfZO2Tig5Id0.dCReCdZgxYOzZOHBqxN48Sdg.rb1ljg8Ur6', ''),
(19, 'jackolatern', '$2b$10$akZWGVVWBNUDaPvFC/kWTudQy0BrSQYpBSRdDBIY5QSq3deafDuJC', '');
/*
(18, 'kingMidas', '$2b$10$UDQJLfH0X/WnkoCeQ/S7uOwzjvGCFF7Bg2qoG6cAwU3KFVAapujM2', ''),
(19, 'jackolatern', 'jackolatern', '');
*/
--
-- Indexes for dumped tables
--

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`serial_id`);
ALTER TABLE `room`
  ADD FOREIGN KEY (`id_user`) references `users`(`id`);
--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `serial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
