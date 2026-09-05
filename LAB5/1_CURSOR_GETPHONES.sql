-- ######################################################################

-- All this section of code from START to END is compiled from system

-- START

-- =======================================================================

--                            GE DATA TABLESPACE
-- =======================================================================

   DATAFILE 'C:\app\david\oradata\NAUTILUS\gedata01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;

-- =======================================================================

--                            GE INDEX TABLESPACE
-- =======================================================================

CREATE TABLESPACE ge_Ind
   DATAFILE 'C:\app\david\oradata\NAUTILUS\geind01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;

-- =======================================================================

--                               SCHEME GE
-- =======================================================================

CREATE USER ge
    IDENTIFIED BY ge
    DEFAULT TABLESPACE ge_data
    QUOTA 10M ON ge_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE app_user
    --PASSWORD EXPIRE;
 

-- =======================================================================

--                             PERMISSIONS
-- =======================================================================

GRANT connect to ge;
GRANT create session to GE;
GRANT create table to GE;

--  These permissions only run once
GRANT CREATE ANY INDEX TO GE;
GRANT UNLIMITED TABLESPACE TO GE;
GRANT CREATE VIEW TO GE;
GRANT CREATE PROCEDURE TO  GE;
GRANT CREATE SEQUENCE TO  GE;
-- END

-- ######################################################################

-- From here everything is compiled in GE







-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                  TABLES
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--1                              PERSON TABLE 
-- =======================================================================
CREATE TABLE person
(
  id_person                NUMBER(6),
  first_name               VARCHAR2(20),
  second_name              VARCHAR2(20),
  first_lastname           VARCHAR2(20),
  second_lastname          VARCHAR2(20)
);

-- =======================================================================

--2                              PHONE TABLE 
-- =======================================================================

CREATE TABLE phone
(
	id_phone                 NUMBER(6),
	id_person                NUMBER(6),
	id_type                  NUMBER(6),
	phone_number             NUMBER(8)
);

-- =======================================================================

--3                           PHONE_TYPE TABLE 
-- =======================================================================
CREATE TABLE phone_type
(
	id_type                 NUMBER(6),
	type_name               VARCHAR2(20)
);


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                COMMENTS 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--1                       COMMENTS ON PERSON  TABLE 
-- =======================================================================

COMMENT ON TABLE person
IS 
 'Repository to store person information';

-- #.1
COMMENT ON COLUMN person.id_person
IS 
 'Person identifier';


-- #.2
COMMENT ON COLUMN person.first_name
IS 
 'Person first name';

-- #.3
COMMENT ON COLUMN person.second_name
IS 
 'Person second name';

-- #.4
COMMENT ON COLUMN person.first_lastname
IS 
 'Person first last name';

-- #.5
COMMENT ON COLUMN person.second_lastname
IS 
 'Person second last name';


-- =======================================================================

--2                       COMMENTS ON PHONE  TABLE 
-- =======================================================================

COMMENT ON TABLE phone
IS 
 'Repository to store phone information';

-- #.1
COMMENT ON COLUMN phone.id_phone
IS 
 'Phone identifier';

-- #.2
COMMENT ON COLUMN phone.id_person
IS 
 'Represents the person to whom the phone belongs';

-- #.3
COMMENT ON COLUMN phone.id_type
IS 
 'Represents the type of phone';

-- #.4
COMMENT ON COLUMN phone.phone_number
IS 
 'Phone number of a person';

-- =======================================================================

--3                       COMMENTS ON PHONE_TYPE  TABLE 
-- =======================================================================

COMMENT ON TABLE phone_type
IS 
 'Repository to store phone type information';

-- #.1
COMMENT ON COLUMN phone_type.id_type
IS 
 'Phone type identifier';

-- #.2
COMMENT ON COLUMN phone_type.type_name
IS 
 'Phone type name';


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                               PRIMARY KEYS 
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--1                          PRIMARY KEY PERSON TABLE 
-- =======================================================================

ALTER TABLE person
ADD
CONSTRAINT pk_person PRIMARY KEY (id_person)
USING INDEX
TABLESPACE se_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


-- =======================================================================

--2                           PRIMARY PHONE TABLE 
-- =======================================================================

ALTER TABLE phone
ADD
CONSTRAINT pk_phone PRIMARY KEY (id_phone)
USING INDEX
TABLESPACE se_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--2                          PRIMARY PHONE_TYPE TABLE 
-- =======================================================================

ALTER TABLE phone_type
ADD
CONSTRAINT pk_phone_type PRIMARY KEY (id_type)
USING INDEX
TABLESPACE se_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                 FOREIGN KEYS
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- =======================================================================

--1                         FOREIGN KEY PHONE TABLE 
-- =======================================================================

ALTER TABLE phone
ADD
CONSTRAINT fk_phone_person FOREIGN KEY (id_person) REFERENCES person(id_person);

ALTER TABLE phone
ADD
CONSTRAINT fk_phone_type FOREIGN KEY (id_type) REFERENCES phone_type(id_type);


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                               SEQUENCES 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--1                    SEQUENCE OF PRIMARY KEY PERSON
-- =======================================================================

CREATE SEQUENCE s_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;

-- =======================================================================

--2                    SEQUENCE OF PRIMARY KEY PHONE
-- =======================================================================
CREATE SEQUENCE s_phone
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;

-- =======================================================================

--3                  SEQUENCE OF PRIMARY KEY PHONE_TYPE
-- =======================================================================
CREATE SEQUENCE s_type
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;


-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                      CONSTRAINTS OF THE TABLES
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--1                     CONSTRAINTS OF PERSON TABLE
-- =======================================================================

ALTER TABLE person
ADD
(
 CONSTRAINT person_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT person_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT person_secondLastname_nn CHECK(second_lastname   is NOT NULL)
);

-- =======================================================================

--2                      CONSTRAINTS OF PHONE TABLE
-- =======================================================================

ALTER TABLE phone
ADD 
(
 CONSTRAINT phone_idPerson_nn CHECK(id_person is NOT NULL),
 CONSTRAINT phone_idType_nn CHECK(id_type is NOT NULL),
 CONSTRAINT phone_number_nn CHECK(phone_number is NOT NULL),
 CONSTRAINT phone_validNumber_min CHECK(phone_number   > 0)
);



-- =======================================================================

--3                    CONSTRAINTS OF PHONE_TYPE TABLE
-- =======================================================================

ALTER TABLE phone_type
ADD CONSTRAINT phone_type_name_nn CHECK(type_name is NOT NULL);


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                          PROCEDURE GETPHONES      
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE OR REPLACE PROCEDURE getPhones(pIdPerson IN NUMBER,pTypeName IN VARCHAR2 DEFAULT NULL)
AS
    CURSOR phoneCursor IS
        SELECT p.first_name, p.first_lastname, ph.phone_number, pt.type_name
        FROM person p
        INNER JOIN phone ph
        ON p.id_person = ph.id_person
        INNER JOIN phone_type pt
        ON ph.id_type = pt.id_type
        WHERE p.id_person = pIdPerson
        AND pt.type_name = NVL(pTypeName, pt.type_name);

    vFirstName person.first_name%TYPE;
    vLastName person.first_lastname%TYPE;
    vnPhoneNumber phone.phone_number%TYPE;
    vTypeName phone_type.type_name%TYPE;
BEGIN
    OPEN phoneCursor;
    DBMS_OUTPUT.PUT_LINE(LPAD('Name', 20) || LPAD('Phone', 20) || LPAD('Type', 20));
    LOOP
        FETCH phoneCursor INTO vFirstName, vLastName, vnPhoneNumber,  vTypeName;
        EXIT WHEN phoneCursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(LPAD(vFirstName || ' ' || vLastName, 20) || LPAD(vnPhoneNumber, 20) || LPAD(vTypeName, 20));
    END LOOP;
    CLOSE phoneCursor;
END getPhones;