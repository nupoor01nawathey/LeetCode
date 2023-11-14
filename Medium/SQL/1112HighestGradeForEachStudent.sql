-- Table: Enrollments
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | student_id    | int     |
-- | course_id     | int     |
-- | grade         | int     |
-- +---------------+---------+
-- (student_id, course_id) is the primary key of this table.

-- Write a SQL query to find the highest grade with its corresponding course for each student. 
-- In case of a tie, you should find the course with the smallest course_id. 
-- The output must be sorted by increasing student_id.
-- The query result format is in the following example:

-- Enrollments table:
-- +------------+-------------------+
-- | student_id | course_id | grade |
-- +------------+-----------+-------+
-- | 2          | 2         | 95    |
-- | 2          | 3         | 95    |
-- | 1          | 1         | 90    |
-- | 1          | 2         | 99    |
-- | 3          | 1         | 80    |
-- | 3          | 2         | 75    |
-- | 3          | 3         | 82    |
-- +------------+-----------+-------+

-- Result table:
-- +------------+-------------------+
-- | student_id | course_id | grade |
-- +------------+-----------+-------+
-- | 1          | 2         | 99    |
-- | 2          | 2         | 95    |
-- | 3          | 3         | 82    |
-- +------------+-----------+-------+

create table enrollments(student_id int,course_id int,grade int);

insert into enrollments values(2,2,95);
insert into enrollments values(2,3,95);
insert into enrollments values(1,1,90);
insert into enrollments values(1,2,99);
insert into enrollments values(3,1,80);
insert into enrollments values(3,2,75);
insert into enrollments values(3,3,82);

select * from enrollments;

WITH cte AS (
  SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC) rn,
    RANK() OVER(PARTITION BY student_id ORDER BY grade DESC) rnk,
    DENSE_RANK() OVER(PARTITION BY student_id ORDER BY grade DESC) drnk
  FROM enrollments
)
SELECT student_id, course_id, grade FROM cte WHERE rn = 1;

