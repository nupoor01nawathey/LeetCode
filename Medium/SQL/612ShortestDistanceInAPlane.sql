-- Write a query to find the shortest distance between these points rounded to 2 decimals.

-- | x  | y  |
-- |----|----|
-- | -1 | -1 |
-- | 0  | 0  |
-- | -1 | -2 |
 

-- The shortest distance is 1.00 from point (-1,-1) to (-1,2). So the output should be:

-- | shortest |
-- |----------|
-- | 1.00     |
 
-- The distance between 2 points p1(x1,y1), p2(x2,y2) is sqrt((x2-x1)2 + (y2-y1)2)
-- Note: The longest distance among all the points are less than 10000.

create table point2d(x int, y int);

insert into point2d values(-1,-1);
insert into point2d values(0,0);
insert into point2d values(-1,-2);

select * from point2d;


WITH cte AS (
  SELECT
    x,
    y,
    ROW_NUMBER() OVER() rn
  FROM point2d
)
SELECT
  ROUND(MIN(SQRT(POW((c1.x-c2.x),2) + POW((c1.y-c2.y),2))),2) shortest
FROM cte c1
INNER JOIN cte c2
ON c1.rn < c2.rn





