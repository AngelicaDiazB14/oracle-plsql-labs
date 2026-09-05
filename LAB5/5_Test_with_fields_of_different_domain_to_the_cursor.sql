-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                  GETPHONES TEST WITH DIFFERENT DOMAIN
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


DECLARE
    pIdPerson VARCHAR2(20) := '1';
    pTypeName VARCHAR2(20) := 'Oficce';
BEGIN
    getPhones(pIdPerson,ptypename);
END;




-- =======================================================================

--  What happens when in the test fetch the fields have different domains 
--                  from the what is getting the cursor?
-- =======================================================================

--The procedure doesn't return anything