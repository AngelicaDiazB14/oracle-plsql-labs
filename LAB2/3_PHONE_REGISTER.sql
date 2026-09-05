--          TABLES
CREATE TABLE phone
(
  id_phone NUMBER(6),
  phone_number NUMBER(8),
  id_type NUMBER(6)
); 


CREATE TABLE type
(
  id_type                NUMBER(6),	
  name               VARCHAR2(20)
);


--         PRIMARY KEY TYPE TABLE
ALTER TABLE type
ADD
CONSTRAINT pk_type PRIMARY KEY (id_type)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

--         PRIMARY KEY  PHONE TABLE

ALTER TABLE phone
ADD
CONSTRAINT pk_phone PRIMARY KEY (id_phone)
USING INDEX
TABLESPACE ge_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

--          CONSTRAINT
ALTER TABLE phone
ADD
(
 CONSTRAINT phone_phoneNumber_nn CHECK(phone_number is NOT NULL),
 CONSTRAINT phone_validPhoneNumber_min CHECK(phone_number > 0 ),
);

ALTER TABLE type
ADD
(
 CONSTRAINT type_name_nn CHECK(name is NOT NULL)
);


--          ADD NEW FOREINGN KEY OF PHONE TABLE

ALTER TABLE phone
ADD
CONSTRAINT fk_phone_type FOREIGN KEY (id_type) REFERENCES type(id_type);

--        ADD TYPES
INSERT INTO type (id_type, name)
VALUES (1, 'HOME');
INSERT INTO type (id_type, name)
VALUES (2, 'CELLULAR_PHONE');
INSERT INTO type (id_type, name)
VALUES (3, 'OFFICE');
INSERT INTO type (id_type, name)
VALUES (4, 'OTHERS');


--      ADD PHONES
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


--                         COMMENTS ON PHONE TABLE

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

--                         COMMENTS ON TYPE TABLE

COMMENT ON TABLE type
IS 
 'Repository to store type information';
 -- ...........................................................
 COMMENT ON COLUMN type.name
IS 
 'Type name';
-- ...........................................................