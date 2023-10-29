-- X city opened a new cinema, many people would like to go to this cinema.
-- The cinema also gives out a poster indicating the movies’ ratings and descriptions.
-- Please write a SQL query to output movies with an odd numbered ID and a description that is not 'boring'.
-- Order the result by rating.
 

-- For example, table cinema:

-- +---------+-----------+--------------+-----------+
-- |   id    | movie     |  description |  rating   |
-- +---------+-----------+--------------+-----------+
-- |   1     | War       |   great 3D   |   8.9     |
-- |   2     | Science   |   fiction    |   8.5     |
-- |   3     | irish     |   boring     |   6.2     |
-- |   4     | Ice song  |   Fantacy    |   8.6     |
-- |   5     | House card|   Interesting|   9.1     |
-- +---------+-----------+--------------+-----------+
-- For the example above, the output should be:
-- +---------+-----------+--------------+-----------+
-- |   id    | movie     |  description |  rating   |
-- +---------+-----------+--------------+-----------+
-- |   5     | House card|   Interesting|   9.1     |
-- |   1     | War       |   great 3D   |   8.9     |
-- +---------+-----------+--------------+-----------+

create table cinema(id int, movie varchar(15), description varchar(15), rating float);

insert into cinema values(1,'War','great 3D',8.9);
insert into cinema values(2,'Science','fiction',8.5);
insert into cinema values(3,'irish','boring',6.2);
insert into cinema values(4,'Ice song','Fantacy',8.6);
insert into cinema values(5,'House card','Interesting',9.1);

select * from cinema;

SELECT * FROM cinema
WHERE id%2 != 0
AND description <> 'boring'
ORDER BY rating DESC;
  












