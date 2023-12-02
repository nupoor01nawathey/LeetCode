-- Table: Data

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | first_col   | int  |
-- | second_col  | int  |
-- +-------------+------+
-- There is no primary key for this table and it may contain duplicates.
 

-- Write an SQL query to independently:

-- order first_col in ascending order.
-- order second_col in descending order.
-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Data table:
-- +-----------+------------+
-- | first_col | second_col |
-- +-----------+------------+
-- | 4         | 2          |
-- | 2         | 3          |
-- | 3         | 1          |
-- | 1         | 4          |
-- +-----------+------------+
-- Output: 
-- +-----------+------------+
-- | first_col | second_col |
-- +-----------+------------+
-- | 1         | 4          |
-- | 2         | 3          |
-- | 3         | 2          |
-- | 4         | 1          |
-- +-----------+------------+

create table data(first_col int, second_col int);

insert into data values(4,2);
insert into data values(2,3);
insert into data values(3,1);
insert into data values(1,4);

select * from data;


WITH cte1 AS
(
  SELECT 
    first_col,
    ROW_NUMBER() OVER(ORDER BY first_col ASC) rn_1
  FROM data
)
,cte2 AS
(
  SELECT 
    second_col,
    ROW_NUMBER() OVER(ORDER BY second_col DESC) rn_2
  FROM data
)
SELECT rn_1 first_col, rn_2 second_col FROM cte1 JOIN cte2 ON first_col=second_col;
-- +-----------+-----
-- | first_col | rn_1
-- +-----------+-----
-- | 4         | 4
-- | 2         | 2
-- | 3         | 3
-- | 1         | 1
-- +-----------+-----

-- +-----------+------------+
-- | second_col | rn_2  
-- +------------+-------
-- | 2          | 2      
-- | 3          | 3      
-- | 1          | 4      
-- | 4          | 1      




