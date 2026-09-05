-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                         MODIFYING THE PHONE CURSOR 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--                             getPhonesWithLoop
-- =======================================================================


CREATE OR REPLACE PROCEDURE getPhonesWithLoop(pIdPerson IN NUMBER,pTypeName IN VARCHAR2 DEFAULT NULL)
AS
    CURSOR phoneCursorL
    IS
        SELECT p.first_name, p.first_lastname, ph.phone_number, pt.type_name
        FROM person p
        INNER JOIN phone ph
        ON p.id_person = ph.id_person
        INNER JOIN phone_type pt
        ON ph.id_type = pt.id_type
        WHERE p.id_person = pIdPerson
        AND pt.type_name = NVL(pTypeName, pt.type_name);

BEGIN
    DBMS_OUTPUT.PUT_LINE(LPAD('Name', 20) || LPAD('Phone', 20) || LPAD('Type', 20));
    FOR i IN phoneCursorL LOOP
        DBMS_OUTPUT.PUT_LINE(LPAD(i.first_name || ' ' || i.first_lastname, 20) || LPAD(i.phone_number, 20) || LPAD(i.type_name, 20));
    END LOOP;
END getPhonesWithLoop;


-- =======================================================================

--                                  TESTS
-- =======================================================================

--1 ______________________________________________________________________

DECLARE
    vIdPerson NUMBER(6) := 1;
    vcTypeName VARCHAR2(20) := 'Home';

BEGIN
  getPhonesWithLoop(vIdPerson,vcTypeName);
  
END; -- se agrega esta línea para cerrar el bloque BEGIN.




--2 ______________________________________________________________________

DECLARE
    vIdPerson NUMBER(6) := 1;
    vcTypeName  VARCHAR2(20) := NULL;
  
BEGIN
  getPhonesWithLoop(vIdPerson,vcTypeName);
  
END;



--3 ______________________________________________________________________

DECLARE
    vIdPerson NUMBER(6) := 1;
    vcTypeName VARCHAR2(20) := 'Office';
    
BEGIN
  getPhonesWithLoop(vIdPerson,vcTypeName);
END;



--4 ______________________________________________________________________

DECLARE
    vIdPerson NUMBER(6) := 2;
    vcTypeName VARCHAR2(20) := 'Personal';
   
BEGIN
  getPhonesWithLoop(vIdPerson,vcTypeName);
END;