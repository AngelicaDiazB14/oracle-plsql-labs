

--          TABLES
CREATE TABLE employee
(
  id_employee              NUMBER(6),
  first_name               VARCHAR2(20),
  second_name              VARCHAR2(20),
  first_lastname           VARCHAR2(25),
  second_lastname          VARCHAR2(25),
  salary 	               NUMBER(7),
  birthdate		           DATE
);

--         PRIMARY KEY employee TABLE
ALTER TABLE employee
ADD
CONSTRAINT pk_employee PRIMARY KEY (id_employee)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

ALTER TABLE employee
ADD
(
 CONSTRAINT employee_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT employee_firstName_nn CHECK(second_name is NOT NULL),
 CONSTRAINT employee_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT employee_secondLastname_nn CHECK(second_lastname   is NOT NULL),
 CONSTRAINT employee_salary_nn CHECK(salary is NOT NULL),
  CONSTRAINT employee_validsalary_min CHECK(salary>0),
  CONSTRAINT employee_birthday_nn CHECK(birthday is NOT NULL)

);


INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (1, 'Diego','Josue','Mora','Araya',500000,TO_DATE('23/03/2002','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (2, 'Elena','Maria','Diaz','Mora',840000,TO_DATE('02/03/2004','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (3, 'Amanda','Sol','Diaz','Mora',840000,TO_DATE('04/03/1990','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (4, 'Amilcar','Naranjo','Sans','Alcazar',840000,TO_DATE('13/07/1993','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (5, 'Piedad','Soledad', 'Dominguez', 'Roman',840000,TO_DATE('20/11/2001','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (6, 'Arcelia', 'Rosado',' Gibert', 'Roman',840000,TO_DATE('17/08/2002','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (7, 'Pili', 'Casado', 'Torre', 'Roman',200000,TO_DATE('10/02/2005','DD/MM/YYYY'));
--
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (8, 'Segismundo',' Mesa','Amores', 'Torres',990000,TO_DATE('11/11/1997','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (9, 'Pepito','Reyes','Campillo', 'Torres',450000,TO_DATE('14/09/2003','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (10, 'Cesar', 'Gisbert',' Galiano', 'Artavia',456000,TO_DATE('19/04/2000','DD/MM/YYYY'));
--
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (11, 'Benita','Hidalgo','Sola', 'Artavia',950000,TO_DATE('14/09/2000','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (12, 'Placido','Escamilla','Baro', 'Cisnero',345000,TO_DATE('08/08/2005','DD/MM/YYYY'));
--
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (13, 'Angelica','Josue','Ledesma', 'Cisnero',970000,TO_DATE('19/03/2002','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (14, 'Efrain','Barranco','Arnal', 'Baro',689000,TO_DATE('13/03/2002','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (15, 'Aaron ','Escamilla','Bou', 'Cisnero',89500,TO_DATE('14/03/2005','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (16, 'Ceferino','Maria','Naranjo', 'Escamilla',190000,TO_DATE('24/10/2002','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (17, 'Arsenio','Jose','Angel','Huguet',345000,TO_DATE('12/05/2009','DD/MM/YYYY'));
--
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (18, 'Lidia', 'Valles', 'Anglada', 'Cisnero',980000,TO_DATE('10/03/2005','DD/MM/YYYY'));

INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (19, 'Fidel','Zamora','Casanovas', 'Escamilla',300000,TO_DATE('13/03/2005','DD/MM/YYYY'));
--
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (20, 'David','Josue','Centeno','Araya',960000,TO_DATE('13/03/2005','DD/MM/YYYY'));



--	Questions

--Which language corresponds to the creation of the table?
--The language used to create tables is DDL.
--What language does the insertion correspond to?
--The insert corresponds to the DML language.
--Exit the DB and re-enter. Are the data you recorded? Justify your answer.
--After leaving the database, the data present in the table remained in it, without any modification.

--                         COMMENTS ON EMPLOYEE TABLE

COMMENT ON TABLE employee
IS 
 'Repository to store employee information';
 -- ...........................................................
COMMENT ON COLUMN employee.first_name
IS 
 'Employee first name';
-- ...........................................................
COMMENT ON COLUMN employee.second_name
IS 
 'Employee second name';
-- ...........................................................
COMMENT ON COLUMN employee.first_lastname
IS 
 'Employee first last name';
-- ...........................................................
COMMENT ON COLUMN employee.second_lastname
IS 
 'Employee second last name';
-- ...........................................................
COMMENT ON COLUMN employee.birthdate
IS 
 'Employee birthdate';
-- ...........................................................
COMMENT ON COLUMN employee.salary
IS 
 'Employee salary';