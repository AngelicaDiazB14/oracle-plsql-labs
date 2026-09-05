-- =======================================================================

--                             UNIVERSITY  TABLE 
-- =======================================================================
CREATE TABLE university
(
  id_university              NUMBER(6),
  university_name            VARCHAR2(40)
);

-- =======================================================================

--                              CAMPUS TABLE 
-- =======================================================================
CREATE TABLE campus
(
  id_campus                  NUMBER(6),
  id_university              NUMBER(6),
  campus_name                VARCHAR2(20)
);

-- =======================================================================

--                              CAREER TABLE 
-- =======================================================================
CREATE TABLE career
(
  id_career                  NUMBER(6),
  id_campus                  NUMBER(6),
  career_name                VARCHAR2(50)
);


-- =======================================================================

--                             STUDENT TABLE 
-- =======================================================================
CREATE TABLE student
(
  id_student                 NUMBER(6),
  id_career                  NUMBER(6),
  first_name                 VARCHAR2(20),
  second_name                VARCHAR2(20),
  first_lastname             VARCHAR2(25),
  second_lastname            VARCHAR2(25),
  student_card 	             NUMBER(10)
 
);


-- =======================================================================

--                             EMAIL TABLE 
-- =======================================================================
CREATE TABLE email
(
  id_email                  NUMBER(6),
  id_student                NUMBER(6),
  email_address             VARCHAR2(40)
);




-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                COMMENTS 
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--                       COMMENTS ON UNIVERSITY  TABLE 
-- =======================================================================

COMMENT ON TABLE university
IS 
 'Repository to store university information';
 
-- #.1
COMMENT ON COLUMN university.id_university
IS 
 'University identifier';

-- #.2
COMMENT ON COLUMN university.university_name
IS 
 'University name';


-- =======================================================================

--                       COMMENTS ON CAMPUS  TABLE 
-- =======================================================================

COMMENT ON TABLE campus
IS 
 'Repository to store campus information';

-- #.1
COMMENT ON COLUMN campus.id_campus
IS 
 'Campus identifier';

-- #.2
COMMENT ON COLUMN campus.id_university
IS 
 'Represents the university to which the campus belongs';

-- #.3
COMMENT ON COLUMN campus.campus_name
IS 
 'Campus name';



-- =======================================================================

--                       COMMENTS ON CAREER  TABLE 
-- =======================================================================

COMMENT ON TABLE career
IS 
 'Repository to store career information';
 
-- #.1
COMMENT ON COLUMN career.id_career
IS 
 'Career identifier';

-- #.2
COMMENT ON COLUMN career.id_campus
IS 
 'Represents the campus to which the career belongs';

-- #.3
COMMENT ON COLUMN career.career_name
IS 
 'Career name';


-- =======================================================================

--                       COMMENTS ON STUDENT  TABLE 
-- =======================================================================

COMMENT ON TABLE student
IS 
 'Repository to store student information';

-- #.1
COMMENT ON COLUMN student.id_student
IS 
 'Student identifier';

-- #.2
COMMENT ON COLUMN student.id_career
IS 
 'Represents the career to which the student belongs';

-- #.3
COMMENT ON COLUMN student.first_name
IS 
 'Student first name';

-- #.4
COMMENT ON COLUMN student.second_name
IS 
 'Student second name';

-- #.5
COMMENT ON COLUMN student.first_lastname
IS 
 'Student first last name';

-- #.6
COMMENT ON COLUMN student.second_lastname
IS 
 'Student second last name';

-- #.7
COMMENT ON COLUMN student.student_card
IS 
 'It is the student ID (student card) at the university';


-- =======================================================================

--                       COMMENTS ON EMAIL  TABLE 
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

