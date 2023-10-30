-- Description

-- Given three tables: salesperson, company, orders.
-- Output all the names in the table salesperson, who didn’t have sales to company 'RED'.

-- Example
-- Input

-- Table: salesperson
-- +----------+------+--------+-----------------+-----------+
-- | sales_id | name | salary | commission_rate | hire_date |
-- +----------+------+--------+-----------------+-----------+
-- |   1      | John | 100000 |     6           | 4/1/2006  |
-- |   2      | Amy  | 120000 |     5           | 5/1/2010  |
-- |   3      | Mark | 65000  |     12          | 12/25/2008|
-- |   4      | Pam  | 25000  |     25          | 1/1/2005  |
-- |   5      | Alex | 50000  |     10          | 2/3/2007  |
-- +----------+------+--------+-----------------+-----------+
-- The table salesperson holds the salesperson information.Every salesperson has a sales_id and a name.

-- Table: company
-- +---------+--------+------------+
-- | com_id  |  name  |    city    |
-- +---------+--------+------------+
-- |   1     |  RED   |   Boston   |
-- |   2     | ORANGE |   New York |
-- |   3     | YELLOW |   Boston   |
-- |   4     | GREEN  |   Austin   |
-- +---------+--------+------------+
-- The table company holds the company information. Every company has a com_id and a name.

-- Table: orders
-- +----------+------------+---------+----------+--------+
-- | order_id | order_date | com_id  | sales_id | amount |
-- +----------+------------+---------+----------+--------+
-- | 1        |   1/1/2014 |    3    |    4     | 100000 |
-- | 2        |   2/1/2014 |    4    |    5     | 5000   |
-- | 3        |   3/1/2014 |    1    |    1     | 50000  |
-- | 4        |   4/1/2014 |    1    |    4     | 25000  |
-- +----------+----------+---------+----------+--------+
-- The table orders holds the sales record information, salesperson and customer company are represented by sales_id and com_id.
-- output

-- +------+
-- | name | 
-- +------+
-- | Amy  | 
-- | Mark | 
-- | Alex |
-- +------+

-- Explanation
-- According to order '3' and '4' in table orders, it is easy to tell only salesperson 'John' and 'Pam' have sales to company 'RED',
-- so we need to output all the other names in the table salesperson.


create table salesperson(sales_id int,name text,salary int,commission_rate int,hire_date date);
create table company(com_id int,name text,city text);
create table orders(order_id int,order_date date,com_id int,sales_id int,amount int);

insert into salesperson values(1,'John',100000,6,STR_TO_DATE('04/01/2006',"%m/%d/%Y")); 
insert into salesperson values(2,'Amy',120000,5,STR_TO_DATE('05/01/2010',"%m/%d/%Y"));
insert into salesperson values(3,'Mark',65000,12,STR_TO_DATE('12/25/2008',"%m/%d/%Y"));
insert into salesperson values(4,'Pam',25000,25,STR_TO_DATE('01/01/2005',"%m/%d/%Y"));
insert into salesperson values(5,'Alex',50000,10,STR_TO_DATE('02/03/2007',"%m/%d/%Y"));  

insert into company values(1,'RED','Boston');  
insert into company values(2,'ORANGE','New York');
insert into company values(3,'YELLOW','Boston');
insert into company values(4,'GREEN','Austin');

insert into orders values(1,STR_TO_DATE('01/01/2014','%m/%d/%Y'),3,4,100000);
insert into orders values(2,STR_TO_DATE('02/01/2014','%m/%d/%Y'),4,5,5000);
insert into orders values(3,STR_TO_DATE('03/01/2014','%m/%d/%Y'),1,1,50000);
insert into orders values(4,STR_TO_DATE('04/01/2014','%m/%d/%Y'),1,4,25000);

select * from salesperson;
select * from company;
select * from orders;

SELECT 
  s.name 
FROM salesperson s 
WHERE s.sales_id NOT IN (
  SELECT 
    o.sales_id 
  FROM orders o 
  LEFT JOIN company c
  ON o.com_id=c.com_id
  WHERE c.name = 'RED'
);


