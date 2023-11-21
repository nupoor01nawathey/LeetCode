-- Table Person:
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | id             | int     |
-- | name           | varchar |
-- | phone_number   | varchar |
-- +----------------+---------+
-- id is the primary key for this table.
-- Each row of this table contains the name of a person and their phone number.
-- Phone number will be in the form 'xxx-yyyyyyy' where xxx is the country code (3 characters) and yyyyyyy is the phone number (7 characters) where x and y are digits. Both can contain leading zeros.

-- Table Country:
-- +----------------+---------+
-- | Column Name    | Type    |
-- +----------------+---------+
-- | name           | varchar |
-- | country_code   | varchar |
-- +----------------+---------+
-- country_code is the primary key for this table.
-- Each row of this table contains the country name and its code. country_code will be in the form 'xxx' where x is digits.


-- Table Calls:
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | caller_id   | int  |
-- | callee_id   | int  |
-- | duration    | int  |
-- +-------------+------+
-- There is no primary key for this table, it may contain duplicates.
-- Each row of this table contains the caller id, callee id and the duration of the call in minutes. caller_id != callee_id


-- A telecommunications company wants to invest in new countries.
-- The country intends to invest in the countries
-- where the average call duration of the calls in this country is strictly greater than the global average call duration.

-- Write an SQL query to find the countries where this company can invest.

-- Return the result table in any order.

-- The query result format is in the following example.

-- Person table:
-- +----+----------+--------------+
-- | id | name     | phone_number |
-- +----+----------+--------------+
-- | 3  | Jonathan | 051-1234567  |
-- | 12 | Elvis    | 051-7654321  |
-- | 1  | Moncef   | 212-1234567  |
-- | 2  | Maroua   | 212-6523651  |
-- | 7  | Meir     | 972-1234567  |
-- | 9  | Rachel   | 972-0011100  |
-- +----+----------+--------------+

-- Country table:
-- +----------+--------------+
-- | name     | country_code |
-- +----------+--------------+
-- | Peru     | 051          |
-- | Israel   | 972          |
-- | Morocco  | 212          |
-- | Germany  | 049          |
-- | Ethiopia | 251          |
-- +----------+--------------+

-- Calls table:
-- +-----------+-----------+----------+
-- | caller_id | callee_id | duration |
-- +-----------+-----------+----------+
-- | 1         | 9         | 33       |
-- | 2         | 9         | 4        |
-- | 1         | 2         | 59       |
-- | 3         | 12        | 102      |
-- | 3         | 12        | 330      |
-- | 12        | 3         | 5        |
-- | 7         | 9         | 13       |
-- | 7         | 1         | 3        |
-- | 9         | 7         | 1        |
-- | 1         | 7         | 7        |
-- +-----------+-----------+----------+

-- Result table:
-- +----------+
-- | country  |
-- +----------+
-- | Peru     |
-- +----------+
-- The average call duration for Peru is (102 + 102 + 330 + 330 + 5 + 5) / 6 = 145.666667
-- The average call duration for Israel is (33 + 4 + 13 + 13 + 3 + 1 + 1 + 7) / 8 = 9.37500
-- The average call duration for Morocco is (33 + 4 + 59 + 59 + 3 + 7) / 6 = 27.5000
-- Global call duration average = (2 * (33 + 3 + 59 + 102 + 330 + 5 + 13 + 3 + 1 + 7)) / 20 = 55.70000
-- Since Peru is the only country where average call duration is greater than the global average, it's the only recommended country.

create table person(id int, name varchar(15), phone_number varchar(20));
create table country(name varchar(15) , country_code varchar(20));
create table calls(caller_id int, callee_id int, duration int);

insert into person values(3,'Jonathan','051-1234567');
insert into person values(12,'Elvis','051-7654321');
insert into person values(1,'Moncef','212-1234567');
insert into person values(2,'Maroua','212-6523651');
insert into person values(7,'Meir','972-1234567');
insert into person values(9,'Rachel','972-0011100');

insert into country values('Peru','051');
insert into country values('Israel','972');
insert into country values('Morocco','212');
insert into country values('Germany','049');
insert into country values('Ethiopia','251');

insert into calls values(1,9,33);  
insert into calls values(2,9,4);
insert into calls values(1,2,59);  
insert into calls values(3,12,102); 
insert into calls values(3,12,330); 
insert into calls values(12,3,5);   
insert into calls values(7,9,13);  
insert into calls values(7,1,3);   
insert into calls values(9,7,1);   
insert into calls values(1,7,7);   

-- select * from person;
-- select * from country;
-- select * from calls;


SELECT 
  c.name AS country
FROM Person p
LEFT JOIN country c
ON SUBSTRING(p.phone_number,1,3)=c.country_code 
LEFT JOIN calls ca 
ON p.id IN(ca.caller_id, ca.callee_id)
GROUP BY c.name
HAVING AVG(ca.duration) > (SELECT AVG(duration) FROM calls)
;








