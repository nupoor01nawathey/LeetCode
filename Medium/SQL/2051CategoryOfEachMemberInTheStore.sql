-- Table: Members

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | member_id   | int     |
-- | name        | varchar |
-- +-------------+---------+
-- member_id is the primary key column for this table.
-- Each row of this table indicates the name and the ID of a member.
 

-- Table: Visits

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | visit_id    | int  |
-- | member_id   | int  |
-- | visit_date  | date |
-- +-------------+------+
-- visit_id is the primary key column for this table.
-- member_id is a foreign key to member_id from the Members table.
-- Each row of this table contains information about the date of a visit to the store and the member who visited it.
 

-- Table: Purchases

-- +----------------+------+
-- | Column Name    | Type |
-- +----------------+------+
-- | visit_id       | int  |
-- | charged_amount | int  |
-- +----------------+------+
-- visit_id is the primary key column for this table.
-- visit_id is a foreign key to visit_id from the Visits table.
-- Each row of this table contains information about the amount charged in a visit to the store.
 

-- A store wants to categorize its members. There are three tiers:

-- "Diamond": if the conversion rate is greater than or equal to 80.
-- "Gold": if the conversion rate is greater than or equal to 50 and less than 80.
-- "Silver": if the conversion rate is less than 50.
-- "Bronze": if the member never visited the store.
-- The conversion rate of a member is (100 * total number of purchases for the member) / total number of visits for the member.

-- Write an SQL query to report the id, the name, and the category of each member.

-- Return the result table in any order.

-- The query result format is in the following example.

 

-- Example 1:

-- Input: 
-- Members table:
-- +-----------+---------+
-- | member_id | name    |
-- +-----------+---------+
-- | 9         | Alice   |
-- | 11        | Bob     |
-- | 3         | Winston |
-- | 8         | Hercy   |
-- | 1         | Narihan |
-- +-----------+---------+
-- Visits table:
-- +----------+-----------+------------+
-- | visit_id | member_id | visit_date |
-- +----------+-----------+------------+
-- | 22       | 11        | 2021-10-28 |
-- | 16       | 11        | 2021-01-12 |
-- | 18       | 9         | 2021-12-10 |
-- | 19       | 3         | 2021-10-19 |
-- | 12       | 11        | 2021-03-01 |
-- | 17       | 8         | 2021-05-07 |
-- | 21       | 9         | 2021-05-12 |
-- +----------+-----------+------------+
-- Purchases table:
-- +----------+----------------+
-- | visit_id | charged_amount |
-- +----------+----------------+
-- | 12       | 2000           |
-- | 18       | 9000           |
-- | 17       | 7000           |
-- | 12       | 2000           |
-- | 18       | 9000           |
-- | 17       | 7000           |
-- | 12       | 2000           |
-- | 18       | 9000           |
-- | 17       | 7000           |
-- +----------+----------------+
-- Output: 
-- +-----------+---------+----------+
-- | member_id | name    | category |
-- +-----------+---------+----------+
-- | 1         | Narihan | Bronze   |
-- | 3         | Winston | Silver   |
-- | 8         | Hercy   | Diamond  |
-- | 9         | Alice   | Gold     |
-- | 11        | Bob     | Silver   |
-- +-----------+---------+----------+
-- Explanation: 
-- - User Narihan with id = 1 did not make any visits to the store. She gets a Bronze category.
-- - User Winston with id = 3 visited the store one time and did not purchase anything. The conversion rate = (100 * 0) / 1 = 0. He gets a Silver category.
-- - User Hercy with id = 8 visited the store one time and purchased one time. The conversion rate = (100 * 1) / 1 = 1. He gets a Diamond category.
-- - User Alice with id = 9 visited the store two times and purchased one time. The conversion rate = (100 * 1) / 2 = 50. She gets a Gold category.
-- - User Bob with id = 11 visited the store three times and purchased one time. The conversion rate = (100 * 1) / 3 = 33.33. He gets a Silver category.

create table members(member_id int, name varchar(10));
create table visits(visit_id int, member_id int, visit_date date);
create table purchases(visit_id int, charged_amount int);

insert into members values(9,'Alice');  
insert into members values(11,'Bob');    
insert into members values(3,'Winston');
insert into members values(8,'Hercy');  
insert into members values(1,'Narihan');

insert into visits values(22,11,'2021-10-28');
insert into visits values(16,11,'2021-01-12');
insert into visits values(18,9,'2021-12-10');
insert into visits values(19,3,'2021-10-19');
insert into visits values(12,11,'2021-03-01');
insert into visits values(17,8,'2021-05-07');
insert into visits values(21,9,'2021-05-12');

insert into purchases values(12,2000); 
insert into purchases values(18,9000); 
insert into purchases values(17,7000); 

select * from members;
select * from visits;
select * from purchases;

WITH cte AS (
  SELECT
    m.member_id,
    m.name,
    v.visit_id,
    p.charged_amount
  FROM members m 
  LEFT join visits v
  ON m.member_id=v.member_id
  LEFT JOIN purchases p
  ON v.visit_id=p.visit_id
),
cte2 AS (
  SELECT
    member_id,
    name,
    SUM(CASE WHEN charged_amount IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*) * 100 AS conversion_rate
  FROM cte
  GROUP BY member_id, name
)
SELECT
  member_id,
  name,
  CASE WHEN conversion_rate >= 80 THEN 'Diamond'
       WHEN conversion_rate >= 50 AND conversion_rate < 80 THEN 'Gold'
       WHEN conversion_rate < 50 AND member_id IN(SELECT DISTINCT member_id FROM visits) THEN 'Silve' 
       ELSE 'Bronze'       
       END
  AS category
FROM cte2
;









