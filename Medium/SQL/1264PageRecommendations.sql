-- Table: Friendship
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | user1_id      | int     |
-- | user2_id      | int     |
-- +---------------+---------+
-- (user1_id, user2_id) is the primary key for this table.
-- Each row of this table indicates that there is a friendship relation between user1_id and user2_id.

-- Table: Likes
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | user_id     | int     |
-- | page_id     | int     |
-- +-------------+---------+
-- (user_id, page_id) is the primary key for this table.
-- Each row of this table indicates that user_id likes page_id.

-- Write an SQL query to recommend pages to the user with user_id = 1 using the 
-- pages that your friends liked. It should not recommend pages you already liked.

-- Return result table in any order without duplicates.

-- The query result format is in the following example:

-- Friendship table:
-- +----------+----------+
-- | user1_id | user2_id |
-- +----------+----------+
-- | 1        | 2        |
-- | 1        | 3        |
-- | 1        | 4        |
-- | 2        | 3        |
-- | 2        | 4        |
-- | 2        | 5        |
-- | 6        | 1        |
-- +----------+----------+

-- Likes table:
-- +---------+---------+
-- | user_id | page_id |
-- +---------+---------+
-- | 1       | 88      |
-- | 2       | 23      |
-- | 3       | 24      |
-- | 4       | 56      |
-- | 5       | 11      |
-- | 6       | 33      |
-- | 2       | 77      |
-- | 3       | 77      |
-- | 6       | 88      |
-- +---------+---------+

-- Result table:
-- +------------------+
-- | recommended_page |
-- +------------------+
-- | 23               |
-- | 24               |
-- | 56               |
-- | 33               |
-- | 77               |
-- +------------------+
-- User one is friend with users 2, 3, 4 and 6.
-- Suggested pages are 23 from user 2, 24 from user 3, 56 from user 3 and 33 from user 6.
-- Page 77 is suggested from both user 2 and user 3.
-- Page 88 is not suggested because user 1 already likes it.

create table friendships(user1_id int, user2_id int);
create table likes(user_id int, page_id int);

insert into friendships values(1,2); 
insert into friendships values(1,3); 
insert into friendships values(1,4); 
insert into friendships values(2,3); 
insert into friendships values(2,4); 
insert into friendships values(2,5); 
insert into friendships values(6,1); 

insert into likes values(1,88);
insert into likes values(2,23);
insert into likes values(3,24);
insert into likes values(4,56);
insert into likes values(5,11);
insert into likes values(6,33);
insert into likes values(2,77);
insert into likes values(3,77);
insert into likes values(6,88);

select * from friendships;
select * from likes;

WITH cte AS (
  SELECT 
    CASE WHEN user1_id=1 THEN user2_id
         WHEN user2_id=1 THEN user1_id
    END friends
  FROM friendships
)
SELECT 
  DISTINCT page_id recommended_page
FROM likes
WHERE user_id IN (SELECT friends FROM cte)
AND page_id NOT IN(SELECT page_id FROM likes WHERE user_id=1)





