

DROP TABLE Person;
CREATE TABLE Person
( personID          NUMBER
, lastName          VARCHAR(30)
, firstName         VARCHAR(30)
, biologicalGender  VARCHAR(1)
, CONSTRAINT pk_person PRIMARY KEY(personID)
, CONSTRAINT mf_person CHECK(biologicalGender IN ('M','F'))
);


DROP SEQUENCE person_s1;
CREATE SEQUENCE person_s1
START WITH 1001;


ALTER TABLE Person RENAME COLUMN biologicalGender TO bioGender;



-- 1. Insert into MEMBER for potter family
INSERT INTO member
( member_id 
...
)
VALUES
( member_s1.nextval
...
);

-- Inserts FOR HARRY POTTER
-- ===============================
-- 2. CONTACT

INSERT INTO contact
( contact_id
, member_id
...
)
VALUES
( contact_s1.nextval
, member_s1.currval
...
);


-- 3. ADDRESS

INSERT INTO address
( address_id
, contact_id 
...
)
VALUES
( address_s1.nextval
, contact_id.currval
...
);

-- 4. STREET_ADDRESS
INSERT INTO street_address
( street_address_id
, address_id
...
)
VALUES 
( street_address_s1.nextval
, address_s1.currval
...
);

-- 5. TELEPHONE
INSERT INTO telephone
( telephone_id
, contact_id
, address_id
...
)
VALUES
( telephone_s1.nextval
, contact_s1.currval
, address_s1.currval
...
);


-- =======================================


-- Inserts FOR HARRY POTTER
-- ===============================
-- 2. CONTACT

INSERT INTO contact
( contact_id
, member_id
...
)
VALUES
( contact_s1.nextval
, member_s1.currval
...
);


-- 3. ADDRESS

INSERT INTO address
( address_id
, contact_id 
...
)
VALUES
( address_s1.nextval
, contact_id.currval
...
);

-- 4. STREET_ADDRESS
INSERT INTO street_address
( street_address_id
, address_id
...
)
VALUES 
( street_address_s1.nextval
, address_s1.currval
...
);

-- 5. TELEPHONE
INSERT INTO telephone
( telephone_id
, contact_id
, address_id
...
)
VALUES
( telephone_s1.nextval
, contact_s1.currval
, address_s1.currval
...
);


-- =======================================



-- UPDATE common_lookup


UPDATE common_lookup
SET common_lookup_table = common_lookup_context;

UPDATE common_lookup
SET common_lookup_table = 'ADDRESS'
WHERE common_lookup_context = 'MULTIPLE';

UPDATE common_lookup
SET common_lookup_column = common_lookup_table||'_TYPE';



INSERT INTO common_lookup
VALUES 
( 
...
);


UPDATE telephone
SET telephone_type = (  SELECT common_lookup_id 
                        FROM common_lookup
                        WHERE common_lookup_table = 'TELEPHONE'
                        AND common_lookup_column = 'TELEPHONE_TYPE'
                        AND common_lookup_type = 'HOME' )
WHERE telephone_type = (    SELECT common_lookup_id 
                            FROM common_lookup
                            WHERE common_lookup_table = 'ADDRESS'
                            AND common_lookup_type = 'HOME' );




















