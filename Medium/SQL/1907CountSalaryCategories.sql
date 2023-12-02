-- Table: Accounts
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | account_id  | int  |
-- | income      | int  |
-- +-------------+------+
-- account_id is the primary key for this table.
-- Each row contains information about the monthly income for one bank account.
-- Write an SQL query to report the number of bank accounts of each salary category. The salary categories are:

-- "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.
-- The result table must* contain all three categories. If there are no accounts in a category, then report 0. Return the result table in **any order.

-- The query result format is in the following example.

-- Accounts table:
-- +------------+--------+
-- | account_id | income |
-- +------------+--------+
-- | 3          | 108939 |
-- | 2          | 12747  |
-- | 8          | 87709  |
-- | 6          | 91796  |
-- +------------+--------+

-- Result table:
-- +----------------+----------------+
-- | category       | accounts_counts|
-- +----------------+----------------+
-- | Low Salary     | 1              |
-- | Average Salary | 0              |
-- | High Salary    | 3              |
-- +----------------+----------------+

create table accounts(account_id int, income int);

insert into accounts values(3,108939); 
insert into accounts values(2,12747); 
insert into accounts values(8,87709); 
insert into accounts values(6,91796); 

select * from accounts;

SELECT 
  'Low Salary' category,
  SUM(CASE WHEN income<20000 THEN 1 ELSE 0 END) accounts_counts
FROM accounts
UNION
SELECT 
  'Average Salary' category,
  SUM(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END) accounts_counts
FROM accounts
UNION
SELECT 
  'High Salary' category,
  SUM(CASE WHEN income>50000 THEN 1 ELSE 0 END) accounts_counts
FROM accounts





