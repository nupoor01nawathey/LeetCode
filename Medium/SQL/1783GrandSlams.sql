-- Table: Players
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | player_id      | int     |
-- | player_name    | varchar |
-- +----------------+---------+
-- player_id is the primary key for this table.
-- Each row in this table contains the name and the ID of a tennis player.


-- Table: Championships
-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | year          | int     |
-- | Wimbledon     | int     |
-- | Fr_open       | int     |
-- | US_open       | int     |
-- | Au_open       | int     |
-- +---------------+---------+
-- year is the primary key for this table.
-- Each row of this table containts the IDs of the players who won one each tennis tournament of the grand slam.

-- Write an SQL query to report the number of grand slam tournaments won by each player. 
-- Do not include the players who did not win any tournament.
-- Return the result table in any order.
-- The query result format is in the following example:

-- Players table:
-- +-----------+-------------+
-- | player_id | player_name |
-- +-----------+-------------+
-- | 1         | Nadal       |
-- | 2         | Federer     |
-- | 3         | Novak       |
-- +-----------+-------------+

-- Championships table:
-- +------+-----------+---------+---------+---------+
-- | year | Wimbledon | Fr_open | US_open | Au_open |
-- +------+-----------+---------+---------+---------+
-- | 2018 | 1         | 1       | 1       | 1       |
-- | 2019 | 1         | 1       | 2       | 2       |
-- | 2020 | 2         | 1       | 2       | 2       |
-- +------+-----------+---------+---------+---------+

-- Result table:
-- +-----------+-------------+-------------------+
-- | player_id | player_name | grand_slams_count |
-- +-----------+-------------+-------------------+
-- | 2         | Federer     | 5                 |
-- | 1         | Nadal       | 7                 |
-- +-----------+-------------+-------------------+

-- Player 1 (Nadal) won 7 titles: Wimbledon (2018, 2019), Fr_open (2018, 2019, 2020), US_open (2018), and Au_open (2018).
-- Player 2 (Federer) won 5 titles: Wimbledon (2020), US_open (2019, 2020), and Au_open (2019, 2020).
-- Player 3 (Novak) did not win anything, we did not include them in the result table.


create table players(player_id int, player_name text);
create table championships(year int, wimbledon int, fr_open int, us_open int, au_open int);

insert into players values(1,'Nadal');
insert into players values(2,'Federer');
insert into players values(3,'Novak');

insert into championships values(2018,1,1,1,1);
insert into championships values(2019,1,1,2,2);
insert into championships values(2020,2,1,2,2);

select * from players;
select * from championships;


-- SIMPLIFIED SYNTAX
SELECT
  player_id,
  player_name,
  SUM(player_id=wimbledon)+SUM(player_id=fr_open)+SUM(player_id=us_open)
  +SUM(player_id=au_open) AS grand_slams_count
FROM players JOIN championships
ON player_id = wimbledon
OR player_id = fr_open
OR player_id = us_open
OR player_id = au_open
GROUP BY player_id, player_name
;



-- Un-pivot the table, get the count using group by
-- WITH cte1 AS (
--   SELECT
--     year, 'wimbledon' AS championship, wimbledon AS player_id
--   FROM championships
--   UNION
--   SELECT
--     year, 'fr_open' AS championship, fr_open AS player_id
--   FROM championships
--   UNION
--   SELECT
--     year, 'us_open' AS championship, us_open AS player_id
--   FROM championships
--   UNION
--   SELECT
--     year, 'au_open' AS championship, au_open AS player_id
--   FROM championships 
-- ),
-- cte2 AS (
--   SELECT 
--     player_id,
--     COUNT(player_id) grand_slams_count
--   FROM cte1
--   GROUP BY player_id
-- )
-- SELECT 
--   c.*,
--   player_name
-- FROM cte2 c LEFT JOIN players p
-- ON c.player_id=p.player_id
-- ;


