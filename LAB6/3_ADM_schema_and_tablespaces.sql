-- =======================================================================

--                              DATA TABLESPACE
-- =======================================================================

CREATE TABLESPACE ADM_Data
   DATAFILE 'C:\app\david\oradata\NAUTILUS\admdata01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;

-- =======================================================================

--                             INDEX TABLESPACE
-- =======================================================================


CREATE TABLESPACE adm_Ind
   DATAFILE 'C:\app\david\oradata\NAUTILUS\admind01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;



-- =======================================================================

--                                ADM SCHEME 
-- =======================================================================

CREATE USER adm
    IDENTIFIED BY adm
    DEFAULT TABLESPACE adm_data
    QUOTA 10M ON adm_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE app_user
    --PASSWORD EXPIRE;
 

-- =======================================================================

--                             PERMISSIONS
-- =======================================================================

--  These permissions only run once
   
GRANT connect to adm;
GRANT create session to ADM;
GRANT create table to ADM;
GRANT CREATE ANY INDEX TO ADM;
GRANT UNLIMITED TABLESPACE TO ADM;
GRANT CREATE VIEW TO ADM;
GRANT CREATE PROCEDURE TO  ADM;
GRANT CREATE ANY TRIGGER TO ADM;
GRANT CREATE SEQUENCE TO  ADM;
GRANT execute ON adm.insertChangelog to se;