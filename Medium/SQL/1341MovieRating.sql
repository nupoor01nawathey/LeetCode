-- Table: Movies
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | title         | varchar |
-- +---------------+---------+
-- movie_id is the primary key for this table.
-- title is the name of the movie.

-- Table: Users
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user_id       | int     |
-- | name          | varchar |
-- +---------------+---------+
-- user_id is the primary key for this table.

-- Table: Movie_Rating
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | movie_id      | int     |
-- | user_id       | int     |
-- | rating        | int     |
-- | created_at    | date    |
-- +---------------+---------+
-- (movie_id, user_id) is the primary key for this table.
-- This table contains the rating of a movie by a user in their review.
-- created_at is the user's review date.
 

-- Write the following SQL query:

-- Find the name of the user who has rated the greatest number of the movies.
-- In case of a tie, return lexicographically smaller user name.

-- Find the movie name with the highest average rating in February 2020.
-- In case of a tie, return lexicographically smaller movie name..

-- Query is returned in 2 rows, the query result format is in the folowing example:

-- Movies table:
-- +-------------+--------------+
-- | movie_id    |  title       |
-- +-------------+--------------+
-- | 1           | Avengers     |
-- | 2           | Frozen 2     |
-- | 3           | Joker        |
-- +-------------+--------------+

-- Users table:
-- +-------------+--------------+
-- | user_id     |  name        |
-- +-------------+--------------+
-- | 1           | Daniel       |
-- | 2           | Monica       |
-- | 3           | Maria        |
-- | 4           | James        |
-- +-------------+--------------+

-- Movie_Rating table:
-- +-------------+--------------+--------------+-------------+
-- | movie_id    | user_id      | rating       | created_at  |
-- +-------------+--------------+--------------+-------------+
-- | 1           | 1            | 3            | 2020-01-12  |
-- | 1           | 2            | 4            | 2020-02-11  |
-- | 1           | 3            | 2            | 2020-02-12  |
-- | 1           | 4            | 1            | 2020-01-01  |
-- | 2           | 1            | 5            | 2020-02-17  |
-- | 2           | 2            | 2            | 2020-02-01  |
-- | 2           | 3            | 2            | 2020-03-01  |
-- | 3           | 1            | 3            | 2020-02-22  |
-- | 3           | 2            | 4            | 2020-02-25  |
-- +-------------+--------------+--------------+-------------+

-- Result table:
-- +--------------+
-- | results      |
-- +--------------+
-- | Daniel       |
-- | Frozen 2     |
-- +--------------+

-- Daniel and Maria have rated 3 movies ("Avengers", "Frozen 2" and "Joker") 
-- but Daniel is smaller lexicographically.
-- Frozen 2 and Joker have a rating average of 3.5 in February but Frozen 2 is smaller lexicographically.

create table movies(movie_id int, title varchar(20));
create table users(user_id int, name varchar(10));
create table movie_rating(movie_id int,user_id int, rating int,created_at date);

insert into movies values(1,'Avengers');
insert into movies values(2,'Frozen 2');
insert into movies values(3,'Joker');

insert into users values(1,'Daniel');
insert into users values(2,'Monica');
insert into users values(3,'Maria');
insert into users values(4,'James');

insert into movie_rating values(1,1,3,'2020-01-12');
insert into movie_rating values(1,2,4,'2020-02-11');
insert into movie_rating values(1,3,2,'2020-02-12');
insert into movie_rating values(1,4,1,'2020-01-01');
insert into movie_rating values(2,1,5,'2020-02-17');
insert into movie_rating values(2,2,2,'2020-02-01');
insert into movie_rating values(2,3,2,'2020-03-01');
insert into movie_rating values(3,1,3,'2020-02-22');
insert into movie_rating values(3,2,4,'2020-02-25');

select * from movies;
select * from users;
select * from movie_rating;


WITH cte AS (
  SELECT
    mr.*,
    u.name,
    m.title
  
  FROM movie_rating mr
  LEFT JOIN users u
  ON mr.user_id=u.user_id 
  LEFT JOIN movies m
  ON mr.movie_id=m.movie_id 
)
(
  SELECT
    name AS results
  FROM cte
  GROUP BY name
  ORDER BY COUNT(*) DESC, name ASC
  LIMIT 1
)
UNION
(
  SELECT
      title AS results
  FROM cte
  WHERE DATE_FORMAT(created_at, '%Y-%m') = '2020-02'
  GROUP BY title
  ORDER BY AVG(rating) DESC, title ASC
  LIMIT 1
)


-- (
--     select name results
--     from Movie_Rating natural join Users
--     group by Users.user_id
--     order by count(*) desc, name asc
--     limit 1
-- )
-- union
-- (
--     select Movies.title results
--     from Movie_Rating natural join Movies
--     where month(created_at)='2'
--     group by Movies.movie_id
--     order by avg(rating
-- )desc, title asc
