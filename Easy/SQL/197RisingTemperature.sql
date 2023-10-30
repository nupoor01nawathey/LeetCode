-- Given a Weather table, write a SQL query to find all dates' Ids with higher temperature 
-- compared to its previous (yesterday's) dates.

-- +---------+------------------+------------------+
-- | Id(INT) | RecordDate(DATE) | Temperature(INT) |
-- +---------+------------------+------------------+
-- |       1 |       2015-01-01 |               10 |
-- |       2 |       2015-01-02 |               25 |
-- |       3 |       2015-01-03 |               20 |
-- |       4 |       2015-01-04 |               30 |
-- +---------+------------------+------------------+
-- For example, return the following Ids for the above Weather table:

-- +----+
-- | Id |
-- +----+
-- |  2 |
-- |  4 |
-- +----+

create table weather(Id int, RecordDate date, Temperature int);

insert into weather values(1,date('2015-01-01'),10);
insert into weather values(2,date('2015-01-02'),25);
insert into weather values(3,date('2015-01-03'),20);
insert into weather values(4,date('2015-01-04'),30);

select * from weather;

SELECT 
  w1.*
FROM weather w1, weather w2
WHERE DATEDIFF(w1.RecordDate,w2.RecordDate)=1
AND w1.Temperature > w2.Temperature;











