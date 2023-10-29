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
 

-- Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

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
-- | 3           | John   | 1                |
-- | 4           | Doe    | 2                |
-- +-------------+--------+------------------+

-- Result table:
-- +-------------+---------------+
-- | project_id  | average_years |
-- +-------------+---------------+
-- | 1           | 2.00          |
-- | 2           | 2.50          |
-- +-------------+---------------+
-- The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 
-- and for the second project is (3 + 2) / 2 = 2.50

create table project(project_id int, employee_id int);
create table employee(employee_id int, name text, experience_years int);

insert into project values(1,1); 
insert into project values(1,2); 
insert into project values(1,3); 
insert into project values(2,1); 
insert into project values(2,4); 

insert into employee values(1,'Khaled',3);
insert into employee values(2,'Ali',2);
insert into employee values(3,'John',1);
insert into employee values(4,'Doe',2);


select * from project;
select * from employee;


SELECT p.project_id, ROUND(SUM(e.experience_years)/COUNT(e.employee_id), 2) average_years
FROM project p JOIN employee e
ON p.employee_id=e.employee_id
GROUP BY p.project_id;


