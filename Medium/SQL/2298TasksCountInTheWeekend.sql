-- Table: Tasks

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | task_id     | int  |
-- | assignee_id | int  |
-- | submit_date | date |
-- +-------------+------+
-- task_id is the primary key for this table.
-- Each row in this table contains the ID of a task, the id of the assignee, and the submission date.
-- Write an SQL query to report:

-- the number of the tasks that were submitted during the weekend (Saturday, Sunday) as weekend_cnt, and the number of the tasks that were submitted during the working days as working_cnt. Return the result table in any order.

-- The query result format is shown in the following example.

-- Example 1:

-- Input: 
-- Tasks table:
-- +---------+-------------+-------------+
-- | task_id | assignee_id | submit_date |
-- +---------+-------------+-------------+
-- | 1       | 1           | 2022-06-13  |
-- | 2       | 6           | 2022-06-14  |
-- | 3       | 6           | 2022-06-15  |
-- | 4       | 3           | 2022-06-18  |
-- | 5       | 5           | 2022-06-19  |
-- | 6       | 7           | 2022-06-19  |
-- +---------+-------------+-------------+
-- Output: 
-- +-------------+-------------+
-- | weekend_cnt | working_cnt |
-- +-------------+-------------+
-- | 3           | 3           |
-- +-------------+-------------+
-- Explanation: 
-- Task 1 was submitted on Monday.
-- Task 2 was submitted on Tuesday.
-- Task 3 was submitted on Wednesday.
-- Task 4 was submitted on Saturday.
-- Task 5 was submitted on Sunday.
-- Task 6 was submitted on Sunday.
-- 3 tasks were submitted during the weekend.
-- 3 tasks were submitted during the working days.

create table tasks(task_id int, assignee_id int, submit_date date);

insert into tasks values(1,1,'2022-06-13');
insert into tasks values(2,6,'2022-06-14');
insert into tasks values(3,6,'2022-06-15');
insert into tasks values(4,3,'2022-06-18');
insert into tasks values(5,5,'2022-06-19');
insert into tasks values(6,7,'2022-06-19');

select * from tasks;

SELECT 
  SUM(CASE WHEN DAYOFWEEK(submit_date) IN (1,7) THEN 1 ELSE 0 END) AS weekend_count,
  SUM(CASE WHEN DAYOFWEEK(submit_date) NOT IN (1,7) THEN 1 ELSE 0 END) AS working_cnt
FROM tasks
;








