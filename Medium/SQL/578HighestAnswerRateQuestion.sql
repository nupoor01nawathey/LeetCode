-- Get the highest answer rate question from a table survey_log with these columns: uid, action, question_id, answer_id, q_num, timestamp.

-- uid means user id; action has these kind of values: "show", "answer",
-- "skip"; answer_id is not null when action column is "answer", 
-- while is null for "show" and "skip"; q_num is the numeral order of the question in current session.

-- Write a sql query to identify the question which has the highest answer rate.

-- Example:

-- Input:
-- +------+-----------+--------------+------------+-----------+------------+
-- | uid  | action    | question_id  | answer_id  | q_num     | timestamp  |
-- +------+-----------+--------------+------------+-----------+------------+
-- | 5    | show      | 285          | null       | 1         | 123        |
-- | 5    | answer    | 285          | 124124     | 1         | 124        |
-- | 5    | show      | 369          | null       | 2         | 125        |
-- | 5    | skip      | 369          | null       | 2         | 126        |
-- +------+-----------+--------------+------------+-----------+------------+
-- Output:
-- +-------------+
-- | survey_log  |
-- +-------------+
-- |    285      |
-- +-------------+

-- Explanation:
-- question 285 has answer rate 1/1, while question 369 has 0/1 answer rate, so output 285.

create table survey_log(uid int,action varchar(8),question_id int,answer_id int,q_num int,timestamp int);

insert into survey_log values(5,'show',285,null,1,123);
insert into survey_log values(5,'answer',285,124124,1,124);
insert into survey_log values(5,'show',369,null,2,125);
insert into survey_log values(5,'skip',369,null,2,126);

select * from survey_log;

WITH cte AS (
  SELECT
    question_id,
    SUM(CASE WHEN action='answer' THEN 1 ELSE 0 END)
      /
    SUM(CASE WHEN action='show' THEN 1 ELSE 0 END)
    AS answer_rate
  FROM survey_log
  GROUP BY question_id
)
SELECT
  question_id AS survey_log
FROM cte
ORDER BY answer_rate DESC, question_id 
LIMIT 1 
;



