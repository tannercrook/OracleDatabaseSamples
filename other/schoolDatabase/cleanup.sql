-- cleanup.sql
-- ====================================================================
-- Author: Tanner Crook
-- Date: 10/01/2019
-- ====================================================================

-- This script will clean up the resources created in this project.

DROP TABLE Roster;
DROP SEQUENCE roster_s1;

DROP TABLE Section;
DROP SEQUENCE section_s1;

DROP TABLE Course;
DROP SEQUENCE course_s1;

DROP TABLE Person;
DROP SEQUENCE person_s1;