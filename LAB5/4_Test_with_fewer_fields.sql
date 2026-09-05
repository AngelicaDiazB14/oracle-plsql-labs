-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                   GETPHONES  TEST WITH FEWER FIELDS
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

--1 ______________________________________________________________________

DECLARE
    pIdPerson NUMBER(6) := 1;
BEGIN
    getPhones();
END;




-- =======================================================================

--  What happens when some fields are missing in the fetch of the test?
-- =======================================================================

--If the test's fetch does not obtain the corresponding fields for the cursor, 
--a compilation error will be generated, because  the fetch does not match 
--the number of columns selected by the cursor.