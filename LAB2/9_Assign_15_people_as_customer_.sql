-- First create the necessary tables to be able to make the corresponding assignments.

-- =======================================================================

--                                TABLES 
-- =======================================================================
-- #1
CREATE TABLE person
(
  id_person           NUMBER(6),
  first_name          VARCHAR2(20),
  second_name         VARCHAR2(20),
  first_lastname      VARCHAR2(25),
  second_lastname     VARCHAR2(25),
  birthdate           DATE 
);

-- #2
CREATE TABLE customer
(
  id_customer         NUMBER(6),
  id_person           NUMBER(6),
  entry_date          DATE
);

-- #3
CREATE TABLE purchase
(
  id_purchase         NUMBER(6),
  id_customer         NUMBER(6),
  entry_date          DATE
);

-- #4
CREATE TABLE product
(
  id_product          NUMBER(6),
  name                VARCHAR2(20),
  price               NUMBER(7)
);

-- #5
CREATE TABLE productxpurchase
(
  id_productx_purchase  NUMBER(6),
  id_purchase		NUMBER(6),
  id_product            NUMBER(6),
  amount                NUMBER(7)
);

-- =======================================================================

--                             PRIMARY KEYS 
-- =======================================================================

--#1 PRIMARY KEY PERSON TABLE
ALTER TABLE person
ADD
CONSTRAINT pk_person PRIMARY KEY (id_person)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


--#2        PRIMARY KEY CUSTOMER TABLE
ALTER TABLE customer
ADD
CONSTRAINT pk_customer PRIMARY KEY (id_customer)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


--#3        PRIMARY KEY PURCHASE TABLE
ALTER TABLE purchase
ADD
CONSTRAINT pk_purchase PRIMARY KEY (id_purchase)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


--#4        PRIMARY KEY PRODUCT TABLE
ALTER TABLE product
ADD
CONSTRAINT pk_product PRIMARY KEY (id_product)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


--#5        PRIMARY KEY PRODUCTXPURCHASE TABLE
ALTER TABLE productxpurchase
ADD
CONSTRAINT pk_productxpurchase PRIMARY KEY (id_productx_purchase)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);




-- =======================================================================

--                             FOREIGN KEYS
-- =======================================================================

--                      FOREIGN KEY CUSTOMER TABLE

ALTER TABLE customer
ADD
CONSTRAINT fk_customer_person FOREIGN KEY (id_person) REFERENCES person(id_person);


--                       FOREIGN KEY PURCHASE TABLE

ALTER TABLE purchase
ADD
CONSTRAINT fk_purchase_customer FOREIGN KEY (id_customer) REFERENCES customer(id_customer);


--                  FOREIGN KEY PRODUCTXPURCHASE TABLE

ALTER TABLE productxpurchase
ADD
CONSTRAINT fk_productxpurchase_purchase FOREIGN KEY (id_purchase) REFERENCES purchase(id_purchase);


--                  FOREIGN KEY PRODUCTXPURCHASE TABLE


ALTER TABLE productxpurchase
ADD
CONSTRAINT fk_productxpurchase_product FOREIGN KEY (id_product) REFERENCES product(id_product);


- =======================================================================

--                      CONSTRAINTS OF THE TABLES
-- =======================================================================


-- #1
ALTER TABLE person
ADD
(
 CONSTRAINT person_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT person_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT person_secondLastname_nn CHECK(second_lastname   is NOT NULL),
 CONSTRAINT person_birthdate_nn CHECK(birthdate   is NOT NULL)
);

-- #2
ALTER TABLE customer
ADD
(
 CONSTRAINT customer_idPerson_nn CHECK(id_person is NOT NULL),
 CONSTRAINT customer_entryDate_nn CHECK(entry_date is NOT NULL)
);

-- #3
ALTER TABLE purchase
ADD
(
 CONSTRAINT purchase_idCustomer_nn CHECK(id_customer is NOT NULL),
 CONSTRAINT purchase_entryDate_nn CHECK(entry_date is NOT NULL)
);

-- #4
ALTER TABLE product
ADD
(
 CONSTRAINT product_name_nn CHECK(name is NOT NULL),
 CONSTRAINT product_price_nn CHECK(price is NOT NULL),
 CONSTRAINT product_validprice_min CHECK(price > 0)
);

-- #5
ALTER TABLE productxpurchase
ADD
(
 CONSTRAINT productxpurch_idShopping_nn CHECK(id_purchase is NOT NULL),
 CONSTRAINT productxpurch_idProduct_nn CHECK(id_product is NOT NULL ),
 CONSTRAINT productxpurch_amount_nn CHECK(amount is NOT NULL ),
 CONSTRAINT productxpurch_validAmount_min CHECK(amount > 0)
);

-- =======================================================================

--                             COMMENTS ON TABLES
-- =======================================================================


--                         COMMENTS ON PERSON TABLE

COMMENT ON TABLE person
IS 
 'Repository to store the information of people in general';

-- ...........................................................

COMMENT ON COLUMN person.first_name
IS 
 'First name of the person';
-- ...........................................................
COMMENT ON COLUMN person.second_name
IS 
 'Second name of the person';
-- ...........................................................
COMMENT ON COLUMN person.first_lastname
IS 
 'First last name of the person';
-- ...........................................................
COMMENT ON COLUMN person.second_lastname
IS 
 'Second last name of the person';
-- ...........................................................
COMMENT ON COLUMN person.birthdate
IS 
 'Date of birth of the person';


birthdate

--                         COMMENTS ON CUSTOMER TABLE

COMMENT ON TABLE customer
IS 
 'Repository to store customer information';
-- ...........................................................
COMMENT ON COLUMN customer.id_person
IS 
 'ID of the person who is a customer';
-- ...........................................................
COMMENT ON COLUMN customer.entry_date
IS 
 'Date the person became a customer';



--                         COMMENTS ON PURCHASE TABLE

COMMENT ON TABLE purchase
IS 
 'Repository to store purchase information';
-- ...........................................................
COMMENT ON COLUMN purchase.id_customer
IS 
 'ID of the customer who makes the purchase';
-- ...........................................................
COMMENT ON COLUMN purchase.entry_date
IS 
 'Date the customer makes the purchase';



--                         COMMENTS ON PRODUCT TABLE

COMMENT ON TABLE product
IS 
 'Repository to store product information';
-- ...........................................................
COMMENT ON COLUMN product.name
IS 
 'Product name';
-- ...........................................................
COMMENT ON COLUMN product.price
IS 
 'Price of the product';


--                    COMMENTS ON PRODUCTXPURCHASE TABLE

COMMENT ON TABLE productxpurchase
IS 
 'Repository to store the information of the products for purchases';
-- ...........................................................
COMMENT ON COLUMN productxpurchase. id_productx_purchase
IS 
 'General id of the table of products by purchases';
-- ...........................................................
COMMENT ON COLUMN productxpurchase.id_purchase
IS 
 'Purchase id';
-- ...........................................................
COMMENT ON COLUMN productxpurchase.id_product
IS 
 'Product id';
-- ...........................................................
COMMENT ON COLUMN productxpurchase.amount
IS 
 'Quantity of the product to buy';
 



--                     REGISTRATION OF 20 PEOPLE


-- #1............................................................................

INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (1,'Antonio','Jose','Zambrano','Flores',TO_DATE('25/12/2004','DD/MM/YYYY'));

-- #2............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (2,'Francisco','Manuel','Soto','Lee',TO_DATE('14/09/2001','DD/MM/YYYY'));

-- #3............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (3,'Marta','Josefa','Smith','Roux',TO_DATE('11/08/1995','DD/MM/YYYY'));

-- #4............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (4,'Isabel','Francisca','Torres','Castillo',TO_DATE('01/05/1999','DD/MM/YYYY'));

-- #5............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (5,'Pilar','Guadalupe','Cruz','Morales',TO_DATE('28/09/1986','DD/MM/YYYY'));
/
-- #6............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (6,'Ana','Rosario','Castro','Reyes',TO_DATE('10/04/1989','DD/MM/YYYY'));

-- #7............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (7,'Joaquin','Fernando','Romero','Moreno',TO_DATE('30/11/2003','DD/MM/YYYY'));

-- #8............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (8,'Carlos','Alberto','Rivera','Vargas',TO_DATE('13/02/1998','DD/MM/YYYY'));

-- #9............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (9,'Raquel','Mercedes','Medina','Arias',TO_DATE('01/01/2000','DD/MM/YYYY'));

-- #10............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (10,'Irene','Teresa','Campos','Sandoval',TO_DATE('09/06/1983','DD/MM/YYYY'));

-- #11............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (11,'Paula','Petronila','Gallardo','Bravo',TO_DATE('08/02/1999','DD/MM/YYYY'));

-- #12............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (12,'Beatriz','Julia','Olivares','Orellana',TO_DATE('19/07/1988','DD/MM/YYYY'));

-- #13............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (13,'Vicente','Emilio','Saavedra','Parra',TO_DATE('04/10/1980','DD/MM/YYYY'));

-- #14............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (14,'Kevin','Isaac','Barrios','Cano',TO_DATE('03/03/2004','DD/MM/YYYY'));

-- #15............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (15,'Brandon','Pascual','Parras','Torres',TO_DATE('01/12/1982','DD/MM/YYYY'));

-- #16............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (16,'Carolina','Esther','Porras','Romero',TO_DATE('13/11/2001','DD/MM/YYYY'));

-- #17............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (17,'David','Miguel','Lagos','Palma',TO_DATE('18/04/2002','DD/MM/YYYY'));

-- #18............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (18,'Mario','Santiago','Pino','Maldonado',TO_DATE('19/05/2001','DD/MM/YYYY'));

-- #19............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (19,'Andrea','Rosario','Salinas','Escobar',TO_DATE('23/11/1990','DD/MM/YYYY'));

-- #20............................................................................
INSERT INTO person (id_person, first_name, second_name, first_lastname, second_lastname, birthdate)
VALUES (20,'Luisa','Amparo','Venegas','Ortega',TO_DATE('15/12/1991','DD/MM/YYYY'));


--                    ASSIGN 15 PEOPLE AS CUSTOMERS



-- #1............................................................................
INSERT INTO customer (id_customer,id_person,entry_date) 
VALUES (1,3,TO_DATE('15/12/2015','DD/MM/YYYY'));

-- #2............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (2,5,TO_DATE('10/11/2020','DD/MM/YYYY'));

-- #3............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (3,1,TO_DATE('01/09/2022','DD/MM/YYYY'));

-- #4............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (4,4,TO_DATE('01/04/2021','DD/MM/YYYY'));

-- #5............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (5,6,TO_DATE('15/01/2023','DD/MM/YYYY'));

-- #6............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (6,7,TO_DATE('28/03/2019','DD/MM/YYYY'));

-- #7............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (7,8,TO_DATE('15/12/2018','DD/MM/YYYY'));

-- #8............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (8,10,TO_DATE('22/02/2023','DD/MM/YYYY'));

-- #9............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (9,11,TO_DATE('30/11/2017','DD/MM/YYYY'));

-- #10............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (10,15,TO_DATE('15/12/2011','DD/MM/YYYY'));

-- #11............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (11,16,TO_DATE('20/10/2023','DD/MM/YYYY'));

-- #12............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (12,20,TO_DATE('30/05/2022','DD/MM/YYYY'));

-- #13............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (13,18,TO_DATE('11/09/2021','DD/MM/YYYY'));

-- #14............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (14,17,TO_DATE('30/08/2022','DD/MM/YYYY'));

-- #15............................................................................
INSERT INTO customer (id_customer,id_person,entry_date)
VALUES (15,19,TO_DATE('01/01/2020','DD/MM/YYYY'));
