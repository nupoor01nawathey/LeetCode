-- Write a SQL query to get the second highest salary from the Employee table.

-- +----+--------+
-- | Id | Salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- For example, given the above Employee table, the query should return 200 as the 
-- second highest salary. 
-- **** If there is no second highest salary, then the query should return null.

-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+

create table employee(id int, salary int);

insert into employee values(1,100);
insert into employee values(2,200);
insert into employee values(3,300);

select * from employee;


-- SELECT IFNULL(salary, NULL)  FROM 

WITH cte AS (
  SELECT
    *,
    DENSE_RANK() OVER(ORDER BY salary DESC) dr
  FROM employee
  LIMIT 1
)
SELECT IFNULL((SELECT salary FROM cte WHERE dr=2 LIMIT 1), NULL) AS SecondHighestSalary

