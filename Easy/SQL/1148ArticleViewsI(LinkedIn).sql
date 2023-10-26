-- Question 42
-- Table: Views

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | article_id    | int     |
-- | author_id     | int     |
-- | viewer_id     | int     |
-- | view_date     | date    |
-- +---------------+---------+
-- There is no primary key for this table, it may have duplicate rows.
-- Each row of this table indicates that some viewer viewed an article (written by some author)
-- on some date. 
-- Note that equal author_id and viewer_id indicate the same person.
 

-- Write an SQL query to find all the authors that viewed at least one of 
-- their own articles, sorted in ascending order by their id.

-- The query result format is in the following example:

-- Views table:
-- +------------+-----------+-----------+------------+
-- | article_id | author_id | viewer_id | view_date  |
-- +------------+-----------+-----------+------------+
-- | 1          | 3         | 5         | 2019-08-01 |
-- | 1          | 3         | 6         | 2019-08-02 |
-- | 2          | 7         | 7         | 2019-08-01 |
-- | 2          | 7         | 6         | 2019-08-02 |
-- | 4          | 7         | 1         | 2019-07-22 |
-- | 3          | 4         | 4         | 2019-07-21 |
-- | 3          | 4         | 4         | 2019-07-21 |
-- +------------+-----------+-----------+------------+

-- Result table:
-- +------+
-- | id   |
-- +------+
-- | 4    |
-- | 7    |
-- +------+

create table views(article_id int, author_id int, viewer_id int, view_date date);

insert into views values(1,3,5,date('2019-08-01'));
insert into views values(1,3,6,date('2019-08-02'));
insert into views values(2,7,7,date('2019-08-01'));
insert into views values(2,7,6,date('2019-08-02'));
insert into views values(4,7,1,date('2019-07-22'));
insert into views values(3,4,4,date('2019-07-21'));
insert into views values(3,4,4,date('2019-07-21'));

select * from views;


SELECT 
  distinct author_id
FROM views
WHERE author_id=viewer_id
ORDER BY author_id;






