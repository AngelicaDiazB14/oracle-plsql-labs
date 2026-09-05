CREATE TABLE people
(
  id_people                NUMBER(6),
  first_name               VARCHAR2(20),
  second_name              VARCHAR2(20),
  first_lastname           VARCHAR2(25),
  second_lastname          VARCHAR2(25)
);

CREATE TABLE phone
(
  id_phone NUMBER(6),
  phone_number NUMBER(8),
  id_people NUMBER(6)
); 