-- The Employee table holds all employees including their managers. 
-- Every employee has an Id, and there is also a column for the manager Id.

-- +------+----------+-----------+----------+
-- |Id    |Name 	  |Department  |ManagerId |
-- +------+----------+-----------+----------+
-- |101   |John 	  |A 	         |null      |
-- |102   |Dan 	    |A 	         |101       |
-- |103   |James 	  |A 	        |101       |
-- |104   |Amy 	    |A 	        |101       |
-- |105   |Anne 	  |A 	        |101       |
-- |106   |Ron 	    |B 	        |101       |
-- +------+----------+-----------+----------+
-- Given the Employee table, write a SQL query that finds out managers with at least 
-- 5 direct report. For the above table, your SQL query should return:

-- +-------+
-- | Name  |
-- +-------+
-- | John  |
-- +-------+

-- Note:
-- No one would report to himself.

create table employee(id int,name varchar(10),department varchar(1), managerId int);

insert into employee values(101,'John','A',NULL);
insert into employee values(102,'Dan','A',101);
insert into employee values(103,'James','A',101);  
insert into employee values(104,'Amy','A',101);  
insert into employee values(105,'Anne','A',101);  
insert into employee values(106,'Ron','B',101);  

select * from employee;

SELECT 
  name 
FROM employee 
WHERE id IN (
  SELECT
      managerId
  FROM employee
  GROUP BY managerId
  HAVING COUNT(id) >= 5
)
