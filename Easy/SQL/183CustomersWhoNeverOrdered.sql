-- Suppose that a website contains two tables, 
-- the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

-- Table: Customers.

-- +----+-------+
-- | Id | Name  |
-- +----+-------+
-- | 1  | Joe   |
-- | 2  | Henry |
-- | 3  | Sam   |
-- | 4  | Max   |
-- +----+-------+
-- Table: Orders.

-- +----+------------+
-- | Id | CustomerId |
-- +----+------------+
-- | 1  | 3          |
-- | 2  | 1          |
-- +----+------------+
-- Using the above tables as example, return the following:

-- +-----------+
-- | Customers |
-- +-----------+
-- | Henry     |
-- | Max       |
-- +-----------+


create table customers(id int, name text);
create table orders(id int, customerId int);

insert into customers values(1, 'Joe');
insert into customers values(2, 'Henry');
insert into customers values(3, 'Sam');
insert into customers values(4, 'Max');

insert into orders values(1, 3);
insert into orders values(2, 1);

select * from customers;
select * from orders;


SELECT 
  c.NAME AS Customers
FROM customers c 
LEFT JOIN orders o
ON c.id=o.customerId 
WHERE o.id is null; 






