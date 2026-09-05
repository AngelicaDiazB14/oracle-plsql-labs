-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
--                   MODIFYING THE PHONE CURSOR WITH SYS_REFCURSOR 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


-- =======================================================================

--                              getPhonesWitHSys
-- ======================================================================

CREATE OR REPLACE PROCEDURE getPhonesWithSysRefCursor(pIdPerson IN NUMBER, 
                  pTypeName IN VARCHAR2 DEFAULT NULL, pRecordSet OUT SYS_REFCURSOR)
AS
    vFirstName person.first_name%TYPE;
    vLastName person.first_lastname%TYPE;
    vnPhoneNumber phone.phone_number%TYPE;
    vTypeName phone_type.type_name%TYPE;
BEGIN
    OPEN pRecordSet FOR
        SELECT p.first_name, p.first_lastname, ph.phone_number, pt.type_name
        FROM person p
        INNER JOIN phone ph
        ON p.id_person = ph.id_person
        INNER JOIN phone_type pt
        ON ph.id_type = pt.id_type
        WHERE p.id_person = pIdPerson
        AND pt.type_name = NVL(pTypeName, pt.type_name);

END getPhonesWithSysRefCursor;

-- =======================================================================

--                                TESTS
-- =======================================================================

--1 ______________________________________________________________________

DECLARE
    vIdPerson NUMBER(6) := 1;
    vcTypeName VARCHAR2(20) := 'Home';
    phoneCursorSys SYS_REFCURSOR;
    vFirstName person.first_name%TYPE;
    vLastName person.first_lastname%TYPE;
    vnPhoneNumber phone.phone_number%TYPE;
    vTypeName phone_type.type_name%TYPE;
BEGIN
    getPhonesWithSysRefCursor(vIdPerson, vcTypeName, phoneCursorSys);
    LOOP
        FETCH phoneCursorSys INTO vFirstName, vLastName, vnPhoneNumber, vTypeName;
        EXIT WHEN phoneCursorSys%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(LPAD(vFirstName || ' ' || vLastName, 20) || LPAD(vnPhoneNumber, 20) || LPAD(vTypeName, 20));
    END LOOP;
    CLOSE phoneCursorSys;
END;





--2 ______________________________________________________________________
DECLARE
    vIdPerson NUMBER(6) := 1;
    vcTypeName VARCHAR2(20) := 'Office';
    phoneCursorSys SYS_REFCURSOR;
    vFirstName person.first_name%TYPE;
    vLastName person.first_lastname%TYPE;
    vnPhoneNumber phone.phone_number%TYPE;
    vTypeName phone_type.type_name%TYPE;
BEGIN
    getPhonesWithSysRefCursor(vIdPerson, vcTypeName, phoneCursorSys);
    LOOP
        FETCH phoneCursorSys INTO vFirstName, vLastName, vnPhoneNumber, vTypeName;
        EXIT WHEN phoneCursorSys%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(LPAD(vFirstName || ' ' || vLastName, 20) || LPAD(vnPhoneNumber, 20) || LPAD(vTypeName, 20));
    END LOOP;
    CLOSE phoneCursorSys;
END;





--3 ______________________________________________________________________
DECLARE
    vIdPerson NUMBER(6) := 1;
    vcTypeName VARCHAR2(20) := 'Personal';
    phoneCursorSys SYS_REFCURSOR;
    vFirstName person.first_name%TYPE;
    vLastName person.first_lastname%TYPE;
    vnPhoneNumber phone.phone_number%TYPE;
    vTypeName phone_type.type_name%TYPE;
BEGIN
    getPhonesWithSysRefCursor(vIdPerson, vcTypeName, phoneCursorSys);
    LOOP
        FETCH phoneCursorSys INTO vFirstName, vLastName, vnPhoneNumber, vTypeName;
        EXIT WHEN phoneCursorSys%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(LPAD(vFirstName || ' ' || vLastName, 20) || LPAD(vnPhoneNumber, 20) || LPAD(vTypeName, 20));
    END LOOP;
    CLOSE phoneCursorSys;
END;




--4 ______________________________________________________________________
DECLARE
    vIdPerson NUMBER(6) := 2;
    vcTypeName VARCHAR2(20) := NULL;
    phoneCursorSys SYS_REFCURSOR;
    vFirstName person.first_name%TYPE;
    vLastName person.first_lastname%TYPE;
    vnPhoneNumber phone.phone_number%TYPE;
    vTypeName phone_type.type_name%TYPE;
BEGIN
    getPhonesWithSysRefCursor(vIdPerson, vcTypeName, phoneCursorSys);
    LOOP
        FETCH phoneCursorSys INTO vFirstName, vLastName, vnPhoneNumber, vTypeName;
        EXIT WHEN phoneCursorSys%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(LPAD(vFirstName || ' ' || vLastName, 20) || LPAD(vnPhoneNumber, 20) || LPAD(vTypeName, 20));
    END LOOP;
    CLOSE phoneCursorSys;
END;
