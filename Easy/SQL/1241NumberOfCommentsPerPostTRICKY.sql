-- Table: Submissions

-- +---------------+----------+
-- | Column Name   | Type     |
-- +---------------+----------+
-- | sub_id        | int      |
-- | parent_id     | int      |
-- +---------------+----------+
-- There is no primary key for this table, it may have duplicate rows.
-- Each row can be a post or comment on the post.

-- parent_id is null for posts.
-- parent_id for comments is sub_id for another post in the table.
 
-- Write a SQL query to find number of comments per each post.

-- Result table should contain post_id and its corresponding number_of_comments, 
-- and must be sorted by post_id in ascending order.

-- Submissions may contain duplicate comments. You should count the number of unique comments per post.

-- Submissions may contain duplicate posts. You should treat them as one post.

-- The query result format is in the following example:

-- Submissions table:
-- +---------+------------+
-- | sub_id  | parent_id  |
-- +---------+------------+
-- | 1       | Null       |
-- | 2       | Null       |
-- | 1       | Null       |
-- | 12      | Null       |
-- | 3       | 1          |
-- | 5       | 2          |
-- | 3       | 1          |
-- | 4       | 1          |
-- | 9       | 1          |
-- | 10      | 2          |
-- | 6       | 7          |
-- +---------+------------+

-- Result table:
-- +---------+--------------------+
-- | post_id | number_of_comments |
-- +---------+--------------------+
-- | 1       | 3                  |
-- | 2       | 2                  |
-- | 12      | 0                  |
-- +---------+--------------------+

-- The post with id 1 has three comments in the table with id 3, 4 and 9. The comment with id 3 is 
-- repeated in the table, we counted it only once.
-- The post with id 2 has two comments in the table with id 5 and 10.
-- The post with id 12 has no comments in the table.
-- The comment with id 6 is a comment on a deleted post with id 7 so we ignored it.


create table submissions(sub_id int, parent_id int);

insert into submissions values(1,NULL); 
insert into submissions values(2,NULL);
insert into submissions values(1,NULL); 
insert into submissions values(12,NULL);
insert into submissions values(3,1);    
insert into submissions values(5,2);    
insert into submissions values(3,1);    
insert into submissions values(4,1);    
insert into submissions values(9,1);    
insert into submissions values(10,2);    
insert into submissions values(6,7);   

select * from submissions;

WITH posts as 
  (
    SELECT DISTINCT sub_id FROM submissions
    WHERE parent_id IS NULL
  ),
  comments as 
  (
    SELECT parent_id, COUNT(DISTINCT sub_id) as number_of_comments
    FROM submissions
    WHERE parent_id IS NOT NULL
    GROUP BY parent_id
  )

SELECT 
  sub_id as post_id,
  CASE WHEN number_of_comments IS NOT NULL THEN number_of_comments ELSE 0 END as number_of_comments
FROM posts LEFT JOIN comments
ON posts.sub_id=comments.parent_id;



