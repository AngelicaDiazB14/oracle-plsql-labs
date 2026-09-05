
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                        PROCEDURES TO INSERT      
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--                       UNIVERSITY PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertUniversity
(pUniversityName IN VARCHAR2)
AS
BEGIN
    INSERT INTO university (id_university,university_name)
    VALUES (se_university.nextval, pUniversityName);
    COMMIT;
END insertUniversity;


-- =======================================================================

--                        CAMPUS PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertCampus
(pIdUniversity IN NUMBER, pCampusName IN VARCHAR2)
AS
BEGIN
    INSERT INTO campus (id_campus,id_university,campus_name)
    VALUES (se_campus.nextval,pIdUniversity,pCampusName);
    COMMIT;
END insertCampus;
    

-- =======================================================================

--                       CAREER PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertCareer
(pIdCampus IN NUMBER, pCareerName IN VARCHAR2)
AS
BEGIN
    INSERT INTO career (id_career,id_campus,career_name)
    VALUES (se_career.nextval, pIdCampus,pCareerName);
    COMMIT;
END insertCareer;

-- =======================================================================

--                       STUDENT PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertStudent
(pIdCareer IN NUMBER,pFirstName IN VARCHAR2,pSecondName IN VARCHAR2,pFirstLastname IN VARCHAR2,pSecondLastname IN VARCHAR2,pStudentCard IN NUMBER)
AS
BEGIN
    INSERT INTO student (id_student,id_career,first_name,second_name,first_lastname,second_lastname,student_card)
    VALUES (se_student.nextval, pIdCareer,pFirstName,pSecondName,pFirstLastname,pSecondLastname,pStudentCard);
    COMMIT;
END insertStudent;

-- =======================================================================

--                         EMAIL PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertEmail
(pIdStudent IN NUMBER, pEmailAddress IN VARCHAR2)
AS
BEGIN
    INSERT INTO email (id_email,id_student,email_address)
    VALUES (se_email.nextval,pIdStudent,pEmailAddress);
    COMMIT;
END insertEmail;


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                INSERTS TO MAKE THE TESTS OF THE PROCEDURES
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--                       INSERT INTO UNIVERSITY TABLE
-- =======================================================================

DECLARE 
   vcUniversityName VARCHAR2(40):= 'Technological of Costa Rica';
BEGIN
   insertUniversity(vcUniversityName);
END;


-- =======================================================================

--                         INSERT INTO CAMPUS TABLE
-- =======================================================================


--1 _____________________________________________________________________

DECLARE 
   vcIdUniversity NUMBER(6):= 0;
   vcCampusName   VARCHAR2(20):= 'San Jose';
BEGIN
   insertCampus(vcIdUniversity,vcCampusName);
END;

--2 _____________________________________________________________________

DECLARE 
   vcIdUniversity NUMBER(6):= 0;
   vcCampusName   VARCHAR2(20):= 'Cartago';
BEGIN
   insertCampus(vcIdUniversity,vcCampusName);
END; 



--3 _____________________________________________________________________

DECLARE 
   vcIdUniversity NUMBER(6):= 0;
   vcCampusName   VARCHAR2(20):= 'Limon';
BEGIN
   insertCampus(vcIdUniversity,vcCampusName);
END; 



-- =======================================================================

--                         INSERT INTO CAREER TABLE
-- =======================================================================


--1 _____________________________________________________________________
DECLARE 
   vcIdCampus     NUMBER(6):= 0;
   vcCareerName   VARCHAR2(50):= 'Computer Engineering';
BEGIN
   insertCareer(vcIdCampus,vcCareerName);
END; 

--2 _____________________________________________________________________
DECLARE 
   vcIdCampus     NUMBER(6):= 0;
   vcCareerName   VARCHAR2(50):= 'Business Administration';
BEGIN
   insertCareer(vcIdCampus,vcCareerName);
END; 

--3 _____________________________________________________________________

DECLARE 
   vcIdCampus     NUMBER(6):= 0;
   vcCareerName   VARCHAR2(50):= 'Architecture';
BEGIN
   insertCareer(vcIdCampus,vcCareerName);
END; 

--4 _____________________________________________________________________

DECLARE 
   vcIdCampus     NUMBER(6):= 1;
   vcCareerName   VARCHAR2(50):= 'Mechatronics Engineering';
BEGIN
   insertCareer(vcIdCampus,vcCareerName);
END; 


--5 _____________________________________________________________________

DECLARE 
   vcIdCampus     NUMBER(6):= 1;
   vcCareerName   VARCHAR2(50):= 'Industrial Design Engineering';
BEGIN
   insertCareer(vcIdCampus,vcCareerName);
END; 


--6 _____________________________________________________________________

DECLARE 
   vcIdCampus     NUMBER(6):= 1;
   vcCareerName   VARCHAR2(50):= 'Materials Engineering';
BEGIN
   insertCareer(vcIdCampus,vcCareerName);
END; 


--7 _____________________________________________________________________

DECLARE 
   vcIdCampus     NUMBER(6):= 2;
   vcCareerName   VARCHAR2(50):= 'Computer Engineering';
BEGIN
   insertCareer(vcIdCampus,vcCareerName);
END; 


--8 _____________________________________________________________________

DECLARE 
   vcIdCampus     NUMBER(6):= 2;
   vcCareerName   VARCHAR2(50):= 'Industrial production';
BEGIN
   insertCareer(vcIdCampus,vcCareerName);
END;


--9 _____________________________________________________________________

DECLARE 
   vcIdCampus     NUMBER(6):= 2;
   vcCareerName   VARCHAR2(50):= 'Business Administration';
BEGIN
   insertCareer(vcIdCampus,vcCareerName);
END;


-- =======================================================================

--                       INSERT INTO STUDENT TABLE
-- =======================================================================


--1 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 0;
   vcFirstName      VARCHAR2(20):= 'Diego';
   vcSecondName     VARCHAR2(20):= 'Josue';
   vcFirstLastname  VARCHAR2(20):= 'Mora';
   vcSecondLastname VARCHAR2(20):= 'Araya';
   vcStudentCard    NUMBER(10):= 2020456781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;

--2 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 0;
   vcFirstName      VARCHAR2(20):= 'Elena';
   vcSecondName     VARCHAR2(20):= 'Maria';
   vcFirstLastname  VARCHAR2(20):= 'Diaz';
   vcSecondLastname VARCHAR2(20):= 'Mora';
   vcStudentCard    NUMBER(10):= 2021456781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;

--3 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 1;
   vcFirstName      VARCHAR2(20):= 'Antonio';
   vcSecondName     VARCHAR2(20):= 'Jose';
   vcFirstLastname  VARCHAR2(20):= 'Zambrano';
   vcSecondLastname VARCHAR2(20):= 'Flores';
   vcStudentCard    NUMBER(10):= 2022456781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


--4 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 1;
   vcFirstName      VARCHAR2(20):= 'Isabel';
   vcSecondName     VARCHAR2(20):= 'Francisca';
   vcFirstLastname  VARCHAR2(20):= 'Torres';
   vcSecondLastname VARCHAR2(20):= 'Castillo';
   vcStudentCard    NUMBER(10):= 2023456781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


--5 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 2;
   vcFirstName      VARCHAR2(20):= 'Pilar';
   vcSecondName     VARCHAR2(20):= 'Guadalupe';
   vcFirstLastname  VARCHAR2(20):= 'Cruz';
   vcSecondLastname VARCHAR2(20):= 'Morales';
   vcStudentCard    NUMBER(10):= 2019456781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


--6 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 2;
   vcFirstName      VARCHAR2(20):= 'Ana';
   vcSecondName     VARCHAR2(20):= 'Rosario';
   vcFirstLastname  VARCHAR2(20):= 'Castro';
   vcSecondLastname VARCHAR2(20):= 'Reyes';
   vcStudentCard    NUMBER(10):= 2018456781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


--7 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 3;
   vcFirstName      VARCHAR2(20):= 'Marlon';
   vcSecondName     VARCHAR2(20):= 'Francisco';
   vcFirstLastname  VARCHAR2(20):= 'Torres';
   vcSecondLastname VARCHAR2(20):= 'Castillo';
   vcStudentCard    NUMBER(10):= 2017456781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


--8 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 3;
   vcFirstName      VARCHAR2(20):= 'Pepe';
   vcSecondName     VARCHAR2(20):= 'Carlos';
   vcFirstLastname  VARCHAR2(20):= 'Cruz';
   vcSecondLastname VARCHAR2(20):= 'Morales';
   vcStudentCard    NUMBER(10):= 2020456744;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;

--9 ______________________________________________________________________


DECLARE 
   vcIdCareer       NUMBER(6):= 4;
   vcFirstName      VARCHAR2(20):= 'Joaquin';
   vcSecondName     VARCHAR2(20):= 'Fernando';
   vcFirstLastname  VARCHAR2(20):= 'Romero';
   vcSecondLastname VARCHAR2(20):= 'Moreno';
   vcStudentCard    NUMBER(10):= 2020556781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;

--10 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 4;
   vcFirstName      VARCHAR2(20):= 'Carlos';
   vcSecondName     VARCHAR2(20):= 'Alberto';
   vcFirstLastname  VARCHAR2(20):= 'Rivera';
   vcSecondLastname VARCHAR2(20):= 'Vargas';
   vcStudentCard    NUMBER(10):= 2020786781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


--11 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 5;
   vcFirstName      VARCHAR2(20):= 'Raquel';
   vcSecondName     VARCHAR2(20):= 'Mercedes';
   vcFirstLastname  VARCHAR2(20):= 'Medina';
   vcSecondLastname VARCHAR2(20):= 'Arias';
   vcStudentCard    NUMBER(10):= 2020459981;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


--12 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 6;
   vcFirstName      VARCHAR2(20):= 'Irene';
   vcSecondName     VARCHAR2(20):= 'Teresa';
   vcFirstLastname  VARCHAR2(20):= 'Campos';
   vcSecondLastname VARCHAR2(20):= 'Sandoval';
   vcStudentCard    NUMBER(10):= 2020123781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


--13 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 7;
   vcFirstName      VARCHAR2(20):= 'Paula';
   vcSecondName     VARCHAR2(20):= 'Petronila';
   vcFirstLastname  VARCHAR2(20):= 'Gallardo';
   vcSecondLastname VARCHAR2(20):= 'Bravo';
   vcStudentCard    NUMBER(10):= 2020996781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


--14 ______________________________________________________________________

DECLARE 
   vcIdCareer       NUMBER(6):= 8;
   vcFirstName      VARCHAR2(20):= 'Beatriz';
   vcSecondName     VARCHAR2(20):= 'Julia';
   vcFirstLastname  VARCHAR2(20):= 'Olivares';
   vcSecondLastname VARCHAR2(20):= 'Orellana';
   vcStudentCard    NUMBER(10):= 2017098781;
BEGIN
   insertStudent(vcIdCareer,vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;


-- =======================================================================

--                       INSERT INTO EMAIL TABLE
-- =======================================================================


--1 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 0;
   vcEmailAddress    VARCHAR2(40):= 'josuemora@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;


--2 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcEmailAddress    VARCHAR2(40):= 'mariadiaz@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;

--3 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcEmailAddress    VARCHAR2(40):= 'josezambranoa@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;


--4 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcEmailAddress    VARCHAR2(40):= 'torresfrancisca@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;

--5 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 4;
   vcEmailAddress    VARCHAR2(40):= 'guadalupescruz@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;


--6 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 5;
   vcEmailAddress    VARCHAR2(40):= 'anarosario@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;

--7 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 6;
   vcEmailAddress    VARCHAR2(40):= 'marlonfrancisco@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;


--8 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 7;
   vcEmailAddress    VARCHAR2(40):= 'carlospepe@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;

--9 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 8;
   vcEmailAddress    VARCHAR2(40):= 'joaquinfernandoa@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;


--10 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 9;
   vcEmailAddress    VARCHAR2(40):= 'albertorivera@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;


--11 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 10;
   vcEmailAddress    VARCHAR2(40):= 'raquelmercedes@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;


--12 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 11;
   vcEmailAddress    VARCHAR2(40):= 'ireneteresa@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;

--13 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 12;
   vcEmailAddress    VARCHAR2(40):= 'gallardobravoa@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;


--14 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 13;
   vcEmailAddress    VARCHAR2(40):= 'juliaolivares@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                             FUNCTIONS 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--                            a. getName 
-- =======================================================================

CREATE OR REPLACE FUNCTION getName (pStudentCard IN NUMBER)
RETURN VARCHAR2
IS
    vcName VARCHAR2(20);
BEGIN
    SELECT first_name
    INTO vcName
    FROM student
    WHERE student_card = pStudentCard;
    RETURN (vcName);
END;

-- =======================================================================

--                            b. getEmail
-- =======================================================================


CREATE OR REPLACE FUNCTION getEmail (pIdStudent IN NUMBER)
RETURN VARCHAR2
IS
    vcEmail VARCHAR2(40);
BEGIN
    SELECT email_address
    INTO vcEmail
    FROM email
    WHERE id_student = pIdStudent;
    RETURN (vcEmail);
END;

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                             PACKAGES 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--                         c. getCareer      
-- =======================================================================

--                            HEADER


CREATE OR REPLACE PACKAGE adminCareer IS

FUNCTION getCareer(pIdStudent IN NUMBER) return VARCHAR2;

END adminCareer;

--                              BODY

CREATE OR REPLACE PACKAGE BODY adminCareer AS

FUNCTION getCareer (pIdStudent IN NUMBER)
RETURN VARCHAR2
IS
    vcCareer VARCHAR2(50);
BEGIN
    SELECT c.career_name
    INTO vcCareer
    FROM student s
    INNER JOIN career c
    ON s.id_career = c.id_career
    WHERE s.id_student = pIdStudent;
    RETURN (vcCareer);
END;

END adminCareer;


-- =======================================================================

--                          d. getCampus 
-- =======================================================================
--                            HEADER

CREATE OR REPLACE PACKAGE adminCampus IS

FUNCTION getCampus(pIdStudent IN NUMBER) RETURN VARCHAR2;

END adminCampus;


--                             BODY


CREATE OR REPLACE PACKAGE BODY adminCampus AS

FUNCTION getCampus (pIdStudent IN NUMBER)
RETURN VARCHAR2
IS
    vcCampus VARCHAR2(20);
BEGIN
    SELECT cam.campus_name
    INTO vcCampus
    FROM student s
    INNER JOIN career c
    ON s.id_career = c.id_career
    INNER JOIN campus cam
    ON c.id_campus = cam.id_campus
    WHERE s.id_student = pIdStudent;
    RETURN (vcCampus);
END;

END adminCampus;





-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                             TESTS 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--                          a. Test getName
-- =======================================================================
-- It is executed once to display the prints in the console
SET SERVEROUTPUT ON;

DECLARE 
  vnStudentCard NUMBER(10):= 2020456781;
  vcName VARCHAR2(20);
BEGIN
  vcName:= getName(vnStudentCard);
  DBMS_OUTPUT.PUT_LINE('Student name: ' || vcName);

END;

-- .......................................................................
DECLARE 
  vnStudentCard NUMBER(10):= 2017098781;
  vcName VARCHAR2(20);
BEGIN
  vcName:= getName(vnStudentCard);
  DBMS_OUTPUT.PUT_LINE('Student name: ' || vcName);
END;


-- .......................................................................
DECLARE 
  vnStudentCard NUMBER(10):= 2019456781;
  vcName VARCHAR2(20);
BEGIN
  vcName:= getName(vnStudentCard);
  DBMS_OUTPUT.PUT_LINE('Student name: ' || vcName);
END;

-- =======================================================================

--                           b. Test getEmail
-- =======================================================================

DECLARE 
  vnIdStudent NUMBER(6):= 0;
  vcEmail VARCHAR2(40);
BEGIN
  vcEmail:= getEmail(vnIdStudent);
  DBMS_OUTPUT.PUT_LINE('Student email: ' || vcEmail);
END;

-- .......................................................................

DECLARE 
  vnIdStudent NUMBER(6):= 13;
  vcEmail VARCHAR2(40);
BEGIN
  vcEmail:= getEmail(vnIdStudent);
  DBMS_OUTPUT.PUT_LINE('Student email: ' || vcEmail);
END;

-- .......................................................................

DECLARE 
  vnIdStudent NUMBER(6):= 4;
  vcEmail VARCHAR2(40);
BEGIN
  vcEmail:= getEmail(vnIdStudent);
  DBMS_OUTPUT.PUT_LINE('Student email: ' || vcEmail);
END;

-- =======================================================================

--                           c. Test getCareer
-- =======================================================================

DECLARE 
  vnIdStudent NUMBER(6):= 0;
  vcCareer VARCHAR2(50);
BEGIN
  vcCareer:= adminCareer.getCareer(vnIdStudent);
  DBMS_OUTPUT.PUT_LINE('Student career: ' || vcCareer);
END;

-- .......................................................................

DECLARE 
  vnIdStudent NUMBER(6):= 13;
  vcCareer VARCHAR2(50);
BEGIN
  vcCareer:= adminCareer.getCareer(vnIdStudent);
  DBMS_OUTPUT.PUT_LINE('Student career: ' || vcCareer);
END;

-- .......................................................................
DECLARE 
  vnIdStudent NUMBER(6):= 4;
  vcCareer VARCHAR2(50);
BEGIN
  vcCareer:= adminCareer.getCareer(vnIdStudent);
  DBMS_OUTPUT.PUT_LINE('Student career: ' || vcCareer);
END;
-- =======================================================================

--                         d. Test getCampus      
-- =======================================================================

DECLARE 
  vnIdStudent NUMBER(6):= 0;
  vcCampus VARCHAR2(20);
BEGIN
  vcCampus:= adminCampus.getCampus(vnIdStudent);
  DBMS_OUTPUT.PUT_LINE('Student campus: ' || vcCampus);
END;

-- .......................................................................

DECLARE 
  vnIdStudent NUMBER(6):= 13;
  vcCampus VARCHAR2(20);
BEGIN
  vcCampus:= adminCampus.getCampus(vnIdStudent);
  DBMS_OUTPUT.PUT_LINE('Student campus: ' || vcCampus);
END;

-- .......................................................................

DECLARE 
  vnIdStudent NUMBER(6):= 4;
  vcCampus VARCHAR2(20);
BEGIN
  vcCampus:= adminCampus.getCampus(vnIdStudent);
  DBMS_OUTPUT.PUT_LINE('Student campus: ' || vcCampus);
END;

