-- Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Id is the primary key column for this table.
-- For example, after running your query, the above Person table should have the following rows:

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+

create table person(id int, email text);

insert into person values(1, 'john@example.com');
insert into person values(2, 'bob@example.com');
insert into person values(3, 'john@example.com');

-- select * from person;


SELECT  p1.*, p2.* 
FROM Person p1
JOIN Person p2 ON p1.email = p2.email
WHERE p1.id > p2.id
