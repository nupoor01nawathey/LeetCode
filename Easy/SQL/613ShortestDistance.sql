-- Table point holds the x coordinate of some points on x-axis in a plane, which are all integers.
 
-- Write a query to find the shortest distance between two points in these points.
 
-- | x   |
-- |-----|
-- | -1  |
-- | 0   |
-- | 2   |
 
-- The shortest distance is '1' obviously, which is from point '-1' to '0'. So the output is as below:
 
-- | shortest|
-- |---------|
-- | 1       |
 
-- Note: Every point is unique, which means there is no duplicates in table point

create table points(x int);

insert into points values(-1);
insert into points values(0);
insert into points values(2);

select * from points;

SELECT
  MIN(ABS(p1.x - p2.x)) shortest
FROM points p1 JOIN points p2
ON p1.x != p2.x;