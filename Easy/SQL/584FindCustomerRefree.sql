-- Given a table customer holding customers information and the referee.

-- +------+------+-----------+
-- | id   | name | referee_id|
-- +------+------+-----------+
-- |    1 | Will |      NULL |
-- |    2 | Jane |      NULL |
-- |    3 | Alex |         2 |
-- |    4 | Bill |      NULL |
-- |    5 | Zack |         1 |
-- |    6 | Mark |         2 |
-- +------+------+-----------+
-- Write a query to return the list of customers NOT referred by the person with id '2'.

-- For the sample data above, the result is:

-- +------+
-- | name |
-- +------+
-- | Will |
-- | Jane |
-- | Bill |
-- | Zack |
-- +------+

create table refree(id int, name varchar(10), referee_id int);

insert into refree values(1,'Will',NULL);
insert into refree values(2,'Jane',NULL);
insert into refree values(3,'Alex',2);
insert into refree values(4,'Bill',NULL);
insert into refree values(5,'Zack',1);
insert into refree values(6,'Mark',2);

select * from refree;

SELECT
  name
FROM refree
WHERE referee_id <> 2 OR referee_id IS NULL;

