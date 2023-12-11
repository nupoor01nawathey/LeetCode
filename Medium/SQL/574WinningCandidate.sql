-- Table: Candidate
-- +-----+---------+
-- | id  | Name    |
-- +-----+---------+
-- | 1   | A       |
-- | 2   | B       |
-- | 3   | C       |
-- | 4   | D       |
-- | 5   | E       |
-- +-----+---------+

-- Table: Vote
-- +-----+--------------+
-- | id  | CandidateId  |
-- +-----+--------------+
-- | 1   |     2        |
-- | 2   |     4        |
-- | 3   |     3        |
-- | 4   |     2        |
-- | 5   |     5        |
-- +-----+--------------+
-- id is the auto-increment primary key,
-- CandidateId is the id appeared in Candidate table.

-- Write a sql to find the name of the winning candidate, the above example will return the winner B.
-- +------+
-- | Name |
-- +------+
-- | B    |
-- +------+
-- Notes:

-- You may assume there is no tie, in other words there will be at most one winning candidate.

create table candidate(id int, name char(1));
create table vote(id int, candidate_id int);

insert into candidate values(1,'A');
insert into candidate values(2,'B');
insert into candidate values(3,'C');
insert into candidate values(4,'D');
insert into candidate values(5,'E');

insert into vote values(1,2);
insert into vote values(2,4);
insert into vote values(3,3);
insert into vote values(4,2);
insert into vote values(5,5);

select * from candidate;
select * from vote;

-- since exactly one candidate wins no need of distinct / window function 
SELECT name FROM candidate WHERE id = ( 
  SELECT
    COUNT(id)
  FROM vote
  GROUP BY candidate_id
  ORDER BY COUNT(id) DESC
  LIMIT 1
)



