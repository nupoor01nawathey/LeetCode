-- Question 14
-- Table: Person

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | PersonId    | int     |
-- | FirstName   | varchar |
-- | LastName    | varchar |
-- +-------------+---------+
-- PersonId is the primary key column for this table.
-- Table: Address

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | AddressId   | int     |
-- | PersonId    | int     |
-- | City        | varchar |
-- | State       | varchar |
-- +-------------+---------+
-- AddressId is the primary key column for this table.

-- Write a solution to report the first name, last name, city, and 
-- state of each person in the Person table. 
-- If the address of a personId is not present in the Address table, report null instead.

-- Return the result table in any order.

-- The result format is in the following example.

-- Example 1:

-- Input: 
-- Person table:
-- +----------+----------+-----------+
-- | personId | lastName | firstName |
-- +----------+----------+-----------+
-- | 1        | Wang     | Allen     |
-- | 2        | Alice    | Bob       |
-- +----------+----------+-----------+
-- Address table:
-- +-----------+----------+---------------+------------+
-- | addressId | personId | city          | state      |
-- +-----------+----------+---------------+------------+
-- | 1         | 2        | New York City | New York   |
-- | 2         | 3        | Leetcode      | California |
-- +-----------+----------+---------------+------------+
-- Output: 
-- +-----------+----------+---------------+----------+
-- | firstName | lastName | city          | state    |
-- +-----------+----------+---------------+----------+
-- | Allen     | Wang     | Null          | Null     |
-- | Bob       | Alice    | New York City | New York |
-- +-----------+----------+---------------+----------+
-- Explanation: 
-- There is no address in the address table for the personId = 1 so we return null in their city and state.
-- addressId = 1 contains information about the address of personId = 2.


create table person(PersonId int, FirstName text, lastName text);

create table address(AddressId int, PersonId int, City text, State text);

insert into person values(1, 'Wang', 'Allen');
insert into person values(2, 'Alice', 'Bob');

insert into address values(1, 2, 'New York City', 'New York');
insert into address values(2, 3, 'Leetcode', 'California');

select * from person;
select * from address;

SELECT
  p.FirstName,
  p.lastName,
  a.City
FROM person p LEFT JOIN address a
ON p.PersonId=a.PersonId;










