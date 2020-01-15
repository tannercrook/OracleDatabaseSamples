-- cleanup.sql
-- ====================================================================
-- Author: Tanner Crook
-- Date: 10/01/2019
-- ====================================================================

-- This script will insert sample data used in this project.



-- First insert the Person records
INSERT INTO Person 
VALUES 
( person_s1.nextval
, 'Tanner' 
, 'Crook'
, NULL 
, NULL);

INSERT INTO Person 
VALUES 
( person_s1.nextval
, 'Benjamin' 
, 'Porter'
, NULL 
, NULL);

INSERT INTO Person 
VALUES 
( person_s1.nextval
, 'Cassie' 
, 'Jones'
, NULL 
, NULL);

INSERT INTO Person 
VALUES 
( person_s1.nextval
, 'Mark' 
, 'Tobler'
, NULL 
, NULL);




-- Insert Chained Data (Course -> Section -> Roster)
-- Chain #1 CIT225

INSERT INTO Course 
VALUES
( course_s1.nextval
, 'Database Design and Development'
, 'CIT225'
, 6
, 3);

INSERT INTO Section 
VALUES 
( section_s1.nextval 
, course_s1.currval
, 5
, (SELECT person_id FROM Person WHERE last_name = 'Crook' AND first_name = 'Tanner')
, 'ONLINE'
, 30);

INSERT INTO Roster
VALUES 
( roster_s1.nextval 
, section_s1.currval
, (SELECT person_id FROM Person WHERE last_name = 'Jones')
, NULL
, NULL );

INSERT INTO Roster
VALUES 
( roster_s1.nextval 
, section_s1.currval
, (SELECT person_id FROM Person WHERE last_name = 'Tobler')
, NULL
, NULL );

INSERT INTO Roster
VALUES 
( roster_s1.nextval 
, section_s1.currval
, (SELECT person_id FROM Person WHERE last_name = 'Porter')
, NULL
, NULL );


INSERT INTO Section 
VALUES 
( section_s1.nextval 
, course_s1.currval
, 10
, (SELECT person_id FROM Person WHERE last_name = 'Crook' AND first_name = 'Tanner')
, 'ONLINE'
, 30);

INSERT INTO Section 
VALUES 
( section_s1.nextval 
, course_s1.currval
, 10
, NULL
, 'CAMPUS'
, 30);




-- Chain #2

INSERT INTO Course 
VALUES
( course_s1.nextval
, 'Database Administration'
, 'CIT325'
, 6
, 3);

INSERT INTO Section 
VALUES 
( section_s1.nextval 
, course_s1.currval
, 1
, NULL
, 'CAMPUS'
, 30);




-- Chain #3

INSERT INTO Course 
VALUES
( course_s1.nextval
, 'Introduction to Databases'
, 'CIT111'
, 6
, 3);

INSERT INTO Section 
VALUES 
( section_s1.nextval 
, course_s1.currval
, 1
, NULL
, 'CAMPUS'
, 30);




-- Chain #4

INSERT INTO Course 
VALUES
( course_s1.nextval
, 'Data Warehousing'
, 'CIT425'
, 6
, 3);

INSERT INTO Section 
VALUES 
( section_s1.nextval 
, course_s1.currval
, 1
, NULL
, 'CAMPUS'
, 30);