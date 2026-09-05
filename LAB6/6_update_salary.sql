-- =======================================================================

--                           update_salary      
-- =======================================================================

CREATE OR REPLACE PROCEDURE update_salary (pIdPerson IN NUMBER, pSalary IN NUMBER)
IS
BEGIN
  UPDATE person
      SET salary =  pSalary
  WHERE id_person = pIdPerson;
  COMMIT;
END update_salary;


-- =======================================================================

--                              Test 
-- =======================================================================

DECLARE 
  vnIdPerson  NUMBER(6):= 2;
  vnSalary    NUMBER(6):= 2000;
BEGIN
   update_salary(vnIdPerson,vnSalary);
END;