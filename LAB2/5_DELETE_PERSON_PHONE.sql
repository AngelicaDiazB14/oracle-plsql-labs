--    CREATE TYPE ENTITY
CREATE TABLE phonexemployee
(
  id_phonexemployee         NUMBER(6),	
  id_phone                  NUMBER(6),	
  id_employee               NUMBER(6)
);

--         PRIMARY KEY PEOPLE TABLE
ALTER TABLE phonexemployee 
ADD
CONSTRAINT pk_phonexemployee  PRIMARY KEY (id_phonexemployee )
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

ALTER TABLE phonexemployee
ADD
(
    CONSTRAINT fk_phonexemployee_employee FOREIGN KEY (id_employee) REFERENCES employee(id_employee),
    CONSTRAINT fk_phonexemployee_phone FOREIGN KEY (id_phone) REFERENCES phone(id_phone)
);



--      INSERT PEOPLE WITH PHONE
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (1, 2,11);
INSERT INTO phonexemployee ( id_phonexemployee, id_phone, id_employee)
VALUES (2, 8,11);
--      DELETE PEOPLE WITH PHONE
DELETE FROM phonexemployee
WHERE  id_employee = 11;


--What's going on? Justify your answer.
-- After deleting the employee, the data that was in the phonexemployee table of telephone 1 and 2 is deleted



--                         COMMENTS ON EMPLOYEE TABLE

COMMENT ON TABLE phonexemployee
IS 
 'Repository to store phonexemployee information';
 -- ...........................................................
COMMENT ON COLUMN phonexemployee.id_employee
IS 
 'Table phonexemployee id employee';
-- ...........................................................
 
COMMENT ON COLUMN phonexemployee.id_phone
IS 
 'Table phonexemployee id phone';
-- ...........................................................