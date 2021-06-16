create database onlinecinemaajk;
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
  `serial_id` int NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `room_number` int NOT NULL,
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
-- Table Structure for table 'Movies/show'
--
create table MOVIES_SHOWS(
slno int not null auto_increment,
 movie_show_indicator int,
 movie_show_id int,
 movie_show_name varchar(50),
 year_release year,
 genre varchar(30),
 count int,primary key(slno));

--
-- Dumping data for movies table
--
insert into MOVIES_SHOWS(movie_show_indicator,movie_show_id,movie_show_name,year_release,genre,count) values
 (1,001,"Joker",2019,"crime/drama",1),
 (1,002,"Avengers end game",2019,"action",1),
 (1,003,"The Imitation Game",2014,"war/drama",1),
 (1,004,"Black Widow",2021,"Adventure/action",1),
 (1,005,"Avatar",2009,"Sci-fi",1),
 (1,006,"Oblivion",2013,"Sci-fi",1),
 (1,007,"The Fault in Our Stars",2014,"Romance/drama",1),
 (1,008,"Harry Potter",2010,"Family",1),
 (1,009,"White House Down",2013,"Action/Thriller",1),
 (1,010,"F9",2021,"Action/Adventure",1),
 (1,011,"X-MEN",2014,"Action/Adventure",1),
 (1,012,"The perks of being a wallflower",2012,"Romance/Drama",1),
 (2,001,"Stranger things",2016,"Sci-fi",1),
 (2,002,"Breaking bad",2008,"crime",1),
 (2,003,"Friends",1994,"comedy",1),
 (2,004,"Grey's Anatomy",2005,"Drama",1),
 (2,005,"Cursed",2020,"Action/fiction",1),
 (2,006,"Peaky Blinders",2013,"Crime",1),
 (2,007,"The Queen's Gambit",2020,"History",1),
 (2,008,"Dark",2017,"Thriller",1),
 (2,009,"Emily in Paris",2020,"Comedy/drama",1),
 (2,010,"Ozark",2017,"Drama",1),
 (2,011,"Lupin",2021,"Mystery",1),
 (2,012,"The falcon and the Winter Soldier",2021,"Action/feedback",1);

 select * from MOVIES_SHOWS;

  select movie_show_name from MOVIES_SHOWS where genre = "Romance/drama";

 select movie_show_name from MOVIES_SHOWS where movie_show_indicator = 1;
--
-- Indexes for table `room`
--

ALTER TABLE `room`
  ADD PRIMARY KEY (`serial_id`);
-- ALTER TABLE `room`
--   ADD FOREIGN KEY (`id_user`) references `users`(`id`);
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
  MODIFY `serial_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


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
