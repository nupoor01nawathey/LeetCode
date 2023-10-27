-- Question7
-- There is a table courses with columns: student and class

-- Please list out all classes which have more than or equal to 5 students.

-- For example, the table:

-- +---------+------------+
-- | student | class      |
-- +---------+------------+
-- | A       | Math       |
-- | B       | English    |
-- | C       | Math       |
-- | D       | Biology    |
-- | E       | Math       |
-- | F       | Computer   |
-- | G       | Math       |
-- | H       | Math       |
-- | I       | Math       |
-- +---------+------------+

create table courses(student text, class text);

insert into courses values('A','Math');   
insert into courses values('B','English');
insert into courses values('C','Math');
insert into courses values('D','Biology'); 
insert into courses values('E','Math');
insert into courses values('F','Computer');
insert into courses values('G','Math');
insert into courses values('H','Math');  
insert into courses values('I','Math');  

select * from courses;


SELECT 
  class
FROM courses
GROUP BY class
HAVING COUNT(student)>=5;




