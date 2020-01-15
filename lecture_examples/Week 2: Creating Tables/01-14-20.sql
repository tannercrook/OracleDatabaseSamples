DROP TABLE task;
DROP TABLE list_access;
DROP TABLE list;
DROP TABLE person;
DROP SEQUENCE person_s1;






-- Person 
CREATE TABLE person 
( person_id         NUMBER 
, first_name        VARCHAR2(60)     CONSTRAINT nn_person_1 NOT NULL
, last_name         VARCHAR2(60)     CONSTRAINT nn_person_2 NOT NULL
, middle_name       VARCHAR2(60)     
, birthdate         DATE 
, email             VARCHAR2(30)
, CONSTRAINT pk_person PRIMARY KEY (person_id));

-- Person Sequence
CREATE SEQUENCE person_s1;





-- List
CREATE TABLE list
( list_id           NUMBER 
, person_id         NUMBER          CONSTRAINT nn_list_1 NOT NULL  -- Owner of list
, list_name         VARCHAR2(30)     CONSTRAINT nn_list_2 NOT NULL
, CONSTRAINT pk_list PRIMARY KEY (list_id)
, CONSTRAINT fk_list_1 FOREIGN KEY (person_id) REFERENCES person(person_id));

CREATE SEQUENCE list_s1;


-- list_access
CREATE TABLE list_access
( list_access_id        NUMBER 
, list_id               NUMBER      CONSTRAINT nn_list_access_1 NOT NULL
, person_id             NUMBER      CONSTRAINT nn_list_access_2 NOT NULL 
, start_date            DATE        CONSTRAINT nn_list_access_3 NOT NULL 
, end_date              DATE
, CONSTRAINT pk_list_access PRIMARY KEY (list_access_id)
, CONSTRAINT fk_list_access_1 FOREIGN KEY (list_id) REFERENCES list(list_id)
, CONSTRAINT fk_list_access_2 FOREIGN KEY (person_id) REFERENCES person(person_id));

CREATE SEQUENCE list_access_s1;





-- Task
CREATE TABLE task
( task_id           NUMBER 
, list_id           NUMBER          CONSTRAINT nn_task_1 NOT NULL
, name              VARCHAR2(60)    CONSTRAINT nn_task_2 NOT NULL
, description       VARCHAR2(250)
, seq               NUMBER
, CONSTRAINT pk_task PRIMARY KEY (task_id)
, CONSTRAINT fk_task_1 FOREIGN KEY (list_id) REFERENCES list(list_id));

CREATE SEQUENCE task_s1;




-- INSERT INTO person 
INSERT INTO person 
( person_id 
, last_name 
, first_name 
, middle_name 
, email )
VALUES 
( person_s1.nextval 
, 'Baggins'
, 'Bilbo'
, NULL
, 'bilbo.baggins@lotr.com');


SELECT * FROM person;