-- Table: Users

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+
-- id is the primary key for this table.
-- name is the name of the user.
 

-- Table: Rides

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | user_id       | int     |
-- | distance      | int     |
-- +---------------+---------+
-- id is the primary key for this table.
-- user_id is the id of the user who travelled the distance "distance".
 
-- Write an SQL query to report the distance travelled by each user.

-- Return the result table ordered by travelled_distance in descending order, 
-- if two or more users travelled the same distance, 
-- order them by their name in ascending order.

-- The query result format is in the following example.

-- Users table:
-- +------+-----------+
-- | id   | name      |
-- +------+-----------+
-- | 1    | Alice     |
-- | 2    | Bob       |
-- | 3    | Alex      |
-- | 4    | Donald    |
-- | 7    | Lee       |
-- | 13   | Jonathan  |
-- | 19   | Elvis     |
-- +------+-----------+

-- Rides table:
-- +------+----------+----------+
-- | id   | user_id  | distance |
-- +------+----------+----------+
-- | 1    | 1        | 120      |
-- | 2    | 2        | 317      |
-- | 3    | 3        | 222      |
-- | 4    | 7        | 100      |
-- | 5    | 13       | 312      |
-- | 6    | 19       | 50       |
-- | 7    | 7        | 120      |
-- | 8    | 19       | 400      |
-- | 9    | 7        | 230      |
-- +------+----------+----------+

-- Result table:
-- +----------+--------------------+
-- | name     | travelled_distance |
-- +----------+--------------------+
-- | Elvis    | 450                |
-- | Lee      | 450                |
-- | Bob      | 317                |
-- | Jonathan | 312                |
-- | Alex     | 222                |
-- | Alice    | 120                |
-- | Donald   | 0                  |
-- +----------+--------------------+
-- Elvis and Lee travelled 450 miles, Elvis is the top traveller as his name is alphabetically smaller than Lee.
-- Bob, Jonathan, Alex and Alice have only one ride and we just order them by the total distances of the ride.
-- Donald didn't have any rides, the distance travelled by him is 0.

create table users(id int,name text);
create table rides(id int,user_id int,distance int);

insert into users values(1,'Alice');   
insert into users values(2,'Bob');    
insert into users values(3,'Alex'); 
insert into users values(4,'Donald');  
insert into users values(7,'Lee');
insert into users values(13,'Jonathan'); 
insert into users values(19,'Elvis');

insert into rides values(1,1,120);
insert into rides values(2,2,317);
insert into rides values(3,3,222);
insert into rides values(4,7,100);
insert into rides values(5,13,312);
insert into rides values(6,19,50);
insert into rides values(7,7,120);
insert into rides values(8,19,400);
insert into rides values(9,7,230);

select * from users;
select * from rides;

SELECT
  u.name,
  COALESCE(SUM(r.distance), 0) travelled_distance
FROM users u LEFT JOIN rides r
ON u.id=r.user_id
GROUP BY u.name
ORDER BY travelled_distance DESC, name;

