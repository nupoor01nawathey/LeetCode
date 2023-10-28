-- Write a SQL query to find all duplicate emails in a table named Person.

-- +----+---------+
-- | Id | Email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
-- For example, your query should return the following for the above table:

-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+


create table person(id int, email text);

insert into person values(1, 'a@b.com');
insert into person values(1, 'c@b.com');
insert into person values(1, 'a@b.com');

select * from person;


SELECT
  email
FROM person
GROUP BY email
HAVING COUNT(1) > 1;

