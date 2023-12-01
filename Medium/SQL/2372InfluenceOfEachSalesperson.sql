-- Table: Salesperson
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | salesperson_id | int     |
-- | name           | varchar |
-- +----------------+---------+
-- salesperson_id is the primary key for this table.
-- Each row in this table shows the ID of a salesperson.
 

-- Table: Customer
-- +----------------+------+
-- | Column Name    | Type |
-- +----------------+------+
-- | customer_id    | int  |
-- | salesperson_id | int  |
-- +----------------+------+
-- customer_id is the primary key for this table.
-- salesperson_id is a foreign key from the Salesperson table.
-- Each row in this table shows the ID of a customer and the ID of the salesperson. 
 

-- Table: Sales
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | sale_id     | int  |
-- | customer_id | int  |
-- | price       | int  |
-- +-------------+------+
-- sale_id is the primary key for this table.
-- customer_id is a foreign key from the Customer table.
-- Each row in this table shows ID of a customer and the price they paid for the sale with sale_id.
 

-- Write an SQL query to report the sum of prices paid by the customers of each salesperson. If a salesperson does not have any customers, the total value should be 0.

-- Return the result table in any order.

-- The query result format is shown in the following example.

 

-- Example 1:

-- Input: 
-- Salesperson table:
-- +----------------+-------+
-- | salesperson_id | name  |
-- +----------------+-------+
-- | 1              | Alice |
-- | 2              | Bob   |
-- | 3              | Jerry |
-- +----------------+-------+
-- Customer table:
-- +-------------+----------------+
-- | customer_id | salesperson_id |
-- +-------------+----------------+
-- | 1           | 1              |
-- | 2           | 1              |
-- | 3           | 2              |
-- +-------------+----------------+
-- Sales table:
-- +---------+-------------+-------+
-- | sale_id | customer_id | price |
-- +---------+-------------+-------+
-- | 1       | 2           | 892   |
-- | 2       | 1           | 354   |
-- | 3       | 3           | 988   |
-- | 4       | 3           | 856   |
-- +---------+-------------+-------+
-- Output: 
-- +----------------+-------+-------+
-- | salesperson_id | name  | total |
-- +----------------+-------+-------+
-- | 1              | Alice | 1246  |
-- | 2              | Bob   | 1844  |
-- | 3              | Jerry | 0     |
-- +----------------+-------+-------+
-- Explanation: 
-- Alice is the salesperson for customers 1 and 2.
--   - Customer 1 made one purchase with 354.
--   - Customer 2 made one purchase with 892.
-- The total for Alice is 354 + 892 = 1246.

-- Bob is the salesperson for customers 3.
--   - Customer 1 made one purchase with 988 and 856.
-- The total for Bob is 988 + 856 = 1844.

-- Jerry is not the salesperson of any customer.
-- The total for Jerry is 0.

create table salesperson(salesperson_id int,name varchar(10));
create table customers(customer_id int,salesperson_id int);
create table sales(sale_id int,customer_id int,price int);

insert into salesperson values(1,'Alice');
insert into salesperson values(2,'Bob');  
insert into salesperson values(3,'Jerry');

insert into customers values(1,1);
insert into customers values(2,1);
insert into customers values(3,2);

insert into sales values(1,2,892);
insert into sales values(2,1,354);
insert into sales values(3,3,988);
insert into sales values(4,3,856);

select * from salesperson;
select * from customers;
select * from sales;


SELECT 
  s.salesperson_id, 
  s.name,
  IFNULL(SUM(sa.price), 0) total
FROM salesperson s
LEFT JOIN customers c
ON s.salesperson_id=c.salesperson_id
LEFT JOIN sales sa
ON c.customer_id=sa.customer_id
GROUP BY s.salesperson_id, s.name
;










