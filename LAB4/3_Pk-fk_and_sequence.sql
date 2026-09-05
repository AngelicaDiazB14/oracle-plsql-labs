-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                               PRIMARY KEYS 
--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--                       PRIMARY KEY UNIVERSITY  TABLE 
-- =======================================================================

ALTER TABLE university
ADD
CONSTRAINT pk_university PRIMARY KEY (id_university)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--                          PRIMARY KEY CAMPUS TABLE 
-- =======================================================================


ALTER TABLE campus
ADD
CONSTRAINT pk_campus PRIMARY KEY (id_campus)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--                           PRIMARY KEY CAREER TABLE 
-- =======================================================================

ALTER TABLE career
ADD
CONSTRAINT pk_career PRIMARY KEY (id_career)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--                          PRIMARY KEY STUDENT TABLE 
-- =======================================================================

ALTER TABLE student
ADD
CONSTRAINT pk_student PRIMARY KEY (id_student)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


-- =======================================================================

--                          PRIMARY KEY EMAIL TABLE 
-- =======================================================================

ALTER TABLE email
ADD
CONSTRAINT pk_email PRIMARY KEY (id_email)
USING INDEX
TABLESPACE un_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);




-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                                 FOREIGN KEYS
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--                           FOREIGN KEY CAMPUS TABLE 
-- =======================================================================

ALTER TABLE campus
ADD
CONSTRAINT fk_campus_university FOREIGN KEY (id_university) REFERENCES university(id_university);


-- =======================================================================

--                          FOREIGN KEY CAREER TABLE 
-- =======================================================================

ALTER TABLE career
ADD
CONSTRAINT fk_career_campus FOREIGN KEY (id_campus) REFERENCES campus(id_campus);


-- =======================================================================

--                         FOREIGN KEY STUDENT TABLE 
-- =======================================================================

ALTER TABLE student
ADD
CONSTRAINT fk_student_career FOREIGN KEY (id_career) REFERENCES career(id_career);


-- =======================================================================

--                         FOREIGN KEY EMAIL TABLE 
-- =======================================================================

ALTER TABLE email
ADD
CONSTRAINT fk_email_student FOREIGN KEY (id_student) REFERENCES student(id_student);



-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                               SEQUENCES 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- =======================================================================

--                    SEQUENCE OF PRIMARY KEY UNIVERSITY
-- =======================================================================

CREATE SEQUENCE se_university
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;


-- =======================================================================

--                    SEQUENCE OF PRIMARY KEY CAMPUS
-- =======================================================================

CREATE SEQUENCE se_campus
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;

-- =======================================================================

--                    SEQUENCE OF PRIMARY KEY CAREER
-- =======================================================================

CREATE SEQUENCE se_career
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;

-- =======================================================================

--                    SEQUENCE OF PRIMARY KEY STUDENT
-- =======================================================================

CREATE SEQUENCE se_student
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;

-- =======================================================================

--                    SEQUENCE OF PRIMARY KEY EMAIL
-- =======================================================================


CREATE SEQUENCE se_email
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 100000
NOCACHE
NOCYCLE;