-- Table: Customer
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | customer_id | int     |
-- | product_key | int     |
-- +-------------+---------+
-- product_key is a foreign key to Product table.

-- Table: Product
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_key | int     |
-- +-------------+---------+
-- product_key is the primary key column for this table.
-- Write an SQL query for a report that provides the customer ids from the Customer table that bought all the products in the Product table.

-- For example:
-- Customer table:
-- +-------------+-------------+
-- | customer_id | product_key |
-- +-------------+-------------+
-- | 1           | 5           |
-- | 2           | 6           |
-- | 3           | 5           |
-- | 3           | 6           |
-- | 1           | 6           |
-- +-------------+-------------+

-- Product table:
-- +-------------+
-- | product_key |
-- +-------------+
-- | 5           |
-- | 6           |
-- +-------------+

-- Result table:
-- +-------------+
-- | customer_id |
-- +-------------+
-- | 1           |
-- | 3           |
-- +-------------+
-- The customers who bought all the products (5 and 6) are customers with id 1 and 3.

create table customers(customer_id int, product_key int);
create table products(product_key int);

insert into customers values(1,5);
insert into customers values(2,6);
insert into customers values(3,5);
insert into customers values(3,6);
insert into customers values(1,6);

insert into products values(5);
insert into products values(6);

select * from customers;
select * from products;

-- Foreign key so count(distinct products) will match count(distinct customers)
SELECT
  customer_id
FROM customers
GROUP BY customer_id 
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM products);

