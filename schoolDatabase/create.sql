-- createTables.sql
-- ====================================================================
-- Author: Tanner Crook
-- Date: 10/01/2019
-- ====================================================================

-- This script will create the resources for this project.


CREATE TABLE Person 
( person_id     NUMBER 
, first_name    VARCHAR2(60)    CONSTRAINT nn_person_1  NOT NULL
, last_name     VARCHAR2(60)    CONSTRAINT nn_person_2  NOT NULL
, middle_name   VARCHAR2(60)
, birthdate     DATE
, CONSTRAINT pk_person  PRIMARY KEY(person_id));

CREATE SEQUENCE person_s1;



CREATE TABLE Course 
( course_id     NUMBER  
, name          VARCHAR2(60)    CONSTRAINT nn_course_1 NOT NULL
, code        VARCHAR2(8)       CONSTRAINT nn_course_2  NOT NULL
, department_id NUMBER
, credits       NUMBER
, CONSTRAINT pk_course PRIMARY KEY(course_id));

CREATE SEQUENCE course_s1;



CREATE TABLE Section
( section_id            NUMBER
, course_id             NUMBER  CONSTRAINT nn_section_1 NOT NULL
, sectionNumber         NUMBER  CONSTRAINT nn_section_2 NOT NULL
, teacher_person_id     NUMBER  
, type_code             VARCHAR2(6) CONSTRAINT nn_section_3 NOT NULL 
, available_seats       NUMBER  CONSTRAINT nn_section_4 NOT NULL 
, CONSTRAINT pk_section PRIMARY KEY(section_id) 
, CONSTRAINT fk_section_1 FOREIGN KEY(teacher_person_id) REFERENCES Person(person_id)
, CONSTRAINT fk_section_2 FOREIGN KEY(course_id) REFERENCES Course(course_id));

CREATE SEQUENCE section_s1;



CREATE TABLE Roster 
( roster_id         NUMBER 
, section_id        NUMBER  CONSTRAINT nn_roster_1 NOT NULL 
, person_id         NUMBER  CONSTRAINT nn_roster_2 NOT NULL 
, start_date        DATE  
, end_date          DATE 
, CONSTRAINT pk_roster PRIMARY KEY(roster_id)
, CONSTRAINT fk_roster_1 FOREIGN KEY (section_id) REFERENCES Section(section_id) 
, CONSTRAINT fk_roster_2 FOREIGN KEY (person_id) REFERENCES Person(person_id));

CREATE SEQUENCE roster_s1;