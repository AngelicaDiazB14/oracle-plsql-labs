
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                   GETPHONES  TEST WITH MORE FIELDS
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--1 ______________________________________________________________________

DECLARE
    pIdPerson NUMBER(6) := 1;
    pTypeName VARCHAR2(20) := 'Personal';
    PIdType   NUMBER(6) := 1;
BEGIN
    getPhones(pIdPerson, pTypeName,PIdType);
END;




-- =======================================================================

--    What happens when more fields are added to the fetch in the test?
-- =======================================================================

--If additional fields are added to the test fetch, meaning an additional 
--field is added to the SELECT query of the cursor and the respective variable 
--is not added to the fetch to store the value, it will produce a compilation 
--error because the number of variables present in the FETCH does not match the
-- number of columns in the query.