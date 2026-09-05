ALTER TABLE people
ADD
(
 CONSTRAINT people_firstName_nn CHECK(first_name is NOT NULL),
 CONSTRAINT people_firstLastname_nn CHECK(first_lastname  is NOT NULL),
 CONSTRAINT people_secondLastname_nn CHECK(second_lastname   is NOT NULL)
);



ALTER TABLE phone
ADD
(
 CONSTRAINT phone_phoneNumber_nn CHECK(phone_number is NOT NULL),
 CONSTRAINT phone_validPhoneNumber_min CHECK(phone_number > 0 )
);