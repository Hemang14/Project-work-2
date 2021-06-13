use onlinecinemaajk;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;

-- Database: `onlinecinemaajk`

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `user` varchar(128) NOT NULL,
  `gambar` varchar(128) NOT NULL,
  `roles` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `id_user`, `user`, `gambar`, `roles`) VALUES
(6, 8, 'king', '', 'master'),
(7, 18, 'kingMidas', '', 'user');

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
-- --------------------------------------------------------

--
-- Table structure for table `user_review`
--
CREATE TABLE user_review(
  id int NOT NULL,
  username varchar(50),
  movie_name varchar(50),
  review varchar(200),
  PRIMARY KEY(id)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

--
-- AUTO_INCREMENT for table `user_review`
--

ALTER TABLE user_review
  MODIFY id int NOT NULL AUTO_INCREMENT;

