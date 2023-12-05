-- Table Variables:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | name          | varchar |
-- | value         | int     |
-- +---------------+---------+
-- name is the primary key for this table.
-- This table contains the stored variables and their values.
 

-- Table Expressions:
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | left_operand  | varchar |
-- | operator      | enum    |
-- | right_operand | varchar |
-- +---------------+---------+
-- (left_operand, operator, right_operand) is the primary key for this table.
-- This table contains a boolean expression that should be evaluated.
-- operator is an enum that takes one of the values ('<', '>', '=')
-- The values of left_operand and right_operand are guaranteed to be in the Variables table.
 

-- Write an SQL query to evaluate the boolean expressions in Expressions table.
-- Return the result table in any order.
-- The query result format is in the following example.

-- Variables table:
-- +------+-------+
-- | name | value |
-- +------+-------+
-- | x    | 66    |
-- | y    | 77    |
-- +------+-------+

-- Expressions table:
-- +--------------+----------+---------------+
-- | left_operand | operator | right_operand |
-- +--------------+----------+---------------+
-- | x            | >        | y             |
-- | x            | <        | y             |
-- | x            | =        | y             |
-- | y            | >        | x             |
-- | y            | <        | x             |
-- | x            | =        | x             |
-- +--------------+----------+---------------+

-- Result table:
-- +--------------+----------+---------------+-------+
-- | left_operand | operator | right_operand | value |
-- +--------------+----------+---------------+-------+
-- | x            | >        | y             | false |
-- | x            | <        | y             | true  |
-- | x            | =        | y             | false |
-- | y            | >        | x             | true  |
-- | y            | <        | x             | false |
-- | x            | =        | x             | true  |
-- +--------------+----------+---------------+-------+

-- As shown, you need find the value of each boolean exprssion in the table using the variables table.


create table variables(name char(1), value int);
create table expressions(left_operand char(1), operator varchar(5), right_operand char(1));

insert into variables values('x',66);
insert into variables values('y',77);

insert into expressions values('x','>','y');
insert into expressions values('x','<','y');
insert into expressions values('x','=','y');
insert into expressions values('y','>','x');
insert into expressions values('y','<','x');
insert into expressions values('x','=','x');

select * from variables;
select * from expressions;


SELECT 
  e.*,
  CASE WHEN operator = '>' AND v1.value > v2.value THEN 'true' 
       WHEN operator = '<' AND v1.value < v2.value THEN 'true' 
       WHEN operator = '=' AND v1.value = v2.value THEN 'true' 
      ELSE 'false'
  END value
FROM expressions e
LEFT JOIN variables v1
ON e.left_operand=v1.name
LEFT JOIN variables v2
ON e.right_operand=v2.name












