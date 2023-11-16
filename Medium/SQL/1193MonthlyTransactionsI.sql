-- Table: Transactions
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | country       | varchar |
-- | state         | enum    |
-- | amount        | int     |
-- | trans_date    | date    |
-- +---------------+---------+
-- id is the primary key of this table.
-- The table has information about incoming transactions.
-- The state column is an enum of type ["approved", "declined"].
 
-- Write an SQL query to find for each month and country, the number of transactions and 
-- their total amount, the number of approved transactions and their total amount.
-- The query result format is in the following example:

-- Transactions table:
-- +------+---------+----------+--------+------------+
-- | id   | country | state    | amount | trans_date |
-- +------+---------+----------+--------+------------+
-- | 121  | US      | approved | 1000   | 2018-12-18 |
-- | 122  | US      | declined | 2000   | 2018-12-19 |
-- | 123  | US      | approved | 2000   | 2019-01-01 |
-- | 124  | DE      | approved | 2000   | 2019-01-07 |
-- +------+---------+----------+--------+------------+

-- Result table:
-- +----------+---------+-------------+----------------+--------------------+-----------------------+
-- | month    | country | trans_count | approved_count | trans_total_amount | approved_total_amount |
-- +----------+---------+-------------+----------------+--------------------+-----------------------+
-- | 2018-12  | US      | 2           | 1              | 3000               | 1000                  |
-- | 2019-01  | US      | 1           | 1              | 2000               | 2000                  |
-- | 2019-01  | DE      | 1           | 1              | 2000               | 2000                  |
-- +----------+---------+-------------+----------------+--------------------+-----------------------+

create table transactions(id int,country char(5),state varchar(15),amount int,trans_date date);

insert into transactions values(121,'US','approved',1000,'2018-12-18');
insert into transactions values(122,'US','declined',2000,'2018-12-19');
insert into transactions values(123,'US','approved',2000,'2019-01-01');
insert into transactions values(124,'DE','approved',2000,'2019-01-07');

select * from transactions ;

WITH cte AS(
  SELECT
    id,
    country,
    state,
    amount,
    DATE_FORMAT(trans_date, '%Y-%m') as trans_date
  FROM transactions
)
SELECT 
  trans_date month,
  country,
  count(id) trans_count,
  SUM(CASE WHEN state='approved' THEN 1 ELSE 0 END) AS approved_count,
  SUM(amount) trans_total_amount,
  SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM cte
GROUP BY trans_date, country ;


