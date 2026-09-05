-- ######################################################################

-- All this section of code from START to END is compiled from system

-- START

-- =======================================================================

--                            UN DATA TABLESPACE
-- =======================================================================

CREATE TABLESPACE UN_Data
   DATAFILE 'C:\app\david\oradata\NAUTILUS\undata01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;

-- =======================================================================

--                            UN INDEX TABLESPACE
-- =======================================================================


CREATE TABLESPACE un_Ind
   DATAFILE 'C:\app\david\oradata\NAUTILUS\unind01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;



-- =======================================================================

--                               SCHEME UN
-- =======================================================================

CREATE USER un
    IDENTIFIED BY un
    DEFAULT TABLESPACE un_data
    QUOTA 10M ON un_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE app_user
    --PASSWORD EXPIRE;
 

-- =======================================================================

--                             PERMISSIONS
-- =======================================================================

--  These permissions only run once
   
GRANT connect to un;
GRANT create session to UN;
GRANT create table to UN;
GRANT CREATE ANY INDEX TO UN;
GRANT UNLIMITED TABLESPACE TO UN;
GRANT CREATE VIEW TO UN;
GRANT CREATE PROCEDURE TO  UN;

--GRANT CREATE PACKAGE TO  UN;
GRANT CREATE SEQUENCE TO  UN;

-- END

-- ######################################################################

-- From here everything is compiled in UN

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                  TABLES
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



-- =======================================================================

--1                             STUDENT TABLE 
-- =======================================================================
CREATE TABLE student
(
  id_student                 NUMBER(6),
  first_name                 VARCHAR2(20),
  second_name                VARCHAR2(20),
  first_lastname             VARCHAR2(25),
  second_lastname            VARCHAR2(25),
  student_card 	             NUMBER(10)
 
);


-- =======================================================================

--2                             EMAIL TABLE 
-- =======================================================================
CREATE TABLE email
(
  id_email                  NUMBER(6),
  id_student                NUMBER(6),
  email_address             VARCHAR2(60)
);




-- =======================================================================

--3                            PHONE TABLE 
-- =======================================================================
CREATE TABLE phone
(
  id_phone                  NUMBER(6),
  id_student                NUMBER(6),
  id_type                   NUMBER(6), 
  phone_number              NUMBER(8)  
);


-- =======================================================================

--4                          PHONE_TYPE TABLE 
-- =======================================================================
CREATE TABLE phone_type
(
  id_type                   NUMBER(6),
  type_name                 VARCHAR2(20)
);



-- =======================================================================

--5                            STATUS TABLE 
-- =======================================================================
CREATE TABLE status
(
  id_status                 NUMBER(6),
  description               VARCHAR2(20)
);

-- =======================================================================

--6                            COURSE TABLE 
-- =======================================================================
CREATE TABLE course
(
  id_course                 NUMBER(6),
  course_name               VARCHAR2(40)
);


-- =======================================================================

--7                         STUDENTXCOURSE TABLE 
-- =======================================================================
CREATE TABLE studentxcourse
(
  id_studenxcourse          NUMBER(6),
  id_student                NUMBER(6),
  id_course                 NUMBER(6),
  id_status                 NUMBER(6)
);



-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                COMMENTS 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



-- =======================================================================

--1                       COMMENTS ON STUDENT  TABLE 
-- =======================================================================

COMMENT ON TABLE student
IS 
 'Repository to store student information';

-- #.1
COMMENT ON COLUMN student.id_student
IS 
 'Student identifier';


-- #.2
COMMENT ON COLUMN student.first_name
IS 
 'Student first name';

-- #.3
COMMENT ON COLUMN student.second_name
IS 
 'Student second name';

-- #.4
COMMENT ON COLUMN student.first_lastname
IS 
 'Student first last name';

-- #.5
COMMENT ON COLUMN student.second_lastname
IS 
 'Student second last name';

-- #.6
COMMENT ON COLUMN student.student_card
IS 
 'It is the student ID (student card) at the university';


-- =======================================================================

--2                       COMMENTS ON EMAIL  TABLE 
-- =======================================================================

COMMENT ON TABLE email
IS 
 'Repository to store email information';

-- #.1
COMMENT ON COLUMN email.id_email
IS 
 'Email identifier';

-- #.2
COMMENT ON COLUMN email.id_student
IS 
 'Represents the student to whom the mail belongs';

-- #.3
COMMENT ON COLUMN email.email_address
IS 
 'Student email address';


-- =======================================================================

--3                         COMMENTS ON PHONE TABLE 
-- =======================================================================

COMMENT ON TABLE phone
IS 
 'Repository to store phone information';

-- #.1
COMMENT ON COLUMN phone.id_phone
IS 
 'Phone identifier';

-- #.2
COMMENT ON COLUMN phone.id_student
IS 
 'Represents the student to whom the phone belongs';

-- #.3
COMMENT ON COLUMN phone.id_type
IS 
 'Represents the type of phone';

-- #.4
COMMENT ON COLUMN phone.phone_number
IS 
 'Phone number of a student';

-- =======================================================================

--4                       COMMENTS ON PHONE_TYPE TABLE 
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

--5                        COMMENTS ON STATUS TABLE 
-- =======================================================================

COMMENT ON TABLE status
IS 
 'Repository to store course status information';

-- #.1
COMMENT ON COLUMN status.id_status
IS 
 ' Course status identifier';

-- #.2
COMMENT ON COLUMN status.description
IS 
 'Course status description';

-- =======================================================================

--6                        COMMENTS ON COURSE TABLE 
-- =======================================================================

COMMENT ON TABLE course
IS 
 'Repository to store course information';

-- #.1
COMMENT ON COLUMN course.id_course
IS 
 ' Course identifier';

-- #.2
COMMENT ON COLUMN course.course_name
IS 
 'Course name';

-- =======================================================================

--7                     COMMENTS ON STUDENTXCOURSE TABLE 
-- =======================================================================


COMMENT ON TABLE studentxcourse
IS 
 'Repository to store course information';

-- #.1
COMMENT ON COLUMN studentxcourse.id_studenxcourse
IS 
 ' studentxcourse identifier';

-- #.2
COMMENT ON COLUMN studentxcourse.id_student
IS 
 'Represents the student who enrolled in the course';

-- #.3
COMMENT ON COLUMN studentxcourse.id_course
IS 
 ' Represents the course of a student';

-- #.4
COMMENT ON COLUMN studentxcourse.id_status
IS 
 'Represents the state the students course is currently in';

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                               PRIMARY KEYS 
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--1                          PRIMARY KEY STUDENT TABLE 
-- =======================================================================

ALTER TABLE student
ADD
CONSTRAINT pk_student PRIMARY KEY (id_student)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


-- =======================================================================

--2                          PRIMARY KEY EMAIL TABLE 
-- =======================================================================

ALTER TABLE email
ADD
CONSTRAINT pk_email PRIMARY KEY (id_email)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


-- =======================================================================

--3                           PRIMARY PHONE TABLE 
-- =======================================================================

ALTER TABLE phone
ADD
CONSTRAINT pk_phone PRIMARY KEY (id_phone)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--4                          PRIMARY PHONE_TYPE TABLE 
-- =======================================================================

ALTER TABLE phone_type
ADD
CONSTRAINT pk_phone_type PRIMARY KEY (id_type)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--5                           PRIMARY STATUS TABLE 
-- =======================================================================

ALTER TABLE status
ADD
CONSTRAINT pk_status PRIMARY KEY (id_status)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);



-- =======================================================================

--6                          PRIMARY COURSE TABLE TABLE 
-- =======================================================================

ALTER TABLE course
ADD
CONSTRAINT pk_course PRIMARY KEY (id_course)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


-- =======================================================================

--7                          PRIMARY STUDENTXCOURSE TABLE 
-- =======================================================================

ALTER TABLE studentxcourse
ADD
CONSTRAINT pk_studentxcourse PRIMARY KEY (id_studenxcourse)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                 FOREIGN KEYS
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--1                         FOREIGN KEY EMAIL TABLE 
-- =======================================================================

ALTER TABLE email
ADD
CONSTRAINT fk_email_student FOREIGN KEY (id_student) REFERENCES student(id_student);


-- =======================================================================

--2                         FOREIGN KEY PHONE TABLE 
-- =======================================================================

ALTER TABLE phone
ADD
CONSTRAINT fk_phone_student FOREIGN KEY (id_student) REFERENCES student(id_student);

ALTER TABLE phone
ADD
CONSTRAINT fk_phone_type FOREIGN KEY (id_type) REFERENCES phone_type(id_type);



-- =======================================================================

--3                      FOREIGN KEY STUDENTXCOURSE TABLE 
-- =======================================================================

ALTER TABLE studentxcourse
ADD
CONSTRAINT fk_studentxcourse_student FOREIGN KEY (id_student) REFERENCES student(id_student);


ALTER TABLE studentxcourse
ADD
CONSTRAINT fk_studentxcourse_course FOREIGN KEY (id_course) REFERENCES course(id_course);

ALTER TABLE studentxcourse
ADD
CONSTRAINT fk_studentxcourse_status FOREIGN KEY (id_status) REFERENCES status(id_status);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                               SEQUENCES 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--1                    SEQUENCE OF PRIMARY KEY STUDENT
-- =======================================================================

CREATE SEQUENCE se_student
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;

-- =======================================================================

--2                    SEQUENCE OF PRIMARY KEY EMAIL
-- =======================================================================


CREATE SEQUENCE se_email
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;


-- =======================================================================

--3                    SEQUENCE OF PRIMARY KEY  PHONE
-- =======================================================================


CREATE SEQUENCE se_phone
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;


-- =======================================================================

--4                    SEQUENCE OF PRIMARY KEY PHONE_TYPE
-- =======================================================================


CREATE SEQUENCE se_phone_type
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;


-- =======================================================================

--5                    SEQUENCE OF PRIMARY KEY STATUS
-- =======================================================================


CREATE SEQUENCE se_status
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;


-- =======================================================================

--6                    SEQUENCE OF PRIMARY KEY COURSE
-- =======================================================================


CREATE SEQUENCE se_course
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;

-- =======================================================================

--7                 SEQUENCE OF PRIMARY KEY STUDENTXCOURSE
-- =======================================================================


CREATE SEQUENCE se_studentxcourse
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

--1                  CONSTRAINTS OF STUDENT TABLE
-- =======================================================================

ALTER TABLE student
ADD
(
 CONSTRAINT student_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT student_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT student_secondLastname_nn CHECK(second_lastname   is NOT NULL),
 CONSTRAINT student_studentCard_nn CHECK(student_card   is NOT NULL),
 CONSTRAINT student_validStudentCard_min CHECK(student_card   > 0)
);


-- =======================================================================

--2                  CONSTRAINTS OF EMAIL TABLE
-- =======================================================================

ALTER TABLE email
ADD 
(
 CONSTRAINT email_idStudent_nn CHECK(id_student is NOT NULL),
 CONSTRAINT email_emailAddress_nn CHECK(email_address is NOT NULL)
);



-- =======================================================================

--3                  CONSTRAINTS OF PHONE TABLE
-- =======================================================================

ALTER TABLE phone
ADD 
(
 CONSTRAINT phone_idStudent_nn CHECK(id_student is NOT NULL),
 CONSTRAINT phone_idType_nn CHECK(id_type is NOT NULL),
 CONSTRAINT phone_number_nn CHECK(phone_number is NOT NULL),
 CONSTRAINT phone_validNumber_min CHECK(phone_number   > 0)
);



-- =======================================================================

--4                 CONSTRAINTS OF PHONE_TYPE TABLE
-- =======================================================================

ALTER TABLE phone_type
ADD CONSTRAINT phone_type_name_nn CHECK(type_name is NOT NULL);



-- =======================================================================

--5                  CONSTRAINTS OF STATUS TABLE
-- =======================================================================

ALTER TABLE status
ADD CONSTRAINT status_description_nn CHECK(description is NOT NULL);



-- =======================================================================

--6                 CONSTRAINTS OF COURSE TABLE
-- =======================================================================

ALTER TABLE course
ADD CONSTRAINT course_name_nn CHECK(course_name is NOT NULL);


-- =======================================================================

--7            CONSTRAINTS OF STUDENTXCOURSE TABLE
-- =======================================================================

ALTER TABLE studentxcourse
ADD 
(
 CONSTRAINT studentxc_idStudent_nn CHECK(id_student is NOT NULL),
 CONSTRAINT studentxc_idCourse_nn CHECK(id_course is NOT NULL),
 CONSTRAINT studentxc_idStatus_nn CHECK(id_status is NOT NULL)
);


-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                        PROCEDURES TO INSERT      
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--1                       STUDENT PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertStudent
(pFirstName IN VARCHAR2,pSecondName IN VARCHAR2,pFirstLastname IN VARCHAR2,pSecondLastname IN VARCHAR2,pStudentCard IN NUMBER)
AS
BEGIN
    INSERT INTO student (id_student,first_name,second_name,first_lastname,second_lastname,student_card)
    VALUES (se_student.nextval,pFirstName,pSecondName,pFirstLastname,pSecondLastname,pStudentCard);
    COMMIT;
END insertStudent;

-- =======================================================================

--2                         EMAIL PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertEmail
(pIdStudent IN NUMBER, pEmailAddress IN VARCHAR2)
AS
BEGIN
    INSERT INTO email (id_email,id_student,email_address)
    VALUES (se_email.nextval,pIdStudent,pEmailAddress);
    COMMIT;
END insertEmail;


-- =======================================================================

--3                         PHONE PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertPhone
(pIdStudent IN NUMBER, pIdType IN NUMBER,pPhoneNumber IN NUMBER)
AS
BEGIN
    INSERT INTO phone (id_phone,id_student,id_type,phone_number)
    VALUES (se_phone.nextval,pIdStudent,pIdType,pPhoneNumber);
    COMMIT;
END insertPhone;


-- =======================================================================

--4                       PHONE_TYPE PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertPhoneType
(pTypeName IN VARCHAR2)
AS
BEGIN
    INSERT INTO phone_type (id_type,type_name)
    VALUES (se_phone_type.nextval,pTypeName);
    COMMIT;
END insertPhoneType;


-- =======================================================================

--5                         STATUS PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertStatus
(pDescription IN VARCHAR2)
AS
BEGIN
    INSERT INTO status (id_status,description)
    VALUES (se_status.nextval,pDescription);
    COMMIT;
END insertStatus;

-- =======================================================================

--6                        COURSE PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertCourse
(pCourseName IN VARCHAR2)
AS
BEGIN
    INSERT INTO course (id_course,course_name)
    VALUES (se_course.nextval,pCourseName);
    COMMIT;
END insertCourse;

-- =======================================================================

--7                      STUDENTXCOURSE PROCEDURE      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertStudentxCourse
(pIdStudent IN NUMBER,pIdCourse IN NUMBER,pIdStatus IN NUMBER )
AS
BEGIN
    INSERT INTO studentxcourse (id_studenxcourse,id_student,id_course,id_status)
    VALUES (se_studentxcourse.nextval,pIdStudent,pIdCourse,pIdStatus);
    COMMIT;
END insertStudentxCourse;




-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                INSERTS TO MAKE THE TESTS OF THE PROCEDURES
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--1                       INSERT INTO STUDENT TABLE
-- =======================================================================


--1 ______________________________________________________________________

DECLARE 
   vcFirstName      VARCHAR2(20):= 'Diego';
   vcSecondName     VARCHAR2(20):= 'Josue';
   vcFirstLastname  VARCHAR2(20):= 'Mora';
   vcSecondLastname VARCHAR2(20):= 'Araya';
   vcStudentCard    NUMBER(10):= 2020456781;
BEGIN
   insertStudent(vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;

--2 ______________________________________________________________________

DECLARE 
   vcFirstName      VARCHAR2(20):= 'Elena';
   vcSecondName     VARCHAR2(20):= 'Maria';
   vcFirstLastname  VARCHAR2(20):= 'Diaz';
   vcSecondLastname VARCHAR2(20):= 'Mora';
   vcStudentCard    NUMBER(10):= 2021456781;
BEGIN
   insertStudent(vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;

--3 ______________________________________________________________________

DECLARE 
   vcFirstName      VARCHAR2(20):= 'Antonio';
   vcSecondName     VARCHAR2(20):= 'Jose';
   vcFirstLastname  VARCHAR2(20):= 'Zambrano';
   vcSecondLastname VARCHAR2(20):= 'Flores';
   vcStudentCard    NUMBER(10):= 2022456781;
BEGIN
   insertStudent(vcFirstName,vcSecondName, vcFirstLastname,vcSecondLastname,vcStudentCard);
END;





-- =======================================================================

--2                       INSERT INTO EMAIL TABLE
-- =======================================================================


--1 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcEmailAddress    VARCHAR2(60):= 'josuemora@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;


--2 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcEmailAddress    VARCHAR2(60):= 'mariadiaz@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;

--3 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcEmailAddress    VARCHAR2(60):= 'josezambranoa@estudiantec.cr';
BEGIN
   insertEmail(vcIdStudent,vcEmailAddress);
END;





-- =======================================================================

--3                       INSERT INTO PHONE_TYPE TABLE
-- =======================================================================

-- Student 0
--1 ______________________________________________________________________

DECLARE 
   vcTypeName        VARCHAR2(20):= 'CellPhone';
BEGIN
   insertPhoneType(vcTypeName);
END;

--2 ______________________________________________________________________

DECLARE 
   vcTypeName        VARCHAR2(20):= 'Home';
BEGIN
   insertPhoneType(vcTypeName);
END;


-- =======================================================================

--4                       INSERT INTO PHONE TABLE
-- =======================================================================


--1 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdType	         NUMBER(6):= 1;
   vcPhoneNumber     NUMBER(8):= 86324577;
BEGIN
   insertPhone(vcIdStudent,vcIdType,vcPhoneNumber);
END;

--2 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdType	     NUMBER(6):= 1;
   vcPhoneNumber     NUMBER(8):= 88324507;
BEGIN
   insertPhone(vcIdStudent,vcIdType,vcPhoneNumber);
END;



--3 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdType	     NUMBER(6):= 2;
   vcPhoneNumber     NUMBER(8):= 22324500;
BEGIN
   insertPhone(vcIdStudent,vcIdType,vcPhoneNumber);
END;






-- =======================================================================

--5                       INSERT INTO STATUS TABLE
-- =======================================================================


--1 ______________________________________________________________________

DECLARE 
   vcDescription     VARCHAR2(20):= 'Approved';
BEGIN
   insertStatus(vcDescription);
END;

--2 ______________________________________________________________________

DECLARE 
   vcDescription     VARCHAR2(20):= 'Failed';
BEGIN
   insertStatus(vcDescription);
END;



--3 ______________________________________________________________________

DECLARE 
   vcDescription     VARCHAR2(20):= 'Pending';
BEGIN
   insertStatus(vcDescription);
END;


-- =======================================================================

--6                       INSERT INTO COURSE TABLE
-- =======================================================================


--1 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Introduction to Programming';
BEGIN
   insertCourse(vcCourseName);
END;


--2 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Differential Equations';
BEGIN
   insertCourse(vcCourseName);
END;


--3 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Microcomputer Architecture';
BEGIN
   insertCourse(vcCourseName);
END;



--4 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Microprocessors';
BEGIN
   insertCourse(vcCourseName);
END;


--5 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Math';
BEGIN
   insertCourse(vcCourseName);
END;



--6 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Data Structure';
BEGIN
   insertCourse(vcCourseName);
END;



--7 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'English';
BEGIN
   insertCourse(vcCourseName);
END;



--8 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Object-oriented programming';
BEGIN
   insertCourse(vcCourseName);
END;


--9 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Databases I';
BEGIN
   insertCourse(vcCourseName);
END;


--10 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Databases II';
BEGIN
   insertCourse(vcCourseName);
END;


--11 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Software design';
BEGIN
   insertCourse(vcCourseName);
END;



--12 ______________________________________________________________________

DECLARE 
   vcCourseName   VARCHAR2(40):= 'Project management';
BEGIN
   insertCourse(vcCourseName);
END;

-- =======================================================================

--7                    INSERT INTO STUDENTXCOURSE TABLE
-- =======================================================================


--1 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 1;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--2 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 2;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--3 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 3;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--4 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 4;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--5 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 5;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--6 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 6;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--7 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 7;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--8 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 8;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--9 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 9;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--10 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 10;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--11 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 11;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--12 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 1;
   vcIdCourse        NUMBER(6):= 12;
   vcIdStatus        NUMBER(6):= 3;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;

-- Student 1

--1 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 1;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--2 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 2;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--3 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 3;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--4 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 4;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--5 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 5;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--6 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 6;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--7 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 7;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--8 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 8;
   vcIdStatus        NUMBER(6):= 3;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--9 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 9;
   vcIdStatus        NUMBER(6):= 3;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--10 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 10;
   vcIdStatus        NUMBER(6):= 3;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--11 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 11;
   vcIdStatus        NUMBER(6):= 2;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--12 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 2;
   vcIdCourse        NUMBER(6):= 12;
   vcIdStatus        NUMBER(6):= 2;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;

-- Student 2

--1 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 1;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--2 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 2;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--3 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 3;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--4 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 4;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--5 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 5;
   vcIdStatus        NUMBER(6):= 1;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--6 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 6;
   vcIdStatus        NUMBER(6):= 2;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--7 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 7;
   vcIdStatus        NUMBER(6):= 2;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--8 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 8;
   vcIdStatus        NUMBER(6):= 2;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



--9 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 9;
   vcIdStatus        NUMBER(6):= 3;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--10 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 10;
   vcIdStatus        NUMBER(6):= 3;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--11 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 11;
   vcIdStatus        NUMBER(6):= 3;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;


--12 ______________________________________________________________________

DECLARE 
   vcIdStudent       NUMBER(6):= 3;
   vcIdCourse        NUMBER(6):= 12;
   vcIdStatus        NUMBER(6):= 3;
BEGIN
   insertStudentxCourse(vcIdStudent,vcIdCourse,vcIdStatus);
END;



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                               CURSOR 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--                             getCourses
-- =======================================================================


CREATE OR REPLACE PROCEDURE getCursos(pIdStudent IN student.id_student%TYPE, pStatus IN status.description%TYPE DEFAULT NULL)
AS

  CURSOR courseCursor IS
    SELECT s.first_name, s.second_name, s.first_lastname, s.second_lastname, c.course_name, st.description
    FROM student s
    INNER JOIN studentxcourse sc 
    ON s.id_student = sc.id_student
    INNER JOIN course c 
    ON sc.id_course = c.id_course
    INNER JOIN status st 
    ON sc.id_status = st.id_status
    WHERE s.id_student = pIdStudent 
      AND (pStatus IS NULL OR st.description = pStatus);

    vcFirstName student.first_name%TYPE;
    vcSecondName student.second_name%TYPE;
    vcFirstLastname student.first_lastname%TYPE;
    vcSecondLastname student.second_lastname%TYPE;
    vcCourseName course.course_name%TYPE;
    vcIdstatus status.description%TYPE;

BEGIN
  OPEN courseCursor;
  LOOP
    FETCH courseCursor INTO vcFirstName, vcSecondName, vcFirstLastname, vcSecondLastname, vcCourseName,  vcIdstatus;
    EXIT WHEN courseCursor%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(vcFirstName || ' ' || vcSecondName || ' ' || vcFirstLastname || ' ' || vcSecondLastname || ' | ' || vcCourseName || ' |' || vcIdstatus);
  END LOOP;
  CLOSE courseCursor;
END;

-- =======================================================================

--                             TESTS
-- =======================================================================

-- It is executed once to display the prints in the console
SET SERVEROUTPUT ON;

--1 ______________________________________________________________________
DECLARE
    vIdstudent NUMBER(6) := 1;
    vcstatus VARCHAR2(20) := 'Approved';

BEGIN
  getCursos(vIdstudent,vcstatus);
  
END;



DECLARE
    vIdstudent NUMBER(6) := 1;
    vcstatus VARCHAR2(20) := 'Pending';

BEGIN
  getCursos(vIdstudent,vcstatus);
END;

DECLARE
    vIdstudent NUMBER(6) := 1;

BEGIN
  getCursos(vIdstudent,NULL);
END;
--2 ______________________________________________________________________
DECLARE
    vIdstudent NUMBER(6) := 2;
    vcstatus VARCHAR2(20) := 'Approved';

BEGIN
  getCursos(vIdstudent,vcstatus);
  
END;

DECLARE
    vIdstudent NUMBER(6) := 2;
    vcstatus VARCHAR2(20) := 'Failed';

BEGIN
  getCursos(vIdstudent,vcstatus);
  
END;

DECLARE
    vIdstudent NUMBER(6) := 2;
    vcstatus VARCHAR2(20) := 'Pending';

BEGIN
  getCursos(vIdstudent,vcstatus);
END;

DECLARE
    vIdstudent NUMBER(6) := 2;

BEGIN
  getCursos(vIdstudent,NULL);
END;



--3 ______________________________________________________________________
DECLARE
    vIdstudent NUMBER(6) := 3;
    vcstatus VARCHAR2(20) := 'Approved';

BEGIN
  getCursos(vIdstudent,vcstatus);
  
END;

DECLARE
    vIdstudent NUMBER(6) := 3;
    vcstatus VARCHAR2(20) := 'Failed';

BEGIN
  getCursos(vIdstudent,vcstatus);
  
END;

DECLARE
    vIdstudent NUMBER(6) := 3;
    vcstatus VARCHAR2(20) := 'Pending';

BEGIN
  getCursos(vIdstudent,vcstatus);
END;

DECLARE
    vIdstudent NUMBER(6) := 3;

BEGIN
  getCursos(vIdstudent,NULL);
END;

