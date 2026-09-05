--                           TABLES CREATION
-- 1 .....................................................
CREATE TABLE customer 
(
  id_customer      NUMBER(6),
  first_name       VARCHAR2(20),
  second_name      VARCHAR2(20),
  first_lastname   VARCHAR2(25),
  second_lastname  VARCHAR2(25)
);


-- 2 .....................................................
CREATE TABLE web_order
(
  id_order      NUMBER(6),
  id_customer   NUMBER(6)
  
);

-- 3 .....................................................
CREATE TABLE food 
(
  id_food    NUMBER(6),
  id_type    NUMBER(6),
  price      NUMBER(6),
  quantity   NUMBER(6),
  name_food  VARCHAR2(20)
);

-- 4 .....................................................
CREATE TABLE foodtype
(
  id_type        NUMBER(6),
  name_type      VARCHAR2(20)
);

-- 5 .....................................................
CREATE TABLE foodxorder 
(
  id_food_xorder NUMBER(6),
  id_food        NUMBER(6),
  id_order       NUMBER(6)
);

--                         PK AND FK CONSTRAINTS

-- 1                      PRIMARY KEY TABLE CUSTOMER

ALTER TABLE customer
ADD
CONSTRAINT pk_customer PRIMARY KEY (id_customer)
USING INDEX
TABLESPACE ad_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


-- 2                      PRIMARY KEY TABLE ORDER

ALTER TABLE web_order
ADD
CONSTRAINT pk_order PRIMARY KEY (id_order)
USING INDEX
TABLESPACE ad_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


-- 3                      PRIMARY KEY TABLE FOOD

ALTER TABLE food
ADD
CONSTRAINT pk_food PRIMARY KEY (id_food)
USING INDEX
TABLESPACE ad_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


-- 4                      PRIMARY KEY TABLE FOODTYPE

ALTER TABLE foodtype
ADD
CONSTRAINT pk_foodtype PRIMARY KEY (id_type)
USING INDEX
TABLESPACE ad_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

-- 5                      PRIMARY KEY TABLE FOODXORDER

ALTER TABLE foodxorder
ADD
CONSTRAINT pk_foodxorder PRIMARY KEY (id_food_xorder)
USING INDEX
TABLESPACE ad_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


-- ...................................................................................

--                          FOREIGN KEY TABLE ORDER

ALTER TABLE web_order
ADD
CONSTRAINT fk_order_customer FOREIGN KEY (id_customer) REFERENCES customer(id_customer);



--                          FOREIGN KEY TABLE FOOD

ALTER TABLE food
ADD
CONSTRAINT fk_food_foodType FOREIGN KEY (id_type) REFERENCES foodType(id_type);


--                         FOREIGN KEY TABLE FOODXORDER

ALTER TABLE foodxorder
ADD
(
  CONSTRAINT fk_foodxorder_food FOREIGN KEY (id_food) REFERENCES food(id_food),
  CONSTRAINT fk_foodxorder_order FOREIGN KEY (id_order) REFERENCES web_order(id_order)
);
-- .....................................................................................
--                             CONSTRAINTS CREATION


--                         CONSTRAINTS IN CUSTOMER TABLE
ALTER TABLE customer
ADD
(
 CONSTRAINT customer_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT customer_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT customer_secondLastname_nn CHECK(second_lastname   is NOT NULL)
);


--                          CONSTRAINTS IN FOOD TABLE
ALTER TABLE food
ADD
(
 CONSTRAINT food_price_nn CHECK(price is NOT NULL),
 CONSTRAINT food_validPrice_min CHECK(price > 0),
 CONSTRAINT food_quantity_nn CHECK(quantity  is NOT NULL),
 CONSTRAINT food_validQuantity_min CHECK(quantity > 0),
 CONSTRAINT food_nameFood_nn CHECK(name_food   is NOT NULL)
);


--                            CONSTRAINTS IN FOODTYPE TABLE
ALTER TABLE foodtype
ADD CONSTRAINT foodtype_nameType_nn CHECK(name_type is NOT NULL);