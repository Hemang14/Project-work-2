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
  `user_name` varchar(128) NOT NULL,
  `room_number` int NOT NULL,
  `roles` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` VALUES
('Admin', 690, 'master'),
('jackolatern', 690, 'user');
select * from room;

select count(room_number) as Number_Of_Users_In_Room from room where room_number=697;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
select * from users;
--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(18, 'Admin', '$2b$10$cBZ4G/w1CrjGMyof48qa9.8ftpOXs7tuusV4JjbTcjf.1/aDLm5uy'),
(19, 'jackolatern', '$2b$10$akZWGVVWBNUDaPvFC/kWTudQy0BrSQYpBSRdDBIY5QSq3deafDuJC');
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
  star int,
  PRIMARY KEY(id)
);

INSERT INTO user_review(id,username,movie_name,review,star) VALUES
(1,'Hemang','joker','Rev1',5),(2,'Adam','Black Widow','Rev2',4),(3,'Otis','White House Down','Rev3',5);
--
-- Table structure for table contactus
--
CREATE TABLE contact_info(
  id int NOT NULL,
  email varchar(50),
  address varchar(150),
  username varchar(50),
  message varchar(200),
  PRIMARY KEY(id)
);
select * from contact_info;

INSERT INTO contact_info(id,email,address,username,message) VALUES 
(1,'Adam@gmail.com','add1','Adam','msg1'),(2,'hemang@gmail.com','add2','Hemang','msg2'),(3,'Otis@gmail.com','add3','Otis','msg3');
--
-- Table Structure for table feedback
--
CREATE TABLE user_feedback(
  id int NOT NULL,
  username varchar(50),
  email varchar(50),
  country varchar(50),
  video_clarity varchar(50),
  video_content varchar(50),
  communication varchar(50),
  general_feedback varchar(200),
  PRIMARY KEY(id)
);
select * from user_feedback;

INSERT INTO `user_feedback` (`id`,`username`,`email`,`country`,`video_clarity`,`video_content`,`communication`,`general_feedback`) VALUES (1,"Yuli","libero.Morbi@velitAliquam.edu","Puerto Rico","works","works","works","arcu eu odio tristique pharetra."),(2,"Abel","Fusce.aliquam@aliquetvel.ca","Papua New Guinea","can be better","can be better","works","eu tempor erat neque non"),(3,"Avram","blandit@Cumsociisnatoque.edu","Viet Nam","good","can be better","can be better","hendrerit id, ante. Nunc mauris"),(4,"Keaton","tellus.Suspendisse@hendreritnequeIn.co.uk","Palau","can be better","can be better","can be better","vulputate, nisi sem semper erat,"),(5,"Jerry","adipiscing.elit@Maurismagna.ca","Anguilla","works","best","can be better","non ante bibendum ullamcorper. Duis"),(6,"Yvonne","quis@SednequeSed.co.uk","Morocco","good","works","can be better","elementum, lorem ut aliquam iaculis,"),(7,"Oprah","dis@lectus.org","France","best","can be better","works","libero. Morbi accumsan laoreet ipsum."),(8,"Kay","urna.et.arcu@pharetrafelis.net","Saint Kitts and Nevis","best","works","good","metus vitae velit egestas lacinia."),(9,"Erich","elit.pede@acfacilisisfacilisis.edu","Austria","best","good","works","ut odio vel est tempor"),(10,"Giselle","penatibus@ami.co.uk","Japan","best","works","best","nulla at sem molestie sodales.");
INSERT INTO `user_feedback` (`id`,`username`,`email`,`country`,`video_clarity`,`video_content`,`communication`,`general_feedback`) VALUES (11,"Erin","sit@tellus.org","Maldives","works","works","can be better","in faucibus orci luctus et"),(12,"Nell","elementum.lorem.ut@elitEtiam.co.uk","Heard Island and Mcdonald Islands","best","works","can be better","tincidunt, nunc ac mattis ornare,"),(13,"Alika","lacus.Ut.nec@erat.co.uk","India","good","can be better","good","commodo hendrerit. Donec porttitor tellus"),(14,"Aquila","vitae.sodales.at@eunullaat.ca","Somalia","best","can be better","best","nibh. Phasellus nulla. Integer vulputate,"),(15,"Kaseem","non@acarcu.net","Cuba","can be better","good","good","lorem ac risus. Morbi metus.");
INSERT INTO `user_feedback` (`id`,`username`,`email`,`country`,`video_clarity`,`video_content`,`communication`,`general_feedback`) VALUES(16,"September","diam.Duis@vulputate.net","San Marino","best","best","good","aliquet lobortis, nisi nibh lacinia"),(17,"Destiny","metus.facilisis.lorem@consectetuer.com","French Southern Territories","can be better","works","works","Nunc mauris. Morbi non sapien"),(18,"Wynne","Mauris.blandit.enim@velitin.net","Nicaragua","best","best","best","Etiam imperdiet dictum magna. Ut"),(19,"Dawn","nunc.In@vitae.ca","Angola","works","good","best","egestas ligula. Nullam feugiat placerat"),(20,"Beau","aptent@consectetuer.com","Japan","good","good","works","vehicula aliquet libero. Integer in"),(21,"Wendy","sagittis.Nullam.vitae@non.net","South Africa","good","good","best","Aliquam fringilla cursus purus. Nullam"),(22,"Paul","Vestibulum.ut.eros@tincidunt.co.uk","Colombia","works","good","can be better","ac mattis semper, dui lectus"),(23,"Evelyn","tempor@pretiumet.edu","Lebanon","can be better","works","best","ornare lectus justo eu arcu."),(24,"Steven","tristique@dictumeu.com","United States","can be better","can be better","can be better","eu nibh vulputate mauris sagittis");
--
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
 count int,
 rating int,
 primary key(slno));

--
-- Dumping data for movies table
--
insert into MOVIES_SHOWS(movie_show_indicator,movie_show_id,movie_show_name,year_release,genre,count,rating) values
 (1,001,"Joker",2019,"crime/drama",1,3),
 (1,002,"Avengers end game",2019,"action",1,5),
 (1,003,"The Imitation Game",2014,"war/drama",1,4),
 (1,004,"Black Widow",2021,"Adventure/action",1,5),
 (1,005,"Avatar",2009,"Sci-fi",1,3),
 (1,006,"Oblivion",2013,"Sci-fi",1,2),
 (1,007,"The Fault in Our Stars",2014,"Romance/drama",1,1),
 (1,008,"Harry Potter",2010,"Family",1,5),
 (1,009,"White House Down",2013,"Action/Thriller",1,2),
 (1,010,"F9",2021,"Action/Adventure",1,4),
 (1,011,"X-MEN",2014,"Action/Adventure",1,1),
 (1,012,"The perks of being a wallflower",2012,"Romance/Drama",1,4),
 (2,001,"Stranger things",2016,"Sci-fi",1,5),
 (2,002,"Breaking bad",2008,"crime",1,4),
 (2,003,"Friends",1994,"comedy",1,2),
 (2,004,"Grey's Anatomy",2005,"Drama",1,2),
 (2,005,"Cursed",2020,"Action/fiction",1,5),
 (2,006,"Peaky Blinders",2013,"Crime",1,3),
 (2,007,"The Queen's Gambit",2020,"History",1,5),
 (2,008,"Dark",2017,"Thriller",1,3),
 (2,009,"Emily in Paris",2020,"Comedy/drama",1,3),
 (2,010,"Ozark",2017,"Drama",1,4),
 (2,011,"Lupin",2021,"Mystery",1,3),
 (2,012,"The falcon and the Winter Soldier",2021,"Action/feedback",1,2);

 select * from MOVIES_SHOWS;

  select movie_show_name from MOVIES_SHOWS where genre = "Romance/drama";

 select movie_show_name from MOVIES_SHOWS where movie_show_indicator = 1;
--
-- Indexes for table `room`
--

-- ALTER TABLE `room`
--   ADD PRIMARY KEY (`serial_id`);
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
-- ALTER TABLE `room`
--   MODIFY `serial_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

  --
ALTER TABLE `user_feedback`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  ALTER TABLE `contact_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

--
-- AUTO_INCREMENT for table `user_review`
--

ALTER TABLE user_review
  MODIFY id int NOT NULL AUTO_INCREMENT;


-- ----------- TRIAL --------------

-- select user_review.star,movies_shows.count from user_review , movies_shows where movies_shows.movie_show_id = user_review.id

-- update movies_shows,user_review set movies_shows.count = movies_shows.count+user_review.star where movies_shows.movie_show_id = user_review.id

-- update movies_shows,user_review set movies_shows.rating = movies_shows.rating+user_review.star where movies_shows.movie_show_name = user_review.movie_name;

-- select movie_show_name from movies_shows order by rating desc , year_release desc limit 5;
