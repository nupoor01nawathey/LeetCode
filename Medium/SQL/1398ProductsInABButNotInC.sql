-- Table: Customers

-- +---------------------+---------+
-- | Column Name         | Type    |
-- +---------------------+---------+
-- | customer_id         | int     |
-- | customer_name       | varchar |
-- +---------------------+---------+
-- customer_id is the primary key for this table.
-- customer_name is the name of the customer.

-- Table: Orders

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | order_id      | int     |
-- | customer_id   | int     |
-- | product_name  | varchar |
-- +---------------+---------+
-- order_id is the primary key for this table.
-- customer_id is the id of the customer who bought the product "product_name".

-- Write an SQL query to report the customer_id and customer_name of customers 
-- who bought products "A", "B" but did not buy the product "C" 
-- since we want to recommend them buy this product.

-- Return the result table ordered by customer_id.
-- The query result format is in the following example.

-- Customers table:
-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 1           | Daniel        |
-- | 2           | Diana         |
-- | 3           | Elizabeth     |
-- | 4           | Jhon          |
-- +-------------+---------------+

-- Orders table:
-- +------------+--------------+---------------+
-- | order_id   | customer_id  | product_name  |
-- +------------+--------------+---------------+
-- | 10         |     1        |     A         |
-- | 20         |     1        |     B         |
-- | 30         |     1        |     D         |
-- | 40         |     1        |     C         |
-- | 50         |     2        |     A         |
-- | 60         |     3        |     A         |
-- | 70         |     3        |     B         |
-- | 80         |     3        |     D         |
-- | 90         |     4        |     C         |
-- +------------+--------------+---------------+

-- Result table:
-- +-------------+---------------+
-- | customer_id | customer_name |
-- +-------------+---------------+
-- | 3           | Elizabeth     |
-- +-------------+---------------+
-- Only the customer_id with id 3 bought the product A and B but not the product C.


create table customers(customer_id int, customer_name varchar(20));
create table orders(order_id int, customer_id int, product_name varchar(20));

insert into customers values(1,'Daniel');   
insert into customers values(2,'Diana');
insert into customers values(3,'Elizabeth');
insert into customers values(4,'Jhon');     

insert into orders values(10,1,'A'); 
insert into orders values(20,1,'B'); 
insert into orders values(30,1,'D'); 
insert into orders values(40,1,'C'); 
insert into orders values(50,2,'A'); 
insert into orders values(60,3,'A'); 
insert into orders values(70,3,'B'); 
insert into orders values(80,3,'D'); 
insert into orders values(90,4,'C'); 

select * from customers;
select * from orders;


WITH cte as (
  SELECT 
    customer_id
  FROM orders
  GROUP BY customer_id
  HAVING SUM(product_name='A')>0 
  AND SUM(product_name='B')>0
  AND SUM(product_name='C')=0
)
SELECT * FROM customers
WHERE customer_id IN(SELECT customer_id FROM cte) ;






