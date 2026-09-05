-- =======================================================================

--                              DATA TABLESPACE
-- =======================================================================

CREATE TABLESPACE SE_Data
   DATAFILE 'C:\app\david\oradata\NAUTILUS\sedata01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;

-- =======================================================================

--                             INDEX TABLESPACE
-- =======================================================================


CREATE TABLESPACE se_Ind
   DATAFILE 'C:\app\david\oradata\NAUTILUS\seind01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;



-- =======================================================================

--                                SE SCHEME 
-- =======================================================================

CREATE USER se
    IDENTIFIED BY se
    DEFAULT TABLESPACE se_data
    QUOTA 10M ON se_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE app_user
    --PASSWORD EXPIRE;
 

-- =======================================================================

--                             PERMISSIONS
-- =======================================================================

--  These permissions only run once
   
GRANT connect to se;
GRANT create session to SE;
GRANT create table to SE;
GRANT CREATE ANY INDEX TO SE;
GRANT UNLIMITED TABLESPACE TO SE;
GRANT CREATE VIEW TO SE;
GRANT CREATE PROCEDURE TO  SE;
GRANT CREATE ANY TRIGGER TO SE;
GRANT CREATE SEQUENCE TO  SE;

-- =======================================================================

--                               PERSON TABLE 
-- =======================================================================
CREATE TABLE person
(
  id_person                NUMBER(6),
  first_name               VARCHAR2(20),
  second_name              VARCHAR2(20),
  first_lastname           VARCHAR2(25),
  second_lastname          VARCHAR2(25),
  salary 	               NUMBER(10)
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

-- =======================================================================

--                               PRIMARY KEY
-- =======================================================================

ALTER TABLE person
ADD
CONSTRAINT pk_person PRIMARY KEY (id_person)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
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

-- =======================================================================

--1                         FOREIGN KEY PHONE TABLE 
-- =======================================================================

ALTER TABLE phone
ADD
CONSTRAINT fk_phone_person FOREIGN KEY (id_person) REFERENCES person(id_person);

ALTER TABLE phone
ADD
CONSTRAINT fk_phone_type FOREIGN KEY (id_type) REFERENCES phone_type(id_type);

-- =======================================================================

--                               CONSTRAINTS 
-- =======================================================================

ALTER TABLE person
ADD
(
 CONSTRAINT person_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT person_secondName_nn CHECK(second_name is NOT NULL),
 CONSTRAINT person_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT person_secondLastname_nn CHECK(second_lastname   is NOT NULL),
 CONSTRAINT person_salary_nn CHECK(salary is NOT NULL),
 CONSTRAINT person_validsalary_min CHECK(salary>0)

);
-- =======================================================================

--                      CONSTRAINTS OF PHONE TABLE
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

--                    CONSTRAINTS OF PHONE_TYPE TABLE
-- =======================================================================

ALTER TABLE phone_type
ADD CONSTRAINT phone_type_name_nn CHECK(type_name is NOT NULL);
-- =======================================================================

--                                COMMENTS 
-- =======================================================================

COMMENT ON TABLE person
IS 
 'Repository to store person information';
 -- ...........................................................
COMMENT ON COLUMN person.first_name
IS 
 'Person first name';
-- ...........................................................
COMMENT ON COLUMN person.second_name
IS 
 'Person second name';
-- ...........................................................
COMMENT ON COLUMN person.first_lastname
IS 
 'Person first last name';
-- ...........................................................
COMMENT ON COLUMN person.second_lastname
IS 
 'Person second last name';
-- ...........................................................
COMMENT ON COLUMN person.salary
IS 
 'Person salary';
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


-- =======================================================================

--                    SEQUENCE OF PRIMARY KEY PERSON
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

-- =======================================================================

--2                          PERSON PROCEDURE      
-- =======================================================================
CREATE OR REPLACE PROCEDURE insertPerson(
   
    pFirstName IN VARCHAR2,
    pSecondName IN VARCHAR2,
    pFirstLastname IN VARCHAR2,
    pSecondLastname IN VARCHAR2,
    p_salary IN NUMBER
)
AS
BEGIN
    INSERT INTO person(id_person, first_name, second_name, first_lastname, second_lastname,salary)
    VALUES (s_person.nextval, pFirstName, pSecondName, pFirstLastname, pSecondLastname,p_salary);
  
    COMMIT;
 
END insertPerson;

CREATE OR REPLACE PROCEDURE updatePerson(p_id_person IN NUMBER,pFirstName IN VARCHAR2 DEFAULT NULL,pSecondName IN VARCHAR2 DEFAULT NULL,
pFirstLastname IN VARCHAR2 DEFAULT NULL, pSecondLastname IN VARCHAR2 DEFAULT NULL)
   IS
    BEGIN
    UPDATE person
    SET 
        first_name = NVL(pFirstName,first_name), 
        second_name = NVL(pSecondName,second_name), 
        first_lastname = NVL(pFirstLastname, first_lastname),
        second_lastname = NVL( pSecondLastname,second_lastname)
    WHERE id_person = p_id_person;
    COMMIT;
 
END updatePerson;

-- =======================================================================

--2                          PHONE_TYPE PROCEDURE      
-- =======================================================================
CREATE OR REPLACE PROCEDURE insertTypePhone (
  pTypeName IN VARCHAR2
)
AS
BEGIN
  INSERT INTO phone_type (id_type, type_name)
  VALUES (s_type.NEXTVAL, pTypeName);
  COMMIT;
  
END insertTypePhone;

-- =======================================================================

--3                            PHONE PROCEDURE      
-- =======================================================================
CREATE OR REPLACE PROCEDURE insertPhone(
    
    pIdPerson IN NUMBER,
    pIdType IN NUMBER,
    pNumber IN NUMBER
)
AS
BEGIN
    INSERT INTO phone (id_phone, id_person, id_type, phone_number)
    VALUES (s_phone.nextval,  pIdPerson, pIdType,  pNumber);
    COMMIT;
  
END insertPhone;

CREATE OR REPLACE PROCEDURE updatePhone(p_id_phone IN NUMBER,pIdType IN NUMBER DEFAULT NULL,pNumber IN NUMBER DEFAULT NULL)
   IS
    BEGIN
    UPDATE phone
    SET   
        id_type = NVL(pIdType,id_type), 
        phone_number = NVL(pNumber, phone_number)
    WHERE id_phone = p_id_phone;
    COMMIT;
 
END updatePhone;






-- =======================================================================

--                               ADD Atributes
-- =======================================================================

ALTER TABLE person
ADD (
		creation_date DATE,
		creation_user VARCHAR2(10),
		last_modification_date DATE,
		last_modification_user VARCHAR2(10)
);

ALTER TABLE phone
ADD (
		creation_date DATE,
		creation_user VARCHAR2(10),
		last_modification_date DATE,
		last_modification_user VARCHAR2(10)
);