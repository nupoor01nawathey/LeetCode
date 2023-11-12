-- Table: Project
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | project_id  | int     |
-- | employee_id | int     |
-- +-------------+---------+
-- (project_id, employee_id) is the primary key of this table.
-- employee_id is a foreign key to Employee table.

-- Table: Employee
-- +------------------+---------+
-- | Column Name      | Type    |
-- +------------------+---------+
-- | employee_id      | int     |
-- | name             | varchar |
-- | experience_years | int     |
-- +------------------+---------+
-- employee_id is the primary key of this table.
 

-- Write an SQL query that reports the most experienced employees in each project. 
-- In case of a tie, report all employees with the maximum number of experience years.
-- The query result format is in the following example:


-- Project table:
-- +-------------+-------------+
-- | project_id  | employee_id |
-- +-------------+-------------+
-- | 1           | 1           |
-- | 1           | 2           |
-- | 1           | 3           |
-- | 2           | 1           |
-- | 2           | 4           |
-- +-------------+-------------+

-- Employee table:
-- +-------------+--------+------------------+
-- | employee_id | name   | experience_years |
-- +-------------+--------+------------------+
-- | 1           | Khaled | 3                |
-- | 2           | Ali    | 2                |
-- | 3           | John   | 3                |
-- | 4           | Doe    | 2                |
-- +-------------+--------+------------------+

-- Result table:
-- +-------------+---------------+
-- | project_id  | employee_id   |
-- +-------------+---------------+
-- | 1           | 1             |
-- | 1           | 3             |
-- | 2           | 1             |
-- +-------------+---------------+
-- Both employees with id 1 and 3 have the most experience among the employees of the 
-- first project. For the second project, the employee with id 1 has the most experience.

create table project(project_id int,employee_id int);
create table employee(employee_id int,name varchar(10),experience_years int);

insert into project values(1,1); 
insert into project values(1,2); 
insert into project values(1,3); 
insert into project values(2,1); 
insert into project values(2,4); 

insert into employee values(1,'Khaled',3);
insert into employee values(2,'Ali',2);
insert into employee values(3,'John',3);
insert into employee values(4,'Doe',2);

select * from project;
select * from employee;

WITH cte AS(
  SELECT 
    p.project_id,
    p.employee_id,
    e.experience_years,
    MAX(e.experience_years) OVER(PARTITION BY p.project_id) max_experience
  FROM project p JOIN employee e
  ON p.employee_id=e.employee_id
)
SELECT 
  project_id,
  employee_id
FROM cte
WHERE experience_years=max_experience;







