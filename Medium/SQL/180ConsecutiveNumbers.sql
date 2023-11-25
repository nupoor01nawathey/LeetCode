-- Write a SQL query to find all numbers that appear at least three times consecutively.
-- Logs
-- +----+-----+
-- | Id | Num |
-- +----+-----+
-- | 1  |  1  |
-- | 2  |  1  |
-- | 3  |  1  |
-- | 4  |  2  |
-- | 5  |  1  |
-- | 6  |  2  |
-- | 7  |  2  |
-- +----+-----+
-- For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

-- +-----------------+
-- | ConsecutiveNums |
-- +-----------------+
-- | 1               |
-- +-----------------+

create table logs(id int, num int);

insert into logs values(1,1);
insert into logs values(2,1);
insert into logs values(3,1);
insert into logs values(4,2);
insert into logs values(5,1);
insert into logs values(6,2);
insert into logs values(7,2);

select * from logs;


WITH cte AS (
  SELECT
    *,
    LAG(num, 1, num) OVER() AS next_1,
    LAG(num, 2, num) OVER() AS next_2
  FROM logs
)
SELECT
  DISTINCT num AS ConsecutiveNums
FROM cte
WHERE num=next_1 AND num=next_2
;
