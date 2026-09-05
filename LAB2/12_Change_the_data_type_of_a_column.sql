-- =====================================================================================
-- Change the data type of the id_person column of the person table
-- =====================================================================================

ALTER TABLE person
MODIFY id_person VARCHAR2(8);


-- =====================================================================================
-- Change the data type again so that everything is as before.
-- =====================================================================================

ALTER TABLE person
MODIFY id_person NUMBER(6);

-- QUESTIONS

--What happens if you change the data type of a column that already has data?

--What will happen is generate an error because the new data type is not compatible with the previously entered data, therefore the change is not made.