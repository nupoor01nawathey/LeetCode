-- Mary is a teacher in a middle school and she has a table seat storing students' names and their corresponding seat ids.

-- The column id is continuous increment.
-- Mary wants to change seats for the adjacent students.
-- Can you write a SQL query to output the result for Mary?
-- Table Seat
-- +---------+---------+
-- |    id   | student |
-- +---------+---------+
-- |    1    | Abbot   |
-- |    2    | Doris   |
-- |    3    | Emerson |
-- |    4    | Green   |
-- |    5    | Jeames  |
-- +---------+---------+

-- For the sample input, the output is:
-- +---------+---------+
-- |    id   | student |
-- +---------+---------+
-- |    1    | Doris   |
-- |    2    | Abbot   |
-- |    3    | Green   |
-- |    4    | Emerson |
-- |    5    | Jeames  |
-- +---------+---------+
-- Note:
-- If the number of students is odd, there is no need to change the last one's seat.


create table seat(id int, student varchar(10));

insert into seat values(1,'Abbot'); 
insert into seat values(2,'Doris');  
insert into seat values(3,'Emerson');
insert into seat values(4,'Green');
insert into seat values(5,'Jeames');

select * from seat;

WITH cte AS (
  SELECT
    *,
    LEAD(id) OVER(ORDER BY id) next,
    LAG(id) OVER(ORDER BY id) prev
  FROM seat
)
SELECT
  CASE WHEN id%2 = 1 AND next IS NOT NULL THEN next
       WHEN id%2 = 0 THEN prev
       ELSE id
  END AS id,
  student
FROM cte
ORDER BY id ASC;





