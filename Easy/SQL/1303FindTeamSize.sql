-- Table: Employee
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | employee_id   | int     |
-- | team_id       | int     |
-- +---------------+---------+
-- employee_id is the primary key for this table.
-- Each row of this table contains the ID of each employee and their respective team.
-- Write an SQL query to find the team size of each of the employees.

-- Return result table in any order.

-- The query result format is in the following example:

-- Employee Table:
-- +-------------+------------+
-- | employee_id | team_id    |
-- +-------------+------------+
-- |     1       |     8      |
-- |     2       |     8      |
-- |     3       |     8      |
-- |     4       |     7      |
-- |     5       |     9      |
-- |     6       |     9      |
-- +-------------+------------+
-- Result table:
-- +-------------+------------+
-- | employee_id | team_size  |
-- +-------------+------------+
-- |     1       |     3      |
-- |     2       |     3      |
-- |     3       |     3      |
-- |     4       |     1      |
-- |     5       |     2      |
-- |     6       |     2      |
-- +-------------+------------+
-- Employees with Id 1,2,3 are part of a team with team_id = 8.
-- Employees with Id 4 is part of a team with team_id = 7.
-- Employees with Id 5,6 are part of a team with team_id = 9.


create table employee(emp_id int, team_id int);

insert into employee values(1,8); 
insert into employee values(2,8); 
insert into employee values(3,8); 
insert into employee values(4,7); 
insert into employee values(5,9); 
insert into employee values(6,9); 


select * from employee;


SELECT 
  t1.emp_id, t2.team_size
FROM employee t1
JOIN
    (
      SELECT
        team_id,
        count(team_id) as team_size
      FROM employee
      GROUP BY team_id
    ) t2
ON t1.team_id=t2.team_id;





