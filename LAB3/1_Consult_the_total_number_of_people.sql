-- =======================================================================

--                              EMPLOYEE  TABLE 
-- =======================================================================
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

-- =======================================================================

--                               PRIMARY KEY
-- =======================================================================

ALTER TABLE employee
ADD
CONSTRAINT pk_employee PRIMARY KEY (id_employee)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- =======================================================================

--                               CONSTRAINTS 
-- =======================================================================

ALTER TABLE employee
ADD
(
 CONSTRAINT employee_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT employee_secondName_nn CHECK(second_name is NOT NULL),
 CONSTRAINT employee_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT employee_secondLastname_nn CHECK(second_lastname   is NOT NULL),
 CONSTRAINT employee_salary_nn CHECK(salary is NOT NULL),
 CONSTRAINT employee_validsalary_min CHECK(salary>0),
 CONSTRAINT employee_birthday_nn CHECK(birthdate is NOT NULL)

);

-- =======================================================================

--                                COMMENTS 
-- =======================================================================

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


-- =======================================================================

--                                INSERTS 
-- =======================================================================

--1 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (1, 'Diego','Josue','Mora','Araya',2000,TO_DATE('23/03/2002','DD/MM/YYYY'));

--2 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (2, 'Elena','Maria','Diaz','Mora',2780,TO_DATE('02/03/2004','DD/MM/YYYY'));
--3 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (3, 'Amanda','Sol','Diaz','Mora',2999,TO_DATE('04/03/1990','DD/MM/YYYY'));
--4 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (4, 'Amilcar','Naranjo','Sans','Alcazar',8400,TO_DATE('13/07/1993','DD/MM/YYYY'));
--5 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (5, 'betsy','Soledad', 'Dominguez', 'Roman',3000,TO_DATE('20/11/2001','DD/MM/YYYY'));
--6 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (6, 'Arcelia', 'Rosado',' Gibert', 'Roman',840,TO_DATE('17/08/2002','DD/MM/YYYY'));
--7 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (7, 'Pili', 'Casado', 'Torre', 'Roman',2000,TO_DATE('10/02/2005','DD/MM/YYYY'));
--8 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (8, 'Segismundo',' Mesa','Amores', 'Torres',9900,TO_DATE('11/11/1997','DD/MM/YYYY'));
--9 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (9, 'Brandon','Reyes','Campillo', 'Torres',4500,TO_DATE('14/09/2003','DD/MM/YYYY'));
--10 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (10, 'Cesar', 'Gisbert',' Galiano', 'Artavia',4560,TO_DATE('19/04/2000','DD/MM/YYYY'));
--11 _____________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (11, 'Benita','Hidalgo','Sola', 'Artavia',9500,TO_DATE('14/09/2000','DD/MM/YYYY'));
--12 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (12, 'Placido','Escamilla','Baro', 'Cisnero',3450,TO_DATE('08/08/2005','DD/MM/YYYY'));
--13 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (13, 'Angelica','Maria','Ledesma', 'Cisnero',5000,TO_DATE('19/03/2002','DD/MM/YYYY'));
--14 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (14, 'Efrain','Barranco','Arnal', 'Baro',1000,TO_DATE('13/03/2002','DD/MM/YYYY'));
--15 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (15, 'Aaron ','Escamilla','Bou', 'Cisnero',895,TO_DATE('14/03/2005','DD/MM/YYYY'));
--16* _____________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (16, 'Ceferino','Maria','Naranjo', 'Escamilla',21000,TO_DATE('24/10/2002','DD/MM/YYYY'));
--17 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (17, 'Arsenio','Jose','Angel','Huguet',345000,TO_DATE('12/05/2009','DD/MM/YYYY'));
--18* _____________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (18, 'Lidia', 'Valles', 'Anglada', 'Cisnero',19000,TO_DATE('10/03/2005','DD/MM/YYYY'));
--19 ______________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (19, 'Fidel','Zamora','Casanovas', 'Escamilla',1780,TO_DATE('13/03/2005','DD/MM/YYYY'));
--20* _____________________________________________________________________________________________________
INSERT INTO employee (id_employee,first_name,second_name,first_lastname,second_lastname,salary,birthdate)
VALUES (20, 'David','Josue','Centeno','Araya',20000,TO_DATE('13/03/2005','DD/MM/YYYY'));


-- =======================================================================

--                                QUERIE
-- =======================================================================

SELECT COUNT(1)
FROM employee;