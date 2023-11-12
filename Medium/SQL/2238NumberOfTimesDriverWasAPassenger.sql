-- Table: Rides

-- +--------------+------+
-- | Column Name  | Type |
-- +--------------+------+
-- | ride_id      | int  |
-- | driver_id    | int  |
-- | passenger_id | int  |
-- +--------------+------+
-- ride_id is the primary key for this table.
-- Each row of this table contains the ID of the driver and the ID of the passenger that rode in ride_id.
-- Note that driver_id != passenger_id.
 
-- Write an SQL query to report the ID of each driver and the number of times they were a passenger.
-- Return the result table in any order.
-- The query result format is in the following example.

-- Example 1:

-- Input: 
-- Rides table:
-- +---------+-----------+--------------+
-- | ride_id | driver_id | passenger_id |
-- +---------+-----------+--------------+
-- | 1       | 7         | 1            |
-- | 2       | 7         | 2            |
-- | 3       | 11        | 1            |
-- | 4       | 11        | 7            |
-- | 5       | 11        | 7            |
-- | 6       | 11        | 3            |
-- +---------+-----------+--------------+
-- Output: 
-- +-----------+-----+
-- | driver_id | cnt |
-- +-----------+-----+
-- | 7         | 2   |
-- | 11        | 0   |
-- +-----------+-----+
-- Explanation: 
-- There are two drivers in all the given rides: 7 and 11.
-- The driver with ID = 7 was a passenger two times.
-- The driver with ID = 11 was never a passenger.

create table rides(ride_id int,driver_id int,passenger_id int);

insert into rides values(1,7,1);
insert into rides values(2,7,2);
insert into rides values(3,11,1);
insert into rides values(4,11,7);
insert into rides values(5,11,7);
insert into rides values(6,11,3);

select * from rides;

WITH cte AS(
  SELECT DISTINCT driver_id FROM rides
)
SELECT
  cte.driver_id,
  COUNT(passenger_id) AS cnt
FROM cte LEFT JOIN rides
ON cte.driver_id=rides.passenger_id
GROUP BY driver_id;


