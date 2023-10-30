-- Table: Employees

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | name          | varchar |
-- +---------------+---------+
-- id is the primary key for this table.
-- Each row of this table contains the id and the name of an employee in a company.
 

-- Table: EmployeeUNI

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | unique_id     | int     |
-- +---------------+---------+
-- (id, unique_id) is the primary key for this table.
-- Each row of this table contains the id and the corresponding unique id of an employee in the company.
 

-- Write an SQL query to show the unique ID of each user, If a user doesn't have a unique ID replace just show null.

-- Return the result table in any order.

-- The query result format is in the following example:

-- Employees table:
-- +----+----------+
-- | id | name     |
-- +----+----------+
-- | 1  | Alice    |
-- | 7  | Bob      |
-- | 11 | Meir     |
-- | 90 | Winston  |
-- | 3  | Jonathan |
-- +----+----------+

-- EmployeeUNI table:
-- +----+-----------+
-- | id | unique_id |
-- +----+-----------+
-- | 3  | 1         |
-- | 11 | 2         |
-- | 90 | 3         |
-- +----+-----------+

-- EmployeeUNI table:
-- +-----------+----------+
-- | unique_id | name     |
-- +-----------+----------+
-- | null      | Alice    |
-- | null      | Bob      |
-- | 2         | Meir     |
-- | 3         | Winston  |
-- | 1         | Jonathan |
-- +-----------+----------+

-- Alice and Bob don't have a unique ID, We will show null instead.
-- The unique ID of Meir is 2.
-- The unique ID of Winston is 3.
-- The unique ID of Jonathan is 1.

create table employee(id int, name char(10));
create table EmployeeUNI(id int, unique_id int);


insert into employee values(1,'Alice'); 
insert into employee values(7,'Bob');
insert into employee values(11,'Meir');   
insert into employee values(90,'Winston'); 
insert into employee values(3,'Jonathan');

insert into EmployeeUNI values(3,1);
insert into EmployeeUNI values(11,2);
insert into EmployeeUNI values(90,3);

select * from employee;
select * from EmployeeUNI;

SELECT
  u.unique_id, e.name
FROM employee e 
LEFT JOIN EmployeeUNI u
ON e.id=u.id;




