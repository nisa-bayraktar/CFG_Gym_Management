create database GYM;
use GYM;

-- CORE REQUIREMENTS

-- 1) Creating the DB 
-- 2) Adding foreign/primary keys
 create table payment_type(
`payment_type` VARCHAR(45) NOT NULL,
`payment_method` VARCHAR(45) NOT NULL,
`processing_time` VARCHAR(45) NOT NULL,
CONSTRAINT pk_payment_type PRIMARY KEY (payment_type));
INSERT into payment_type (payment_type,payment_method, processing_time)
VALUES ('Daily','Instore Payment','0-24 hours'),
 ('Weekly','Direct Debit', '1-2 working days'),
 ('Monthly','Direct Debit', '1-3 working days'),
 ('Yearly','Direct Debit', '3-5 working days');
 select * from payment_type;
 
 create table location(
`location` VARCHAR(100) NOT NULL,
`address` VARCHAR(100) NOT NULL,
`number_of_instructors`INT NOT NULL,
CONSTRAINT pk_location PRIMARY KEY (location));
INSERT into location (location, address, number_of_instructors) 
VALUES ('London', '244 Baker Street',6),
('Liverpool', '33 Church Street', 4),
('Ormskirk', '78 Asmall Lane', '3');
select *from location;

create table membership_type(
`membership_typeID` INT NOT NULL,
`membership_name` VARCHAR(45) NOT NULL,
`access_time` VARCHAR(45) NOT NULL,
`location_available` VARCHAR(45) NOT NULL,
`payment_type` VARCHAR(45) NOT NULL,
`minimum_legth` VARCHAR(100),
`price` INT NOT NULL,
CONSTRAINT pk_membership_type_id PRIMARY KEY(membership_typeID),
CONSTRAINT fk_payment_type FOREIGN KEY(payment_type) REFERENCES payment_type(payment_type));
INSERT into membership_type (membership_typeID,membership_name,access_time,location_available,payment_type,minimum_legth, price) 
VALUES (1,'STUDENT','9:30-18:30','London, Liverpool, Ormskirk','Monthly','3 months', 20), 
(2,'REDUCED','9:30-18:30','London, Liverpool, Ormskirk','Yearly','12 months', 280), 
(3,'FULL','8:00-21:00','London, Liverpool, Ormskirk','Weekly',NULL,10), 
(4,'UNLIMITED','24/7','London','Monthly',NULL, 60), 
(5,'PAY AS YOU GO','8:00-21:00','Liverpool, Ormskirk','Daily',NULL, 7),
(6,'PAY AS YOU GO','8:00-21:00','London','Daily',NULL, 9); 
select * from membership_type;
 
create table members(
`memberID` INT NOT NULL,
`firstname` VARCHAR(45) NOT NULL,
`lastname` VARCHAR(45) NOT NULL,
`gender` VARCHAR(45) NOT NULL,
`address` VARCHAR(100) NULL,
`location` VARCHAR(100) NOT NULL,
`dateofbirth` DATE NOT NULL,
`membership_typeID` INT NULL,
`activity`VARCHAR(45) NOT NULL,
CONSTRAINT pk_member_id PRIMARY KEY(memberID),
CONSTRAINT fk_membership_type_id FOREIGN KEY (membership_typeID) REFERENCES membership_type(membership_typeID),
CONSTRAINT fk_location FOREIGN KEY (location) REFERENCES location(location));
INSERT into members (memberID,firstname,lastname,gender,address,location,dateofbirth, membership_typeID, activity) 
VALUES (1245,'Julie','Jones','female','3 Edgley Drive', 'Ormskirk','1985-10-20', 2, 'active'), 
(1246,'Jeremiah','Jones','male','3 Edgley Drive', 'Ormskirk','1989-07-07', 2, 'active'), 
(1247,'Elise','Jones','female','12 Brick Lane', 'London','1999-11-21',  1, 'active'),
(1248,'Claire','Jones','female','6 Oxford Street', 'London','1975-03-10',  4, 'active'),
(1249,'Amy','Johnson','female','4 Summer Street', 'Ormskirk','1997-01-01',  3, 'active'),
(1250,'Amy','Martin','female','80 Baker Street', 'London','2004-04-24',  1, 'active'),
(1251,'Andrew','Martin','female','100 Baker Street', 'London','2000-06-22', 1, 'active'),
(1252,'Andrew','Morgan','female','22 Baker Street', 'London','2003-07-23', 1, 'active'),
(1253,'John','Clark','female','24 Baker Street', 'London','2004-08-25',  1, 'active'),
(1254,'Ernest','Turner','female','55 Baker Street', 'London','2003-09-26', 1, 'active'),
(1255,'Johnnatan','Clark','female','99 Oxford Street', 'London','2004-10-07',  1, 'active'),
(1256,'Summer','Carter','female','8 Downing Street', 'London','2005-03-05',  6, 'active'),
(1257,'Amy','Harris','female','144 Downing Street','London','1999-11-04', 3, 'inactive'),
(1258,'John','James','male','7 Ash Close','Ormskirk','1999-06-27',  4, 'active'),
(1259,'Paul','Ashton','male','153 Church Street','Liverpool','1994-01-26',  5, 'active'),
(1260,'Oliver','Smith','male','155 Bold Street','Liverpool','1994-02-06',  2, 'active'),
(1261,'Jack','Morgan','male','13 Lime Street','Liverpool','1978-03-03',  3, 'active'),
(1262,'George','Strode','male','22 Lime Street Street','Liverpool','1999-04-24',  3, 'inactive'),
(1263,'James','Morgan','male','42 Clayton Square','Liverpool','1995-07-11',  1, 'inactive'),
(1264,'James','Habib','male','48 Clayton Square','Liverpool','1985-04-25', 5, 'active'),
(1265,'June','Williams','female','15 Lark Lane','Liverpool','1966-11-22',  5, 'active'),
(1266,'Louise','Roberts','non-binary','15 Lark Lane','Liverpool','1965-04-21',  1, 'active'),
(1267,'Tanvi','Chopra','female','133 Church Street','Liverpool','1965-04-21', 2, 'active'),
(1268,'Ruth','Chauhan','female','87 Falkner Street','Liverpool','1965-04-21',  2, 'active'),
(1269,'Raabiah','Ali','female','11 Ash Close','Ormskirk','2000-10-26',  1, 'active'),
(1270,'Michael','Smith','male','44 Asmall Close','Ormskirk','2006-06-06',  2, 'active'),
(1271,'Sandra','Gonzalez','female','13 Edgley Drive','Ormskirk','2003-03-23',  3, 'active'),
(1272,'Meredith','Johnson','female','39 Asmall Close','Ormskirk','1992-12-12',  2, 'active'),
(1273,'Sarah','Wright','femalTablese','1 Altys Lane', 'Ormskirk','1993-08-05',  5, 'active'),
(1274,'Owen','Tayor','male','2 Altys Lane', 'Ormskirk','1997-06-03',  5, 'active'),
(1275,'Carl','Taylor','male','3 Ashcroft Avenue','Ormskirk','1987-03-21',  1, 'active'),
(1276,'Raj','Gupta','male','8 Ashcroft Avenue', 'Ormskirk','1956-05-06',  1, 'active'),
(1277,'Raj','Sharma','male','8 Lark Lane', 'Liverpool','1988-05-06',  2, 'active'),
(1278,'Sim Ray','Yue','male','12 Ashcroft Avenue', 'Ormskirk','1997-04-22',  3, 'active'),
(1279,'Frank','Wright','male','4 Abbotsford Mews', 'Ormskirk','1986-07-16',  4, 'active'),
(1280,'Matthew','Blogs','non-binary', '7 Brick Lane', 'London','1995-10-22',  4, 'active');
select * from members;


create table instructors(
`instructorID` INT NOT NULL,
`fistname` VARCHAR(45) NOT NULL,
`lastname` VARCHAR(45) NOT NULL,
`location` VARCHAR(45) NOT NULL,
`work_type` VARCHAR(45) NOT NULL,
`work_hours` VARCHAR(45) NOT NULL,
`classes` VARCHAR(45) NOT NULL,
`work_days` VARCHAR(45) NOT NULL,
`salary` INT NOT NULL,
CONSTRAINT pk_instructor_id PRIMARY KEY(instructorID),
CONSTRAINT fk_instuctor_location FOREIGN KEY (location) REFERENCES location(location));
INSERT into instructors (instructorID,fistname, lastname, location, work_type, work_hours,classes, work_days,salary) 
VALUES (123,'Amelia','Clark','London','full time', '9:30-18:30','Zumba, pilates, yoga, aerobics', 'Mon-Fri', 30000),
(124,'Clara','Salvador','London','part time', '12:00-18:30','HIIT, yoga, aerobics', 'Wed-Fri', 15000),
(125,'Chris','Lee','London','full time', '9:00-18:30','HIIT, boxing, kickboxing', 'Fri-Mon', 20000),
(126,'John','Morgan','Liverpool','full time', '9:30-18:30','Zumba, pilates, yoga, aerobics', 'Mon-Fri', 25000),
(127,'Oliver','John','London','full time', '8:30-17:30','Boxing, kickboxing, HIIT', 'Mon-Fri', 30000),
(128,'Elle','Moore','Liverpool','part time', '14:30-16:30','Aquafitness', 'Mon', 1800),
(129,'Amy','Harris','Ormskirk','part time', '14:30-16:30','Aquafitness', 'Wed', 1800),
(130,'Alice','Moore','Liverpool','part time', '10:30-12:30','Aquafitness', 'Sat', 1800),
(131,'Raj','Chopra','Liverpool','full time', '9:30-18:30','Yoga', 'Tue-Sat', 20000),
(132,'Ying','Yue','Ormskirk','full time', '9:30-18:30','Spinning, pole dance, zumba, ', 'Mon-Fri', 26000),
(133,'Pilar','Cantos','London','full time', '9:00-18:00','Spinning, latin dance', 'Mon-Fri', 28000),
(134,'Matt','Jones','Ormskirk','full time', '9:30-18:30','Zumba, pilates, yoga, aerobics', 'Mon-Fri', 20000),
(135,'Takeshi','Takayama','London','part time', '9:30-11:30','Karate', 'Sun', 2000);
select* from instructors;

create table workout_type(
`workout_name`VARCHAR(45) NOT NULL,
`instructorID` INT NOT NULL,
`location` VARCHAR(45) NOT NULL,
`available_days` VARCHAR(45) NOT NULL,
`students_enrolled` INT NOT NULL,
CONSTRAINT fk_instructor FOREIGN KEY (instructorID) REFERENCES instructors(instructorID));
INSERT into workout_type (workout_name,instructorID,location,available_days,students_enrolled)
VALUES ('Zumba',123,'London', 'Mon-Fri', 12),
('Zumba',126,'Liverpool', 'Mon-Fri', 12),
('Zumba',134,'Ormskirk', 'Mon-Fri', 12),
('Zumba',132,'Ormskirk', 'Mon-Fri', 12),
('Pilates',126,'Liverpool', 'Mon-Fri', 5),
('Pilates',123,'London', 'Mon-Fri', 5),
('Pilates',134,'Ormskirk', 'Mon-Fri', 5),
('Yoga',123,'London', 'Mon-Sat', 23),
('Yoga',126,'Liverpool', 'Mon-Sat', 23),
('Yoga',124,'London', 'Mon-Sat', 23),
('Yoga',134,'Ormskirk', 'Mon-Sat', 23),
('Yoga',131,'Liverpool', 'Mon-Sat', 23),
('Aerobics',123,'London', 'Mon-Fri', 13),
('Aerobics',126,'Liverpool', 'Mon-Fri', 13),
('Aerobics',134,'Ormskirk', 'Mon-Fri', 13),
('Aerobics',124,'London', 'Mon-Fri', 13),
('Aquafitness',129,'Ormskirk', 'Wed', 5),
('Aquafitness',128,'Liverpool', 'Mon', 5),
('Aquafitness',130,'Liverpool', 'Sat', 5),
('HIIT',124,'London', 'Mon-Fri', 4),
('HIIT',127,'London', 'Mon-Fri', 4),
('Boxing',127,'London', 'Mon-Fri', 6),
('Boxing',125,'London', 'Mon-Fri', 6),
('Kickboxing',125,'London', 'Mon-Fri', '3'),
('Kickboxing',127,'London', 'Mon-Fri', '3'),
('Spinning',133,'London', 'Mon-Fri', '3'),
('Spinning',132,'Ormskirk', 'Mon-Fri', '3'),
('Latin dance',133,'London', 'Mon-Fri', '11'),
('Pole dance',132,'Ormskirk', 'Mon-Fri', '3'),
('Karate',135,'London', 'Sun', '5');
select * from workout_type;
 
 
 create table events_table(
`event_name` VARCHAR(45) NOT NULL,
`event_date` VARCHAR(45) NOT NULL,
`location` VARCHAR(100) NOT NULL,
`number_members_admitted` INT NOT NULL,
CONSTRAINT fk_location_events FOREIGN KEY (location) REFERENCES location(location));
INSERT into events_table (event_name, event_date, location, number_members_admitted) 
VALUES ('Christmas class1', '24/12', 'Ormskirk', '20'),
('Christmas class1', '24/12', 'London', '20'),
('Christmas class1', '24/12', 'Liverpool', '20'),
 ('Christmas secret santa', '27/12', 'London','50'),
 ('Get fit this new year PT session', '01/01','Liverpool', '20'),
 ('Get fit this new year PT session', '01/01','Ormskirk', '20'),
 ('Get fit this new year PT session', '01/01','London', '20'),
 ('Spring PT session', '04/04', 'Ormskirk', '5'),
 ('Spring PT session', '04/04', 'Liverpool', '5'),
 ('Spring PT session', '04/04', 'London', '5'),
 ('Automn PT session', '10/10', 'London', '5'),
 ('Automn PT session', '10/10', 'Liverpool', '5'),
 ('Automn PT session', '10/10', 'Ormskirk', '5'),
 ('Outdoor running','02/01', 'Liverpool', '50'),
 ('Outdoor running','02/02', 'Liverpool', '50'),
 ('Outdoor running','02/03', 'Liverpool', '50'),
 ('Outdoor running','02/04', 'Liverpool', '50'),
 ('Outdoor running','02/05', 'Liverpool', '50'),
 ('Outdoor running','02/06', 'Liverpool', '50'),
 ('Outdoor running','02/07', 'Liverpool', '50'),
 ('Outdoor running','02/08', 'Liverpool', '50'),
 ('Outdoor running','02/09', 'Liverpool', '50'),
 ('Outdoor running','02/10', 'Liverpool', '50'),
 ('Outdoor running','02/11', 'Liverpool', '50'),
 ('Outdoor running','02/12', 'Liverpool', '50'),
 ('Outdoor running','04/01', 'London', '50'),
 ('Outdoor running','14/01', 'London', '50'),
 ('Outdoor running','04/02', 'London', '50'),
 ('Outdoor running','14/02', 'London', '50'),
 ('Outdoor running','04/03', 'London', '50'),
 ('Outdoor running','14/03', 'London', '50'),
 ('Outdoor running','04/04', 'London', '50'),
 ('Outdoor running','14/04', 'London', '50'),
 ('Outdoor running','04/05', 'London', '50'),
 ('Outdoor running','14/05', 'London', '50'),
 ('Outdoor running','04/06', 'London', '50'),
 ('Outdoor running','14/06', 'London', '50'),
 ('Outdoor running','04/07', 'London', '50'),
 ('Outdoor running','14/07', 'London', '50'),
 ('Outdoor running','04/08', 'London', '50'),
 ('Outdoor running','14/08', 'London', '50'),
 ('Outdoor running','04/09', 'London', '50'),
 ('Outdoor running','14/09', 'London', '50'),
 ('Outdoor running','04/10', 'London', '50'),
 ('Outdoor running','14/10', 'London', '50'),
 ('Outdoor running','04/11', 'London', '50'),
 ('Outdoor running','14/11', 'London', '50'),
 ('Outdoor running','04/12', 'London', '50'),
 ('Outdoor running','14/12', 'London', '50'),
 ('Outdoor climbing trip','16/08', 'London', '12'),
 ('Outdoor climbing trip','16/08', 'Liverpool', '12'),
 ('Outdoor climbing trip','16/08', 'Ormskirk', '12'),
 ('Outdoor climbing trip','28/08', 'London', '12'),
 ('Outdoor climbing trip','28/08', 'Liverpool', '12'),
 ('Outdoor climbing trip','28/08', 'Ormskirk', '12'),
 ('Stretching class','20/09', 'Liverpool', '8'),
 ('First aid training','12/07', 'London', '20'),
 ('First aid training','12/07', 'Liverpool', '20'),
 ('First aid training','12/07', 'Ormskirk', '20');
select * from events_table;

create table gym_schedule(
`day`  VARCHAR(100) NOT NULL,
`time` VARCHAR(100) NOT NULL,
`class` VARCHAR(100) NOT NULL,
`location`VARCHAR(100) NOT NULL,
CONSTRAINT fk_location_gym FOREIGN KEY (location) REFERENCES location(location));
INSERT into gym_schedule (day, time, class, location) 
VALUES ('Monday', '9:30-11:30','Boxing','London'),
('Monday', '9:30-11:30','Spinning','London'),
('Monday', '11:30-13:30','Zumba','London'),
('Monday', '11:30-13:30','Pilates','London'),
('Monday', '13:30-15:30','Yoga','London'),
('Monday', '15:30-17:30','Aerobics','London'),
('Monday', '15:30-17:30',' HIIT','London'),
('Tuesday', '9:30-11:30','Latin Dance','London'),
('Tuesday', '9:30-11:30','kickboxing','London'),
('Tuesday', '11:30-13:30','Pilates','London'),
('Tuesday', '11:30-13:30','Zumba','London'),
('Tuesday', '13:30-15:30','Yoga','London'),
('Tuesday', '15:30-17:30','HIIT','London'),
('Tuesday', '15:30-17:30','Aerobics','London'),
('Wednesday', '9:30-11:30','Spinning','London'),
('Wednesday', '9:30-11:30','Boxing','London'),
('Wednesday', '11:30-13:30','Zumba','London'),
('Wednesday', '11:30-13:30','Pilates','London'),
('Wednesday', '13:30-15:30','Yoga','London'),
('Wednesday', '15:30-17:30','Aerobics','London'),
('Wednesday', '15:30-17:30','HIIT','London'),
('Tuesday', '9:30-11:30','kickboxing','London'),
('Tuesday', '9:30-11:30','Latin Dance','London'),
('Thursday', '11:30-13:30','Pilates','London'),
('Thursday', '11:30-13:30','Zumba','London'),
('Thursday', '13:30-15:30','Yoga','London'),
('Thursday', '15:30-17:30','HIIT','London'),
('Thursday', '15:30-17:30','Aerobics','London'),
('Friday', '9:30-11:30','Spinning','London'),
('Friday', '9:30-11:30','Boxing','London'),
('Friday', '11:30-13:30','Zumba','London'),
('Friday', '11:30-13:30','Pilates','London'),
('Friday', '13:30-15:30','Yoga','London'),
('Friday', '15:30-17:30','Aerobics','London'),
('Friday', '15:30-17:30','HIIT','London'),
('Sunday', '09:30-11:30','Karate','London'),
('Monday', '9:30-11:30','Pilates','Liverpool'),
('Monday', '11:30-13:30','Zumba','Liverpool'),
('Monday', '13:30-15:30','Yoga','Liverpool'),
('Monday', '14:30-16:30','Aquafitness','Liverpool'),
('Monday', '15:30-17:30','Aerobics','Liverpool'),
('Tuesday', '9:30-11:30','Pilates','Liverpool'),
('Tuesday', '11:30-13:30','Zumba','Liverpool'),
('Tuesday', '13:30-15:30','Yoga','Liverpool'),
('Tuesday', '15:30-17:30','Aerobics','Liverpool'),
('Wednesday', '9:30-11:30','Pilates','Liverpool'),
('Wednesday', '11:30-13:30','Zumba','Liverpool'),
('Wednesday', '13:30-15:30','Yoga','Liverpool'),
('Wednesday', '15:30-17:30','Aerobics','Liverpool'),
('Thursday', '9:30-11:30','Pilates','Liverpool'),
('Thursday', '11:30-13:30','Zumba','Liverpool'),
('Thursday', '13:30-15:30','Yoga','Liverpool'),
('Thursday', '15:30-17:30','Aerobics','Liverpool'),
('Friday', '9:30-11:30','Pilates','Liverpool'),
('Friday', '11:30-13:30','Zumba','Liverpool'),
('Friday', '13:30-15:30','Yoga','Liverpool'),
('Friday', '15:30-17:30','Aerobics','Liverpool'),
('Saturday', '10:30-12:30','Aquafitness','Liverpool'),
('Monday', '9:30-11:30','Pilates','Ormskirk'),
('Monday', '11:30-13:30','Zumba','Ormskirk'),
('Monday', '11:30-13:30','Spinning','Ormskirk'),
('Monday', '13:30-15:30','Yoga','Ormskirk'),
('Monday', '15:30-17:30','Aerobics','Ormskirk'),
('Monday', '15:30-17:30','Pole dancing','Ormskirk'),
('Tuesday', '9:30-11:30','Pilates','Ormskirk'),
('Tuesday', '11:30-13:30','Zumba','Ormskirk'),
('Tuesday', '11:30-13:30','Spinning','Ormskirk'),
('Tuesday', '13:30-15:30','Yoga','Ormskirk'),
('Tuesday', '15:30-17:30','Aerobics','Ormskirk'),
('Tuesday', '15:30-17:30','Pole dancing','Ormskirk'),
('Wednesday', '9:30-11:30','Pilates','Ormskirk'),
('Wednesday', '11:30-13:30','Zumba','Ormskirk'),
('Wednesday', '11:30-13:30','Spinning','Ormskirk'),
('Wednesday', '13:30-15:30','Yoga','Ormskirk'),
('Wednesday', '14:30-16:30','Yoga','Ormskirk'),
('Wednesday', '15:30-17:30','Aerobics','Ormskirk'),
('Wednesday', '15:30-17:30','Pole dancing','Ormskirk'),
('Thursday', '9:30-11:30','Pilates','Ormskirk'),
('Thursday', '11:30-13:30','Zumba','Ormskirk'),
('Thursday', '11:30-13:30','Spinning','Ormskirk'),
('Thursday', '13:30-15:30','Yoga','Ormskirk'),
('Thursday', '13:30-15:30','Pole dancing','Ormskirk'),
('Thursday', '15:30-17:30','Aerobics','Ormskirk'),
('Friday', '9:30-11:30','Pilates','Ormskirk'),
('Friday', '11:30-13:30','Zumba','Ormskirk'),
('Friday', '11:30-13:30','Spinning','Ormskirk'),
('Friday', '13:30-15:30','Yoga','Ormskirk'),
('Friday', '13:30-15:30','Pole dancing','Ormskirk'),
('Friday', '15:30-17:30','Aerobics','Ormskirk');
select * from gym_schedule;

-- 3)Creating Joins
-- Joins members and membership_type table
SELECT A.firstname, A.lastname, A.gender, A.address, A.location, A.dateofbirth, A.activity, B.membership_name,B.access_time, B.location_available, B.payment_type, B.minimum_legth, B.price
FROM members A INNER JOIN membership_type B ON A.membership_typeID = B.Membership_typeID;

-- Joins the instructors table with workout type table
SELECT A.fistname, A.lastname, A.location, A.work_type, A.work_hours, A.classes, A.work_days,
B.workout_name, B.location, B.available_days, B.students_enrolled	
FROM instructors A INNER JOIN workout_type B
ON A.instructorID = B.instructorID;

-- Joins the instructors and member by location.
SELECT A.instructorID, A.fistname, A.lastname, A.location, A.work_hours, A.classes, A.work_days, B.memberID, B.firstname, B.lastname, B.gender, B.address, B.location, B.membership_typeID, B.activity
FROM instructors A INNER JOIN members B ON A.location = B.location;

-- 4) Creating a stored fuction
-- This is to see is there is availability for the workouts.
delimiter //
create function workout_space(students_enrolled int)
returns varchar(20)
deterministic
begin
	declare availability varchar(20);
    if students_enrolled >= 23 then set availability='no space';
    elseif students_enrolled<23 then set availability='available';
	end if;
    return(availability);
end //
delimiter ;

-- 5) Creating Subqueries
-- This is to display the availability for workouts in Liverpool
select workout_name, instructorID, available_days, workout_space(students_enrolled) as `Availability`
from workout_type where location='Liverpool';

-- This is to display the names of the instructors for the availabile classes in Liverpool.
select i.fistname as `First name`, i.lastname as `Last name`, i.classes as `Teaching` from instructors i where i.instructorID in
(select w.instructorID from workout_type w where workout_space(students_enrolled)='available' and location='Liverpool');

-- A join query that showcases the names of the instructors and the classes they teach that have available spaces and are being held in Liverpool.
select i.fistname, i.lastname, w.workout_name from instructors i
left join workout_type w on w.instructorID = i.instructorID
where workout_space(students_enrolled)='available' and w.location='Liverpool';

-- ADVANCED OPTIONS

-- 1) Query with group by and having 
-- A query that shows the classes that are available more than 3 times in the gym schedule in Liverpool throughout the week.
SELECT 
COUNT(DISTINCT gs.class),
gs.class
FROM gym_schedule gs
WHERE gs.location = 'Liverpool'
GROUP BY gs.class
HAVING COUNT(gs.class) >3;

-- 2) Creating a View
-- A view that demonstrates available events and their addresses for each member by cheking if the events' and the members' locations are the same.
CREATE VIEW Events_Availabe_For_Each_Member
AS 
SELECT m.firstname,m.lastname, e.event_name, l.address
FROM members m, events_table e, location l
WHERE m.location = e.location;

SELECT * FROM Events_Availabe_For_Each_Member;

-- 3) Creating an event.
-- an event that adds data into a table
SET GLOBAL event_scheduler = on;
DELIMITER //
CREATE Event IF NOT EXISTS one_time_event
on schedule at now() + interval 20 second
do begin
insert into events_table (event_name, event_date, location, numer_members_admitted)
values ('Gymnastics', '14/09', 'London', '10') ;
end//
delimiter ;
select * from events_table;


-- 4) Creating a strored procedure.
-- setting a minimum amount for the membership price
delimiter //
 create procedure price_check(membership_price int)
 begin
    Declare membership_price int;
    select n.membership_typeID from membership_type
    where price=membership_price;
    if membership_price<5 then
    set membership_price=5;
    end if;
    End //
    delimiter ;

-- 5) Creating a trigger.
-- If there is a discount, checking if the price has fallen below the minimum amount and preventing it
delimiter //
CREATE TRIGGER discount_check BEFORE UPDATE ON membership_type
       FOR EACH ROW
       BEGIN
           IF NEW.price < 5 THEN
               SET NEW.price = 5;
           END IF;
       END;//
delimiter ;

-- This is the second version of the trigger.
delimiter //
CREATE TRIGGER discount_check_2 BEFORE UPDATE ON membership_type
       FOR EACH ROW
       BEGIN
		call price_check;
       END;//
delimiter ;




