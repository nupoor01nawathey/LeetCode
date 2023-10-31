-- Table: Activity

-- +--------------+---------+
-- | Column Name  | Type    |
-- +--------------+---------+
-- | player_id    | int     |
-- | device_id    | int     |
-- | event_date   | date    |
-- | games_played | int     |
-- +--------------+---------+
-- (player_id, event_date) is the primary key of this table.
-- This table shows the activity of players of some game.
-- Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on some day using some device.
 
-- Write a SQL query that reports the device that is first logged in for each player.

-- The query result format is in the following example:

-- Activity table:
-- +-----------+-----------+------------+--------------+
-- | player_id | device_id | event_date | games_played |
-- +-----------+-----------+------------+--------------+
-- | 1         | 2         | 2016-03-01 | 5            |
-- | 1         | 2         | 2016-05-02 | 6            |
-- | 2         | 3         | 2017-06-25 | 1            |
-- | 3         | 1         | 2016-03-02 | 0            |
-- | 3         | 4         | 2018-07-03 | 5            |
-- +-----------+-----------+------------+--------------+

-- Result table:
-- +-----------+-----------+
-- | player_id | device_id |
-- +-----------+-----------+
-- | 1         | 2         |
-- | 2         | 3         |
-- | 3         | 1         |
-- +-----------+-----------+


create table activity(player_id int, device_id int, event_date date, games_played int);

insert into activity values(1,2,date('2016-03-01'),5); 
insert into activity values(1,2,date('2016-05-02'),6); 
insert into activity values(2,3,date('2017-06-25'),1); 
insert into activity values(3,1,date('2016-03-02'),0); 
insert into activity values(3,4,date('2018-07-03'),5); 

select * from activity;


WITH CTE AS (
  SELECT
    player_id,
    device_id,
    row_number() over (partition by player_id order by event_date) rn
  FROM activity
) 
SELECT player_id,device_id from CTE WHERE rn=1;



