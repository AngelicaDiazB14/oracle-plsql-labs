-- =======================================================================

--                              PHONE TABLE 
-- =======================================================================
CREATE TABLE phone
(
  id_phone     NUMBER(6),
  phone_number NUMBER(8),
  id_type      NUMBER(6)
); 

-- =======================================================================

--                              TYPE TABLE 
-- =======================================================================
CREATE TABLE type
(
  id_type         NUMBER(6),	
  name            VARCHAR2(20)
);

-- =======================================================================

--                        PRIMARY KEY TYPE TABLE
-- =======================================================================

ALTER TABLE type
ADD
CONSTRAINT pk_type PRIMARY KEY (id_type)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--                       PRIMARY KEY  PHONE TABLE
-- =======================================================================

ALTER TABLE phone
ADD
CONSTRAINT pk_phone PRIMARY KEY (id_phone)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--                          PHONE CONSTRAINTS 
-- =======================================================================
ALTER TABLE phone
ADD
(
 CONSTRAINT phone_phoneNumber_nn CHECK(phone_number is NOT NULL),
 CONSTRAINT phone_validPhoneNumber_min CHECK(phone_number > 0 )
);
-- =======================================================================

--                          TYPE CONSTRAINT 
-- =======================================================================
ALTER TABLE type
ADD
(
 CONSTRAINT type_name_nn CHECK(name is NOT NULL)
);

-- =======================================================================

--                  ADD NEW FOREINGN KEY OF PHONE TABLE
-- =======================================================================


ALTER TABLE phone
ADD
CONSTRAINT fk_phone_type FOREIGN KEY (id_type) REFERENCES type(id_type);

-- =======================================================================

--                               ADD TYPES
-- =======================================================================

INSERT INTO type (id_type, name)
VALUES (1, 'HOME');
INSERT INTO type (id_type, name)
VALUES (2, 'CELLULAR_PHONE');
INSERT INTO type (id_type, name)
VALUES (3, 'OFFICE');
INSERT INTO type (id_type, name)
VALUES (4, 'OTHER');

-- =======================================================================

--                               ADD PHONES
-- =======================================================================

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (1, 2,89764532);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (2, 2,85213022);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (3, 2,82454510);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (4, 3,65767070);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (5, 3,60904532);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (6, 2,80809922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (7, 1,22780909);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (8, 1,22987867);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (9, 1,22900867);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (10, 2,80876922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (11, 2,80876922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (12, 3,40076922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (13, 2,60876952);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (14, 2,70876902);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (15, 2,60876911);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (16, 3,20871122);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (17, 3,20116922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (18, 2,80556922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (19, 2,81176922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (20, 1,20833922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (21, 3,80876944);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (22, 1,27087692);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (23, 1,23872922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (24, 1,20876922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (25, 3,20676922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (26, 2,80876922);

INSERT INTO phone (id_phone, id_type, phone_number)
VALUES (27, 3,40876922);
-- =======================================================================

--                           COMMENTS ON PHONE TABLE
-- =======================================================================


COMMENT ON TABLE phone
IS 
 'Repository to store phone information';
-- ...........................................................
COMMENT ON COLUMN phone.id_type
IS 
 'Phone type';
-- ...........................................................
COMMENT ON COLUMN phone.phone_number
IS 
 'Phone number';
-- ...........................................................

-- =======================================================================

--                          COMMENTS ON TYPE TABLE
-- =======================================================================
                     

COMMENT ON TABLE type
IS 
 'Repository to store type information';
 -- ...........................................................
 COMMENT ON COLUMN type.name
IS 
 'Type name';

- =======================================================================

--                          phonexemployee TABLE
-- =======================================================================

CREATE TABLE phonexemployee
(
  id_phonexemployee         NUMBER(6),	
  id_phone                  NUMBER(6),	
  id_employee               NUMBER(6)
);

- =======================================================================

--                    PRIMARY KEY phonexemployee TABLE
-- =======================================================================

ALTER TABLE phonexemployee 
ADD
CONSTRAINT pk_phonexemployee  PRIMARY KEY (id_phonexemployee )
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--                    FOREIGN KEY phonexemployee TABLE
-- =======================================================================
ALTER TABLE phonexemployee
ADD
(
    CONSTRAINT fk_phonexemployee_employee FOREIGN KEY (id_employee) REFERENCES employee(id_employee),
    CONSTRAINT fk_phonexemployee_phone FOREIGN KEY (id_phone) REFERENCES phone(id_phone)
);


- =======================================================================

--                   COMMENTS ON phonexemployee TABLE
-- =======================================================================


COMMENT ON TABLE phonexemployee
IS 
 'Repository to store phonexemployee information';
 -- ....................................................................
COMMENT ON COLUMN phonexemployee.id_employee
IS 
 'Table phonexemployee id employee';
-- .....................................................................
 
COMMENT ON COLUMN phonexemployee.id_phone
IS 
 'Table phonexemployee id phone';


- =======================================================================

--                      INSERT PEOPLE WITH PHONE
-- =======================================================================


--1 .....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (1, 2,11);

--2 .....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (2, 8,11);

--3 .....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (3, 1,1);

--4 .....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (4, 3,2);

--5 .....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (5, 4,3);

--6 .....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (6, 5,4);

--7 .....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (7, 6,5);

--8 .....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (8, 7,6);

--9 .....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (9, 10,7);

--10 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (10, 11,8);

--11 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (11, 12,9);

--12 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (12, 13,12);

--13 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (13, 14,13);

--14 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (14, 15,14);

--15 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (15, 16,15);

--16 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (16, 17,16);

--17 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (17, 18,17);

--18 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (18, 19,18);

--19 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (19, 20,19);

--20 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (20, 21,20);

--21 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (21, 22,11);
--22 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (22, 17,3);

--23 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (23, 17,1);

--24 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (24, 23,19);

--25....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (25, 23,18);

--26 ....................................................................
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (26, 23,14);


-- =======================================================================

--                                QUERIE
-- =======================================================================

SELECT e.id_employee, e.first_name, COUNT(pxe.id_phonexemployee) AS count_phones
FROM employee e
INNER JOIN phonexemployee pxe 
ON e.id_employee = pxe.id_employee
GROUP BY e.id_employee, e.first_name;


 







