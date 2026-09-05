--            RENAME PEOPLE TABLE WITH THE NAME: EMPLOYEE

ALTER TABLE people RENAME TO employee;


--            CHANGE EVERYTHING THAT IS REFERENCED WITH THE PEOPLE NAME

-- DROP CONSTRAINTS

ALTER TABLE employee
DROP CONSTRAINT people_firstName_nn;
ALTER TABLE employee
DROP CONSTRAINT people_firstLastname_nn;
ALTER TABLE employee
DROP CONSTRAINT people_secondLastname_nn;


--            ADD NEW CONSTRAINTS

ALTER TABLE employee
ADD
(
 CONSTRAINT employee_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT employee_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT employee_secondLastname_nn CHECK(second_lastname   is NOT NULL)
);



--           RENAME COLUMN OF EMPLOYEE TABLE

ALTER TABLE employee
RENAME COLUMN id_people TO id_employee;


--           RENAME COLUMN OF PHONE TABLE

ALTER TABLE phone
RENAME COLUMN id_people TO id_employee;

--          DROP FOREINGN KEY OF PHONE TABLE

ALTER TABLE phone
DROP CONSTRAINT fk_phone_people;

--          DROP PRIMARY KEY OF EMPLOYEE TABLE

ALTER TABLE employee
DROP CONSTRAINT pk_people;

--          ADD NEW PRIMARY KEY OF EMPLOYEE TABLE

ALTER TABLE employee
ADD
CONSTRAINT pk_employee PRIMARY KEY (id_employee)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);




--          ADD NEW FOREINGN KEY OF PHONE TABLE

ALTER TABLE phone
ADD
CONSTRAINT fk_phone_employee FOREIGN KEY (id_employee) REFERENCES employee(id_employee);