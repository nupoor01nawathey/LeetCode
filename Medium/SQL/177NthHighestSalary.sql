-- Table: Employee

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key column for this table.
-- Each row of this table contains information about the salary of an employee.
 
-- Write an SQL query to report the nth highest salary from the Employee table. 
-- If there is no nth highest salary, the query should report null.
-- The query result format is in the following example.
-- Example 1:

-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- n = 2

-- Output: 
-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | 200                    |
-- +------------------------+
-- Example 2:

-- Input: 
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- +----+--------+
-- n = 2
-- Output: 
-- +------------------------+
-- | getNthHighestSalary(2) |
-- +------------------------+
-- | null                   |
-- +------------------------+

create table employee(id int, salary int);

insert into employee values(1,100);
insert into employee values(2,200);
insert into employee values(3,300);

select * from employee;

CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN 
  RETURN(
    WITH cte AS (
      SELECT 
        *, 
        DENSE_RANK() OVER(ORDER BY salary DESC) dr
      FROM employee
      ORDER BY 
    )
    SELECT 
      DISTINCT IFNULL(salary, NULL)
    FROM cte
    WHERE dr=N
  );
END
