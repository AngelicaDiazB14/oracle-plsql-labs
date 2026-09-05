-- =======================================================================

--                         ADD THE AUDIT FIELDS     
-- =======================================================================

ALTER TABLE changelog
ADD (
        creation_date DATE,
        update_date   DATE,
	creation_user VARCHAR2(10)
);


-- =======================================================================

--                         CHANGELOG INSERT      
-- =======================================================================

CREATE OR REPLACE PROCEDURE insertChangelog 
(pSchema_name IN VARCHAR2, pTable_name IN VARCHAR2,
 pField_name IN VARCHAR2, pUpdate_date IN DATE, 
 pPrevious_value IN NUMBER, pCurrent_value IN NUMBER, 
 pCreation_date IN DATE, pCreation_user IN VARCHAR2 )
AS
BEGIN
    INSERT INTO changelog (schema_name,table_name,field_name,update_date,previous_value,current_value,creation_date,creation_user)
    VALUES (pSchema_name, pTable_name, pField_name, pUpdate_date, pPrevious_value, pCurrent_value,pCreation_date, pCreation_user);
   
END insertChangelog;


-- =======================================================================

--                         CHANGELOG TRIGGERS      
-- =======================================================================


-- =======================================================================
--                            BEFORE INSERT     
-- =======================================================================

CREATE OR REPLACE TRIGGER beforeInsertChangelog
BEFORE INSERT
ON changelog
FOR EACH ROW
BEGIN
       :new.creation_date := SYSDATE;	
END;


-- =======================================================================
--                           BEFORE UPDATE   
-- =======================================================================

CREATE OR REPLACE TRIGGER beforeUpdateChangelog
BEFORE UPDATE
ON changelog
FOR EACH ROW
BEGIN
	:new.update_date := SYSDATE;
END;


-- =======================================================================
--                    BEFORE INSERT OR UPDATE SALARY 
-- =======================================================================

CREATE OR REPLACE TRIGGER beforeInsertUpdateSalary
BEFORE INSERT OR UPDATE
OF salary
ON person
FOR EACH ROW
BEGIN
     
     adm.insertChangelog('SE','PERSON','SALARY',:OLD.last_modification_date, :OLD.salary, :NEW.salary, :NEW.creation_date,:NEW.last_modification_user);
     
END  beforeInsertUpdateSalary;