create database fika;
use fika;

create table MOVIES_SHOWS(
slno int not null auto_increment,
 movie_show_indicator int, 
 movie_show_id int,
 movie_show_name varchar(50),
 year_release year,
 genre varchar(30),
 count int,primary key(slno));

 
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