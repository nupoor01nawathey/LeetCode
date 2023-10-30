-- Table: Department

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | revenue       | int     |
-- | month         | varchar |
-- +---------------+---------+
-- (id, month) is the primary key of this table.
-- The table has information about the revenue of each department per month.
-- The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 

-- Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.

-- The query result format is in the following example:

-- Department table:
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+

-- Result table:
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+

-- Note that the result table has 13 columns (1 for the department id + 12 for the months).

create table department(id int, revenue int, month char(3));

insert into department values(1,8000,'Jan'); 
insert into department values(2,9000,'Jan'); 
insert into department values(3,10000,'Feb'); 
insert into department values(1,7000,'Feb'); 
insert into department values(1,6000,'Mar'); 

select * from department;


SELECT 
  id,
  SUM(if(month='Jan', revenue, null)) Jan_Revenue,
  SUM(if(month='Feb', revenue, null)) Feb_Revenue,
  SUM(if(month='Mar', revenue, null)) Mar_Revenue,
  SUM(if(month='Apr', revenue, null)) Apr_Revenue,
  SUM(if(month='May', revenue, null)) May_Revenue,
  SUM(if(month='Jun', revenue, null)) Jun_Revenue,
  SUM(if(month='Jul', revenue, null)) Jul_Revenue,
  SUM(if(month='Aug', revenue, null)) Aug_Revenue,
  SUM(if(month='Sep', revenue, null)) Sep_Revenue,
  SUM(if(month='Oct', revenue, null)) Oct_Revenue,
  SUM(if(month='Nov', revenue, null)) Nov_Revenue,
  SUM(if(month='Dec', revenue, null)) Dec_Revenue
FROM department
GROUP BY id;


-- Alternate solution
-- SUM(CASE WHEN month = 'Jan' THEN revenue ELSE 0 END) AS Jan_Revenue,






