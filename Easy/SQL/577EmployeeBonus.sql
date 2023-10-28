-- Select all employee's name and bonus whose bonus is < 1000.

-- Table:Employee

-- +-------+--------+-----------+--------+
-- | empId |  name  | supervisor| salary |
-- +-------+--------+-----------+--------+
-- |   1   | John   |  3        | 1000   |
-- |   2   | Dan    |  3        | 2000   |
-- |   3   | Brad   |  null     | 4000   |
-- |   4   | Thomas |  3        | 4000   |
-- +-------+--------+-----------+--------+
-- empId is the primary key column for this table.
-- Table: Bonus

-- +-------+-------+
-- | empId | bonus |
-- +-------+-------+
-- | 2     | 500   |
-- | 4     | 2000  |
-- +-------+-------+
-- empId is the primary key column for this table.
-- Example ouput:

-- +-------+-------+
-- | name  | bonus |
-- +-------+-------+
-- | John  | null  |
-- | Dan   | 500   |
-- | Brad  | null  |
-- +-------+-------+




create table employee(empId int, name varchar(50), supervisor varchar(30), salary int);
create table bonus(empId int, bonus int);

insert into employee values(1,'John',3,1000);
insert into employee values(2,'Dan',3,2000);
insert into employee values(3,'Brad','',4000);
insert into employee values(4,'Thomas',3,4000);

insert into bonus values(2, 500);
insert into bonus values(4, 2000);

select * from employee;
select * from bonus;

SELECT
  e.name,
  b.bonus
FROM employee e 
LEFT JOIN bonus b
ON e.empId=b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;


