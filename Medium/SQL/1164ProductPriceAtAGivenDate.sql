-- Table: Products
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | product_id    | int     |
-- | new_price     | int     |
-- | change_date   | date    |
-- +---------------+---------+
-- (product_id, change_date) is the primary key of this table.
-- Each row of this table indicates that the price of some product was changed to a new price at some date.
-- Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

-- The query result format is in the following example:

-- Products table:
-- +------------+-----------+-------------+
-- | product_id | new_price | change_date |
-- +------------+-----------+-------------+
-- | 1          | 20        | 2019-08-14  |
-- | 2          | 50        | 2019-08-14  |
-- | 1          | 30        | 2019-08-15  |
-- | 1          | 35        | 2019-08-16  |
-- | 2          | 65        | 2019-08-17  |
-- | 3          | 20        | 2019-08-18  |
-- +------------+-----------+-------------+

-- Result table:
-- +------------+-------+
-- | product_id | price |
-- +------------+-------+
-- | 2          | 50    |
-- | 1          | 35    |
-- | 3          | 10    |
-- +------------+-------+

create table products(id int, new_price int, change_date date);

insert into products values(1,20,'2019-08-14');
insert into products values(2,50,'2019-08-14');
insert into products values(1,30,'2019-08-15');
insert into products values(1,35,'2019-08-16');
insert into products values(2,65,'2019-08-17');
insert into products values(3,20,'2019-08-18');

select * from products;

WITH cte as(
  SELECT
    *,
    RANK() OVER(PARTITION BY id ORDER BY change_date DESC) rnk
  FROM products
  WHERE change_date <= '2019-08-16'
)
SELECT
  id, 
  new_price AS price
FROM cte
WHERE rnk=1
UNION
SELECT 
  id,
  10 AS price
FROM products
WHERE id NOT IN (SELECT id FROM cte);

