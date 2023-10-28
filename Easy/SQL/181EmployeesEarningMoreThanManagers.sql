-- The Employee table holds all employees including their managers. 
-- Every employee has an Id, and there is also a column for the manager Id.

-- +----+-------+--------+-----------+
-- | Id | Name  | Salary | ManagerId |
-- +----+-------+--------+-----------+
-- | 1  | Joe   | 70000  | 3         |
-- | 2  | Henry | 80000  | 4         |
-- | 3  | Sam   | 60000  | NULL      |
-- | 4  | Max   | 90000  | NULL      |
-- +----+-------+--------+-----------+
-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers. 
-- For the above table, Joe is the only employee who earns more than his manager.

-- +----------+
-- | Employee |
-- +----------+
-- | Joe      |
-- +----------+

create table employees(id int, name varchar(10), salary int, managerID int);

insert into employees values(1, 'Joe', 70000, 3);
insert into employees values(2, 'Henry', 80000, 4);
insert into employees values(3, 'Sam', 60000, NULL);
insert into employees values(4, 'Max', 90000, NULL);

select * from employees;

SELECT
  e.name
FROM employees e JOIN employees m
ON e.managerID=m.id
WHERE e.salary>m.salary;




