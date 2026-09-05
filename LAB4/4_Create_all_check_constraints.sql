-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                      CONSTRAINTS OF THE TABLES
-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--                  CONSTRAINTS OF UNIVERSITY TABLE
-- =======================================================================

ALTER TABLE university
ADD CONSTRAINT university_universityName_nn CHECK(university_name is NOT NULL);


-- =======================================================================

--                  CONSTRAINTS OF CAMPUS TABLE
-- =======================================================================

ALTER TABLE campus
ADD
(
 CONSTRAINT campus_idUniversity_nn CHECK(id_university is NOT NULL),
 CONSTRAINT campus_campusName_nn CHECK(campus_name is NOT NULL)
);

-- =======================================================================

--                  CONSTRAINTS OF CAREER TABLE
-- =======================================================================

ALTER TABLE career
ADD 
(
 CONSTRAINT career_idCampus_nn CHECK(id_campus is NOT NULL),
 CONSTRAINT career_careerName_nn CHECK(career_name is NOT NULL)
);

-- =======================================================================

--                  CONSTRAINTS OF STUDENT TABLE
-- =======================================================================

ALTER TABLE student
ADD
(
 CONSTRAINT student_idCareer_nn CHECK(id_career is NOT NULL),
 CONSTRAINT student_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT student_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT student_secondLastname_nn CHECK(second_lastname   is NOT NULL),
 CONSTRAINT student_studentCard_nn CHECK(student_card   is NOT NULL),
 CONSTRAINT student_validStudentCard_min CHECK(student_card   > 0)
);


-- =======================================================================

--                  CONSTRAINTS OF EMAIL TABLE
-- =======================================================================

ALTER TABLE email
ADD 
(
 CONSTRAINT email_idStudent_nn CHECK(id_student is NOT NULL),
 CONSTRAINT email_emailAddress_nn CHECK(email_address is NOT NULL)
);





