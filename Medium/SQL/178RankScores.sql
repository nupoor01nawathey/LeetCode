-- Write a SQL query to rank scores. 
-- If there is a tie between two scores, both should have the same ranking. 
-- Note that after a tie, the next ranking number should be the next consecutive integer 
-- value. In other words, there should be no "holes" between ranks.

-- Scores
-- +----+-------+
-- | Id | Score |
-- +----+-------+
-- | 1  | 3.50  |
-- | 2  | 3.65  |
-- | 3  | 4.00  |
-- | 4  | 3.85  |
-- | 5  | 4.00  |
-- | 6  | 3.65  |
-- +----+-------+
-- For example, given the above Scores table, your query should generate the following report (order by highest score):

-- +-------+------+
-- | Score | Rank |
-- +-------+------+
-- | 4.00  | 1    |
-- | 4.00  | 1    |
-- | 3.85  | 2    |
-- | 3.65  | 3    |
-- | 3.65  | 3    |
-- | 3.50  | 4    |
-- +-------+------+

create table scores(id int, score float);

insert into scores values(1,3.50); 
insert into scores values(2,3.65); 
insert into scores values(3,4.00); 
insert into scores values(4,3.85); 
insert into scores values(5,4.00); 
insert into scores values(6,3.65); 

select * from scores;

SELECT
  score,
  DENSE_RANK() OVER(ORDER BY score DESC) rank1
FROM scores;

