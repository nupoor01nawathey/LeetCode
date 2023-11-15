-- Table: Customers
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | customer_id   | int     |
-- | name          | varchar |
-- +---------------+---------+
-- customer_id is the primary key for this table.
-- This table contains information about customers.
 
-- Table: Orders
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | order_date    | date    |
-- | customer_id   | int     |
-- | cost          | int     |
-- +---------------+---------+
-- order_id is the primary key for this table.
-- This table contains information about the orders made customer_id.
-- Each customer has one order per day.

-- Write an SQL query to find the most recent 3 orders of each user. 
-- If a user ordered less than 3 orders return all of their orders.

-- Return the result table sorted by customer_name in ascending order and in case of 
-- a tie by the customer_id in ascending order. If there still a tie, order them by 
-- the order_date in descending order.

-- The query result format is in the following example:

-- Customers
-- +-------------+-----------+
-- | customer_id | name      |
-- +-------------+-----------+
-- | 1           | Winston   |
-- | 2           | Jonathan  |
-- | 3           | Annabelle |
-- | 4           | Marwan    |
-- | 5           | Khaled    |
-- +-------------+-----------+

-- Orders
-- +----------+------------+-------------+------+
-- | order_id | order_date | customer_id | cost |
-- +----------+------------+-------------+------+
-- | 1        | 2020-07-31 | 1           | 30   |
-- | 2        | 2020-07-30 | 2           | 40   |
-- | 3        | 2020-07-31 | 3           | 70   |
-- | 4        | 2020-07-29 | 4           | 100  |
-- | 5        | 2020-06-10 | 1           | 1010 |
-- | 6        | 2020-08-01 | 2           | 102  |
-- | 7        | 2020-08-01 | 3           | 111  |
-- | 8        | 2020-08-03 | 1           | 99   |
-- | 9        | 2020-08-07 | 2           | 32   |
-- | 10       | 2020-07-15 | 1           | 2    |
-- +----------+------------+-------------+------+

-- Result table:
-- +---------------+-------------+----------+------------+
-- | customer_name | customer_id | order_id | order_date |
-- +---------------+-------------+----------+------------+
-- | Annabelle     | 3           | 7        | 2020-08-01 |
-- | Annabelle     | 3           | 3        | 2020-07-31 |
-- | Jonathan      | 2           | 9        | 2020-08-07 |
-- | Jonathan      | 2           | 6        | 2020-08-01 |
-- | Jonathan      | 2           | 2        | 2020-07-30 |
-- | Marwan        | 4           | 4        | 2020-07-29 |
-- | Winston       | 1           | 8        | 2020-08-03 |
-- | Winston       | 1           | 1        | 2020-07-31 |
-- | Winston       | 1           | 10       | 2020-07-15 |
-- +---------------+-------------+----------+------------+
-- Winston has 4 orders, we discard the order of "2020-06-10" because it is the oldest order.
-- Annabelle has only 2 orders, we return them.
-- Jonathan has exactly 3 orders.
-- Marwan ordered only one time.
-- We sort the result table by customer_name in ascending order, by customer_id in ascending order and by order_date in descending order in case of a tie.

create table customers(customer_id int,name varchar(20));
create table orders(order_id int,order_date date,customer_id int,cost int);

insert into customers values(1,'Winston');
insert into customers values(2,'Jonathan');
insert into customers values(3,'Annabelle');
insert into customers values(4,'Marwan');
insert into customers values(5,'Khaled');

insert into orders values(1,'2020-07-31',1,30);   
insert into orders values(2,'2020-07-30',2,40);   
insert into orders values(3,'2020-07-31',3,70);   
insert into orders values(4,'2020-07-29',4,100); 
insert into orders values(5,'2020-06-10',1,1010);
insert into orders values(6,'2020-08-01',2,102);  
insert into orders values(7,'2020-08-01',3,111);
insert into orders values(8,'2020-08-03',1,99);   
insert into orders values(9,'2020-08-07',2,32);   
insert into orders values(10,'2020-07-15',1,2);    

select * from customers;
select * from orders;

WITH cte AS (
  SELECT
    c.name AS customer_name,
    o.customer_id,
    o.order_id,
    o.order_date,
    RANK() OVER(PARTITION BY o.customer_id ORDER BY o.order_date DESC) rnk
  FROM Orders o
  JOIN customers c
  ON o.customer_id=c.customer_id 
)
SELECT customer_name,customer_id,order_id,order_date
FROM cte
WHERE rnk <=3 
ORDER BY customer_name, customer_id, order_date DESC;




