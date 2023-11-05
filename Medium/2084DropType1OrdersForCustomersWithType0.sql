-- Table: Orders

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | order_id    | int  | 
-- | customer_id | int  |
-- | order_type  | int  | 
-- +-------------+------+
-- order_id is the primary key column for this table.
-- Each row of this table indicates the ID of an order, the ID of the customer who ordered it, and the order type.
-- The orders could be of type 0 or type 1.

-- Write an SQL query to report all the orders based on the following criteria:

-- If a customer has at least one order of type 0, 
-- do not report any order of type 1 from that customer.
-- Otherwise, report all the orders of the customer.
-- Return the result table in any order.

-- The query result format is in the following example.


-- Example 1:

-- Input:
-- Orders table:
-- +----------+-------------+------------+
-- | order_id | customer_id | order_type |
-- +----------+-------------+------------+
-- | 1        | 1           | 0          |
-- | 2        | 1           | 0          |
-- | 11       | 2           | 0          |
-- | 12       | 2           | 1          |
-- | 21       | 3           | 1          |
-- | 22       | 3           | 0          |
-- | 31       | 4           | 1          |
-- | 32       | 4           | 1          |
-- +----------+-------------+------------+
-- Output:
-- +----------+-------------+------------+
-- | order_id | customer_id | order_type |
-- +----------+-------------+------------+
-- | 31       | 4           | 1          |
-- | 32       | 4           | 1          |
-- | 1        | 1           | 0          |
-- | 2        | 1           | 0          |
-- | 11       | 2           | 0          |
-- | 22       | 3           | 0          |
-- +----------+-------------+------------+
-- Explanation:
-- Customer 1 has two orders of type 0. We return both of them.
-- Customer 2 has one order of type 0 and one order of type 1. We only return the order of type 0.
-- Customer 3 has one order of type 0 and one order of type 1. We only return the order of type 0.
-- Customer 4 has two orders of type 1. We return both of them.

create table orders(order_id int, customer_id int, order_type int);

insert into orders values(1,1,0);
insert into orders values(2,1,0);
insert into orders values(11,2,0);
insert into orders values(12,2,1);
insert into orders values(21,3,1);
insert into orders values(22,3,0);
insert into orders values(31,4,1);
insert into orders values(32,4,1);

select * from orders;

WITH cte AS(
SELECT 
  *, 
  MIN(order_type) OVER( partition by customer_id) min_order_type
FROM orders
)
-- SELECT * from cte;
-- +----------+-------------+------------+--------------+
-- | order_id | customer_id | order_type |min_order_type|
-- +----------+-------------+------------+--------------+
-- | 1        | 1           | 0          |0
-- | 2        | 1           | 0          |0

-- | 11       | 2           | 0          |0
-- | 12       | 2           | 1          |0   -> will get dropped as order_type+min_order_type=1

-- | 21       | 3           | 1          |0   -> will get dropped as order_type+min_order_type=1
-- | 22       | 3           | 0          |0

-- | 31       | 4           | 1          |1
-- | 32       | 4           | 1          |1
-- +----------+-------------+------------+
SELECT 
  order_id,
  customer_id,
  order_type
FROM cte
WHERE order_type+min_order_type <> 1;






