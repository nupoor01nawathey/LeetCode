-- Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.

-- Return the result table in any order.

-- The query result format is in the following example.

 

-- TVProgram table:
-- +--------------------+--------------+-------------+
-- | program_date       | content_id   | channel     |
-- +--------------------+--------------+-------------+
-- | 2020-06-10 08:00   | 1            | LC-Channel  |
-- | 2020-05-11 12:00   | 2            | LC-Channel  |
-- | 2020-05-12 12:00   | 3            | LC-Channel  |
-- | 2020-05-13 14:00   | 4            | Disney Ch   |
-- | 2020-06-18 14:00   | 4            | Disney Ch   |
-- | 2020-07-15 16:00   | 5            | Disney Ch   |
-- +--------------------+--------------+-------------+

-- Content table:
-- +------------+----------------+---------------+---------------+
-- | content_id | title          | Kids_content  | content_type  |
-- +------------+----------------+---------------+---------------+
-- | 1          | Leetcode Movie | N             | Movies        |
-- | 2          | Alg. for Kids  | Y             | Series        |
-- | 3          | Database Sols  | N             | Series        |
-- | 4          | Aladdin        | Y             | Movies        |
-- | 5          | Cinderella     | Y             | Movies        |
-- +------------+----------------+---------------+---------------+

-- Result table:
-- +--------------+
-- | title        |
-- +--------------+
-- | Aladdin      |
-- +--------------+
-- "Leetcode Movie" is not a content for kids.
-- "Alg. for Kids" is not a movie.
-- "Database Sols" is not a movie
-- "Alladin" is a movie, content for kids and was streamed in June 2020.
-- "Cinderella" was not streamed in June 2020.

create table tv_program(program_date datetime, content_id int, channel varchar(20));

create table content(content_id int,title text,kids_content varchar(1),content_type varchar(10));

insert into tv_program values('2020-06-10 08:00',1,'LC-Channel');
insert into tv_program values('2020-05-11 12:00',2,'LC-Channel');
insert into tv_program values('2020-05-12 12:00',3,'LC-Channel');
insert into tv_program values('2020-05-13 14:00',4,'Disney Ch');
insert into tv_program values('2020-06-18 14:00',4,'Disney Ch');
insert into tv_program values('2020-07-15 16:00',5,'Disney Ch');

insert into content values(1,'Leetcode Movie','N','Movies');
insert into content values(2,'Alg. for Kids','Y','Series');
insert into content values(3,'Database Sols','N','Series');
insert into content values(4,'Aladdin','Y','Movies');
insert into content values(5,'Cinderella','Y','Movies');

select * from tv_program;
select * from content;


SELECT
  distinct title
FROM content c JOIN tv_program t
ON c.content_id=t.content_id
WHERE kids_content='Y' AND content_type='Movies'
AND MONTH(program_date)=6;


