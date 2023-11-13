-- Table: Friends
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- | activity      | varchar |
-- +---------------+---------+
-- id is the id of the friend and primary key for this table.
-- name is the name of the friend.
-- activity is the name of the activity which the friend takes part in.

-- Table: Activities
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+
-- id is the primary key for this table.
-- name is the name of the activity.
 

-- Write an SQL query to find the names of all the activities with neither maximum, 
-- nor minimum number of participants.

-- Return the result table in any order. 
-- Each activity in table Activities is performed by any person in the table Friends.

-- The query result format is in the following example:

-- Friends table:
-- +------+--------------+---------------+
-- | id   | name         | activity      |
-- +------+--------------+---------------+
-- | 1    | Jonathan D.  | Eating        |
-- | 2    | Jade W.      | Singing       |
-- | 3    | Victor J.    | Singing       |
-- | 4    | Elvis Q.     | Eating        |
-- | 5    | Daniel A.    | Eating        |
-- | 6    | Bob B.       | Horse Riding  |
-- +------+--------------+---------------+

-- Activities table:
-- +------+--------------+
-- | id   | name         |
-- +------+--------------+
-- | 1    | Eating       |
-- | 2    | Singing      |
-- | 3    | Horse Riding |
-- +------+--------------+

-- Result table:
-- +--------------+
-- | results      |
-- +--------------+
-- | Singing      |
-- +--------------+

-- Eating activity is performed by 3 friends, maximum number of participants, (Jonathan D. , Elvis Q. and Daniel A.)
-- Horse Riding activity is performed by 1 friend, minimum number of participants, (Bob B.)
-- Singing is performed by 2 friends (Victor J. and Jade W.)

create table friends(id int, name varchar(15), activity char(15));
create table activities(id int, name varchar(15));

insert into friends values(1,'Jonathan D.','Eating');    
insert into friends values(2,'Jade W.','Singing');    
insert into friends values(3,'Victor J.','Singing');    
insert into friends values(4,'Elvis Q.','Eating');    
insert into friends values(5,'Daniel A.','Eating');    
insert into friends values(6,'Bob B.','Horse Riding');

insert into activities values(1,'Eating');    
insert into activities values(2,'Singing');   
insert into activities values(3,'Horse Riding');

select * from friends;
select * from activities;

WITH cte AS(
  SELECT 
    activity,
    COUNT(id) cnt
  FROM friends
  GROUP BY activity
),
-- there could be more activities in the activity table so join is required
cte2 AS (
  SELECT 
    a.name,
    CASE WHEN c.cnt IS NOT NULL THEN c.cnt ELSE 0 END AS num_of_partcipants
  FROM activities a LEFT JOIN cte c
  ON a.name=c.activity
)
SELECT
  name results
FROM cte2
WHERE num_of_partcipants <> (SELECT MAX(num_of_partcipants) FROM cte2)
AND num_of_partcipants <> (SELECT MIN(num_of_partcipants) FROM cte2)
;