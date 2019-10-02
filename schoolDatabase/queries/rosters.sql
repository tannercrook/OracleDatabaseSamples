-- cleanup.sql
-- ====================================================================
-- Author: Tanner Crook
-- Date: 10/01/2019
-- ====================================================================

-- This holds SQL for querying various roster oriented data


-- Basic Roster Report
SELECT 
  p.last_name 
, p.first_name 
, c.code 
, c.name 
, s.sectionNumber 
, tp.last_name||', '||tp.first_name AS teacher 
FROM Course c 
INNER JOIN Section s 
ON c.course_id = s.course_id 
INNER JOIN Roster r 
ON s.section_id = r.section_id 
INNER JOIN Person p 
ON r.person_id = p.person_id 
INNER JOIN Person tp 
ON s.teacher_person_id = tp.person_id;




