

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                           PROCEDURES TO INSERT      
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--1                            PERSON PROCEDURE      
-- =======================================================================
CREATE OR REPLACE PROCEDURE insertPerson(
   
    pFirstName IN VARCHAR2,
    pSecondName IN VARCHAR2,
    pFirstLastname IN VARCHAR2,
    pSecondLastname IN VARCHAR2
)
AS
BEGIN
    INSERT INTO person(id_person, first_name, second_name, first_lastname, second_lastname)
    VALUES (s_person.NEXTVAL, pFirstName, pSecondName, pFirstLastname, pSecondLastname);
  
    COMMIT;
 
END insertPerson;
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
    VALUES (s_phone.NEXTVAL,  pIdPerson, pIdType,  pNumber);
    COMMIT;
  
END insertPhone;


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                INSERTS TO MAKE THE TESTS OF THE PROCEDURES
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--1                       INSERT INTO PERSON TABLE
-- =======================================================================

--1 ______________________________________________________________________

DECLARE 
	vcFirstName      VARCHAR2(20):= 'Diego';
  vcSecondName     VARCHAR2(20):= 'Josue';
  vcFirstLastname  VARCHAR2(20):= 'Mora';
  vcSecondLastname VARCHAR2(20):= 'Araya';
BEGIN
   insertPerson(vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname);
END;

--2 ______________________________________________________________________
DECLARE 
   vcFirstName      VARCHAR2(20):= 'Elena';
   vcSecondName     VARCHAR2(20):= 'Maria';
   vcFirstLastname  VARCHAR2(20):= 'Diaz';
   vcSecondLastname VARCHAR2(20):= 'Mora';
BEGIN
   insertPerson(vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname);
END;


-- =======================================================================

--2                       INSERT INTO PHONE_TYPE TABLE
-- =======================================================================

--1 ______________________________________________________________________
DECLARE
	vcName  VARCHAR2(20):= 'Home';
BEGIN
	insertTypePhone(vcName);
END;
--2 ______________________________________________________________________
DECLARE
	vcName  VARCHAR2(20):= 'Office';
BEGIN
	insertTypePhone(vcName);
END;

--3 ______________________________________________________________________
DECLARE
	vcName  VARCHAR2(20):= 'Personal';
BEGIN
	insertTypePhone(vcName);
END;
 
-- =======================================================================

--3                       INSERT INTO PHONE TABLE
-- =======================================================================
--1 ______________________________________________________________________
DECLARE
    vnIdPerson NUMBER(6):= 1;
    vnIdtype NUMBER(6):= 1;
    vnNumber NUMBER(8):= 22512390;
BEGIN
    insertPhone( vnIdPerson, vnIdtype, vnNumber);
END;

--2 ______________________________________________________________________ 
DECLARE
    vnIdPerson NUMBER(6):= 2;
    vnIdtype NUMBER(6):= 1;
    vnNumber NUMBER(8):= 23515921;
BEGIN
    insertPhone( vnIdPerson, vnIdtype, vnNumber);
END;

--3 ______________________________________________________________________
DECLARE
    vnIdPerson NUMBER(6):= 1;
    vnIdtype NUMBER(6):= 2;
    vnNumber NUMBER(8):= 89512342;
BEGIN
    insertPhone( vnIdPerson, vnIdtype, vnNumber);
END;

--4 ______________________________________________________________________
DECLARE
    vnIdPerson NUMBER(6):= 1;
    vnIdtype NUMBER(6):= 3;
    vnNumber NUMBER(8):= 67576373;
BEGIN
    insertPhone( vnIdPerson, vnIdtype, vnNumber);
END;

--5 ______________________________________________________________________
DECLARE
    vnIdPerson NUMBER(6):= 1;
    vnIdtype NUMBER(6):= 3;
    vnNumber NUMBER(8):= 60518043;
BEGIN
    insertPhone( vnIdPerson, vnIdtype, vnNumber);
END;

--6 ______________________________________________________________________
DECLARE
    vnIdPerson NUMBER(6):= 2;
    vnIdtype NUMBER(6):= 3;
    vnNumber NUMBER(8):= 80519099;
BEGIN
    insertPhone( vnIdPerson, vnIdtype, vnNumber);
END;

--7 ______________________________________________________________________
DECLARE
    vnIdPerson NUMBER(6):= 2;
    vnIdtype NUMBER(6):= 3;
    vnNumber NUMBER(8):= 80519099;
BEGIN
    insertPhone( vnIdPerson, vnIdtype, vnNumber);
END;

--8 ______________________________________________________________________
DECLARE
    vnIdPerson NUMBER(6):= 2;
    vnIdtype NUMBER(6):= 2;
    vnNumber NUMBER(8):= 81819039;
BEGIN
    insertPhone( vnIdPerson, vnIdtype, vnNumber);
END;

--9 ______________________________________________________________________
DECLARE
    vnIdPerson NUMBER(6):= 2;
    vnIdtype NUMBER(6):= 3;
    vnNumber NUMBER(8):= 80001993;
BEGIN
    insertPhone( vnIdPerson, vnIdtype, vnNumber);
END;







-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                             GETPHONES  TEST
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- It is executed once to display the prints in the console
SET SERVEROUTPUT ON;


--1 ______________________________________________________________________

DECLARE
    pIdPerson NUMBER := 2;
    pTypeName VARCHAR2(20) := 'Home';
BEGIN
    getPhones(pIdPerson, pTypeName);
END;


--2 ______________________________________________________________________


DECLARE
    pIdPerson NUMBER := 1;
    pTypeName VARCHAR2(20) := NULL;
BEGIN
    getPhones(pIdPerson, pTypeName);
END;
