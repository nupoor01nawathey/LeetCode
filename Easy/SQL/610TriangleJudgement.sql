-- A pupil Tim gets homework to identify whether three line segments could possibly form a triangle.
 
-- However, this assignment is very heavy because there are hundreds of records to calculate.

-- Could you help Tim by writing a query to judge whether these three sides can form a triangle, 
-- assuming table triangle holds the length of the three sides x, y and z.
 
-- | x  | y  | z  |
-- |----|----|----|
-- | 13 | 15 | 30 |
-- | 10 | 20 | 15 |
-- For the sample data above, your query should return the follow result:

-- | x  | y  | z  | triangle |
-- |----|----|----|----------|
-- | 13 | 15 | 30 | No       |
-- | 10 | 20 | 15 | Yes      |

create table triangle(x int,y int,z int);

insert into triangle values(13,15,30);
insert into triangle values(10,20,15);

select * from triangle;

SELECT
  *,
  CASE
    WHEN x+y > z OR y+z > x OR x+z > y THEN 'Yes'
    WHEN x=y OR y=z OR x=z THEN 'Yes' 
    ELSE 'No'
  END AS Triangle
FROM triangle;  
