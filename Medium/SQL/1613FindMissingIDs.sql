-- Table: Customers
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | customer_name | varchar |
-- +---------------+---------+
-- customer_id is the primary key for this table.
-- Each row of this table contains the name and the id customer.
 
-- Write an SQL query to find the missing customer IDs. The missing IDs are ones that are not in the Customers table but are in the range between 1 and the maximum customer_id present in the table.
-- Notice that the maximum customer_id will not exceed 100.
-- Return the result table ordered by ids in ascending order.
-- The query result format is in the following example.


-- Customer table:
-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 1           | Alice         |
-- | 4           | Bob           |
-- | 5           | Charlie       |
-- +-------------+---------------+

-- Result table:
-- +-----+
-- | ids |
-- +-----+
-- | 2   |
-- | 3   |
-- +-----+
-- The maximum customer_id present in the table is 5, so in the range [1,5], IDs 2 and 3 are missing from the table.

create table customers(customer_id int, customer_name char(15));

insert into customers values(1,'Alice'); 
insert into customers values(4,'Bob');    
insert into customers values(5,'Charlie');

WITH RECURSIVE cte AS (
  SELECT 1 AS ids 
  UNION
  SELECT ids+1 as ids
  FROM cte
  WHERE ids < (SELECT MAX(customer_id) FROM customers)
)
SELECT 
  ids 
FROM cte
WHERE ids NOT IN (SELECT customer_id FROM customers)







