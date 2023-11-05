-- Table: Sales

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | sale_date     | date    |
-- | fruit         | enum    | 
-- | sold_num      | int     | 
-- +---------------+---------+
-- (sale_date,fruit) is the primary key for this table.
-- This table contains the sales of "apples" and "oranges" sold each day.
 

-- Write an SQL query to report the difference between number of apples and oranges sold each day.

-- Return the result table ordered by sale_date in format ('YYYY-MM-DD').

-- The query result format is in the following example:

 

-- Sales table:
-- +------------+------------+-------------+
-- | sale_date  | fruit      | sold_num    |
-- +------------+------------+-------------+
-- | 2020-05-01 | apples     | 10          |
-- | 2020-05-01 | oranges    | 8           |
-- | 2020-05-02 | apples     | 15          |
-- | 2020-05-02 | oranges    | 15          |
-- | 2020-05-03 | apples     | 20          |
-- | 2020-05-03 | oranges    | 0           |
-- | 2020-05-04 | apples     | 15          |
-- | 2020-05-04 | oranges    | 16          |
-- +------------+------------+-------------+

-- Result table:
-- +------------+--------------+
-- | sale_date  | diff         |
-- +------------+--------------+
-- | 2020-05-01 | 2            |
-- | 2020-05-02 | 0            |
-- | 2020-05-03 | 20           |
-- | 2020-05-04 | -1           |
-- +------------+--------------+

-- Day 2020-05-01, 10 apples and 8 oranges were sold (Difference  10 - 8 = 2).
-- Day 2020-05-02, 15 apples and 15 oranges were sold (Difference 15 - 15 = 0).
-- Day 2020-05-03, 20 apples and 0 oranges were sold (Difference 20 - 0 = 20).
-- Day 2020-05-04, 15 apples and 16 oranges were sold (Difference 15 - 16 = -1).

create table Sales(sale_date date, fruit char(10), sold_num int);

insert into Sales values('2020-05-01', 'apples', 10);
insert into Sales values('2020-05-01', 'oranges', 8);
insert into Sales values('2020-05-02', 'apples', 15);
insert into Sales values('2020-05-02', 'oranges', 15);
insert into Sales values('2020-05-03', 'apples', 20);
insert into Sales values('2020-05-03', 'oranges', 0);
insert into Sales values('2020-05-04', 'apples', 15);
insert into Sales values('2020-05-04', 'oranges', 16);

select * from Sales;


-- Here sample data is already sorted but that may not be the case with other 
-- rows, so to consider edge case scenarios sort the data first
WITH sorted_dates AS (
  SELECT * FROM Sales
  ORDER BY sale_date, fruit
)
-- CAN BE SOLVED USING LEAD(fruit,1) OVER(partition by sales_date)
-- BUT solve using JOIN....
SELECT 
  s1.sale_date,
  s1.sold_num - s2.sold_num diff
FROM sorted_dates s1 LEFT JOIN sorted_dates s2
ON s1.sale_date=s2.sale_date
WHERE s1.fruit='apples' 
AND s2.fruit='oranges';







