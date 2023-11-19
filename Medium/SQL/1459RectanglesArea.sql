-- Table: Points

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | x_value       | int     |
-- | y_value       | int     |
-- +---------------+---------+
-- id is the primary key for this table.
-- Each point is represented as a 2D Dimensional (x_value, y_value).
-- Write an SQL query to report of all possible rectangles which can be formed by any two points of the table. 

-- Each row in the result contains three columns (p1, p2, area) where:

-- p1 and p2 are the id of two opposite corners of a rectangle and p1 < p2.
-- Area of this rectangle is represented by the column area.
-- Report the query in descending order by area in case of tie in ascending order by p1 and p2.

-- Points table:
-- +----------+-------------+-------------+
-- | id       | x_value     | y_value     |
-- +----------+-------------+-------------+
-- | 1        | 2           | 8           |
-- | 2        | 4           | 7           |
-- | 3        | 2           | 10          |
-- +----------+-------------+-------------+

-- Result table:
-- +----------+-------------+-------------+
-- | p1       | p2          | area        |
-- +----------+-------------+-------------+
-- | 2        | 3           | 6           |
-- | 1        | 2           | 2           |
-- +----------+-------------+-------------+

-- p1 should be less than p2 and area greater than 0.
-- p1 = 1 and p2 = 2, has an area equal to |2-4| * |8-7| = 2.
-- p1 = 2 and p2 = 3, has an area equal to |4-2| * |7-10| = 2.
-- p1 = 1 and p2 = 3 It's not possible because has an area equal to 0.

create table points(id int,x_value int,y_value int);

insert into points values(1,2,8); 
insert into points values(2,4,7); 
insert into points values(3,2,10); 

select * from points;

WITH cte AS (
  SELECT
    p1.id AS p1,
    p2.id AS p2,
    ABS(p1.x_value-p2.x_value) * ABS(p1.y_value-p2.y_value) AS area
  -- p1.*,p2.*
  FROM points p1 
  CROSS JOIN points p2
)
SELECT * FROM cte
WHERE area != 0 AND p1 < p2
ORDER BY area DESC, p1, p2
;







