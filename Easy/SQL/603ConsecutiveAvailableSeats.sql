-- Question 37
-- Several friends at a cinema ticket office would like to reserve 
-- consecutive available seats.
-- Can you help to query all the consecutive available seats order by the seat_id 
-- using the following cinema table?
-- | seat_id | free |
-- |---------|------|
-- | 1       | 1    |
-- | 2       | 0    |
-- | 3       | 1    |
-- | 4       | 1    |
-- | 5       | 1    |
 

-- Your query should return the following result for the sample case above.
 

-- | seat_id |
-- |---------|
-- | 3       |
-- | 4       |
-- | 5       |
-- Note:
-- The seat_id is an auto increment int, and free is bool ('1' means free, and '0' means occupied.).
-- Consecutive available seats are more than 2(inclusive) seats consecutively available.

create table cinema(seat_id int, free bool);

insert into cinema values(1,1);
insert into cinema values(2,0);
insert into cinema values(3,1);
insert into cinema values(4,1);
insert into cinema values(5,1);

select * from cinema;

SELECT
  DISTINCT t1.seat_id
FROM cinema t1, cinema t2 
WHERE 
  t1.free=1 AND t2.free=1 AND (t1.seat_id=t2.seat_id+1 OR t1.seat_id=t2.seat_id-1)
ORDER BY seat_id;







