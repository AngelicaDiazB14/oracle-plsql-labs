
-- =======================================================================

--1                       TRIGGERS PERSON
-- =======================================================================

CREATE OR REPLACE TRIGGER beforeInsertPerson
BEFORE INSERT
ON person
FOR EACH ROW
BEGIN
		:new.creation_date := SYSDATE;
		:new.creation_user := USER;
		
END;

CREATE OR REPLACE TRIGGER beforeUpdatePerson
BEFORE UPDATE
ON person
FOR EACH ROW
BEGIN
		:new.last_modification_date := SYSDATE;
		:new.last_modification_user := USER;	
END;
-- =======================================================================

--1                       TRIGGERS PHONE
-- =======================================================================
CREATE OR REPLACE TRIGGER beforeInsertPhone
BEFORE INSERT
ON phone
FOR EACH ROW
BEGIN
		:new.creation_date := SYSDATE;
		:new.creation_user := USER;
		
END;

CREATE OR REPLACE TRIGGER beforeUpdatePhone
BEFORE UPDATE
ON phone
FOR EACH ROW
BEGIN
		:new.last_modification_date := SYSDATE;
		:new.last_modification_user := USER;	
END;
-- =======================================================================

--1                       INSERT INTO PERSON TABLE
-- =======================================================================

--1 ______________________________________________________________________

DECLARE 
	vcFirstName      VARCHAR2(20):= 'Diego';
  vcSecondName     VARCHAR2(20):= 'Josue';
  vcFirstLastname  VARCHAR2(20):= 'Mora';
  vcSecondLastname VARCHAR2(20):= 'Araya';
  salary           NUMBER(10):= 600000;
BEGIN
   insertPerson(vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,salary);
END;

--2 ______________________________________________________________________
DECLARE 
   vcFirstName      VARCHAR2(20):= 'Elena';
   vcSecondName     VARCHAR2(20):= 'Maria';
   vcFirstLastname  VARCHAR2(20):= 'Diaz';
   vcSecondLastname VARCHAR2(20):= 'Mora';
   salary           NUMBER(10):= 1500;
BEGIN
   insertPerson(vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,salary);
END;
-- =======================================================================

--1                       UPDATE PERSON
-- =======================================================================

DECLARE 
   vcFirstName      VARCHAR2(20):= 'David';
   
BEGIN
   updatePerson(1,vcFirstName);
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



-- =======================================================================

--3                       UPDATE
-- =======================================================================

DECLARE
    vnIdPhone NUMBER(6):= 2;
    vnIdtype NUMBER(6):= 2;
  
BEGIN
    updatePhone(vnIdPhone,vnIdtype);
END;
