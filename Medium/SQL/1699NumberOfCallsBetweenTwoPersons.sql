-- Table: Calls

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | from_id     | int     |
-- | to_id       | int     |
-- | duration    | int     |
-- +-------------+---------+
-- This table does not have a primary key, it may contain duplicates.
-- This table contains the duration of a phone call between from_id and to_id.
-- from_id != to_id

-- Write an SQL query to report the number of calls and the total call duration 
-- between each pair of distinct persons (person1, person2) where person1 < person2.

-- Return the result table in any order.

-- The query result format is in the following example:

-- Calls table:
-- +---------+-------+----------+
-- | from_id | to_id | duration |
-- +---------+-------+----------+
-- | 1       | 2     | 59       |
-- | 2       | 1     | 11       |
-- | 1       | 3     | 20       |
-- | 3       | 4     | 100      |
-- | 3       | 4     | 200      |
-- | 3       | 4     | 200      |
-- | 4       | 3     | 499      |
-- +---------+-------+----------+

-- Result table:
-- +---------+---------+------------+----------------+
-- | person1 | person2 | call_count | total_duration |
-- +---------+---------+------------+----------------+
-- | 1       | 2       | 2          | 70             |
-- | 1       | 3       | 1          | 20             |
-- | 3       | 4       | 4          | 999            |
-- +---------+---------+------------+----------------+
-- Users 1 and 2 had 2 calls and the total duration is 70 (59 + 11).
-- Users 1 and 3 had 1 call and the total duration is 20.
-- Users 3 and 4 had 4 calls and the total duration is 999 (100 + 200 + 200 + 499).

create table calls(from_id int, to_id int, duration int);

insert into calls values(1,2,59); 
insert into calls values(2,1,11); 
insert into calls values(1,3,20); 
insert into calls values(3,4,100); 
insert into calls values(3,4,200); 
insert into calls values(3,4,200); 
insert into calls values(4,3,499); 

select * from calls;

WITH cte as (
  SELECT
  CASE
    WHEN from_id < to_id THEN from_id
    ELSE to_id
  END AS person1,
  CASE
    WHEN from_id < to_id THEN to_id
    ELSE from_id
  END AS person2,
  duration
  FROM calls
)
SELECT 
  person1,
  person2,
  COUNT(1) call_count,
  SUM(duration) total_duration
FROM cte total_duration
GROUP BY 1,2 ;







