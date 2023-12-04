-- Table: Teams
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | team_id        | int     |
-- | team_name      | varchar |
-- +----------------+---------+
-- team_id is the primary key for this table.
-- Each row contains information about one team in the league.

-- Table: Matches
-- +-----------------+---------+
-- | Column Name     | Type    |
-- +-----------------+---------+
-- | home_team_id    | int     |
-- | away_team_id    | int     |
-- | home_team_goals | int     |
-- | away_team_goals | int     |
-- +-----------------+---------+
-- (home_team_id, away_team_id) is the primary key for this table.
-- Each row contains information about one match.
-- home_team_goals is the number of goals scored by the home team.
-- away_team_goals is the number of goals scored by the away team.
-- The winner of the match is the team with the higher number of goals.
 
-- Write an SQL query to report the statistics of the league. 
-- The statistics should be built using the played matches where the winning team gets 
-- three points and the losing team gets no points. 
-- If a match ends with a draw, both teams get one point.

-- Each row of the result table should contain:

-- team_name - The name of the team in the Teams table.
-- matches_played - The number of matches played as either a home or away team.
-- points - The total points the team has so far.
-- goal_for - The total number of goals scored by the team across all matches.
-- goal_against - The total number of goals scored by opponent teams against this team across all matches.
-- goal_diff - The result of goal_for - goal_against.
-- Return the result table in descending order by points. If two or more teams have the same points, order them in descending order by goal_diff. If there is still a tie, order them by team_name in lexicographical order.

-- The query result format is in the following example:

-- Teams table:
-- +---------+-----------+
-- | team_id | team_name |
-- +---------+-----------+
-- | 1       | Ajax      |
-- | 4       | Dortmund  |
-- | 6       | Arsenal   |
-- +---------+-----------+

-- Matches table:
-- +--------------+--------------+-----------------+-----------------+
-- | home_team_id | away_team_id | home_team_goals | away_team_goals |
-- +--------------+--------------+-----------------+-----------------+
-- | 1            | 4            | 0               | 1               |
-- | 1            | 6            | 3               | 3               |
-- | 4            | 1            | 5               | 2               |
-- | 6            | 1            | 0               | 0               |
-- +--------------+--------------+-----------------+-----------------+


-- Result table:
-- +-----------+----------------+--------+----------+--------------+-----------+
-- | team_name | matches_played | points | goal_for | goal_against | goal_diff |
-- +-----------+----------------+--------+----------+--------------+-----------+
-- | Dortmund  | 2              | 6      | 6        | 2            | 4         |
-- | Arsenal   | 2              | 2      | 3        | 3            | 0         |
-- | Ajax      | 4              | 2      | 5        | 9            | -4        |
-- +-----------+----------------+--------+----------+--------------+-----------+

-- Ajax (team_id=1) played 4 matches: 2 losses and 2 draws. Total points = 0 + 0 + 1 + 1 = 2.
-- Dortmund (team_id=4) played 2 matches: 2 wins. Total points = 3 + 3 = 6.
-- Arsenal (team_id=6) played 2 matches: 2 draws. Total points = 1 + 1 = 2.
-- Dortmund is the first team in the table. Ajax and Arsenal have the same points, but since Arsenal has a higher goal_diff than Ajax, Arsenal comes before Ajax in the table.


create table teams(team_id int,team_name varchar(10));
create table matches(home_team_id int,away_team_id int,home_team_goals int,away_team_goals int);

insert into teams values(1,'Ajax'); 
insert into teams values(4,'Dortmund');
insert into teams values(6,'Arsenal'); 

insert into matches values(1,4,0,1);
insert into matches values(1,6,3,3);
insert into matches values(4,1,5,2);
insert into matches values(6,1,0,0);

select * from teams;
select * from matches;

WITH cte AS (
  (
    SELECT 
      home_team_id AS team_id,
      COUNT(*) as matches_played,
      SUM(CASE WHEN home_team_goals > away_team_goals THEN 3
           WHEN home_team_goals = away_team_goals THEN 0
           ELSE 0 
      END) AS points,
      SUM(home_team_goals) AS goals_for,
      SUM(away_team_goals) AS goals_against,
      SUM(home_team_goals) - SUM(away_team_goals) AS goal_diff
    FROM matches m
    GROUP BY home_team_id
  )
  
  UNION ALL
  
  (
    SELECT 
      away_team_id AS team_id,
      COUNT(*) as matches_played,
      SUM(CASE WHEN home_team_goals < away_team_goals THEN 3
           WHEN home_team_goals = away_team_goals THEN 0
           ELSE 0 
      END) AS points,
      SUM(away_team_goals) AS goals_for,
      SUM(home_team_goals) AS goals_against,
      SUM(away_team_goals) - SUM(home_team_goals) AS goal_diff
    FROM matches m
    GROUP BY away_team_id
  )
)
SELECT 
  t.team_name,
  SUM(matches_played) matches_played,
  SUM(points) points,
  SUM(goals_for) goal_for,
  SUM(goals_against) goal_against,
  SUM(goal_diff) goal_diff
FROM cte c
LEFT JOIN teams t
ON c.team_id=t.team_id 
GROUP BY t.team_name
ORDER BY points DESC, goal_diff DESC, t.team_name
;










