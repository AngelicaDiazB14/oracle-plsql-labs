-- =======================================================================

--                              DATA TABLESPACE
-- =======================================================================

CREATE TABLESPACE UN_Data
   DATAFILE 'C:\app\david\oradata\NAUTILUS\undata01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;

-- =======================================================================

--                             INDEX TABLESPACE
-- =======================================================================


CREATE TABLESPACE un_Ind
   DATAFILE 'C:\app\david\oradata\NAUTILUS\unind01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;



-- =======================================================================

--                               SCHEME UN
-- =======================================================================

CREATE USER un
    IDENTIFIED BY un
    DEFAULT TABLESPACE un_data
    QUOTA 10M ON un_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE app_user
    --PASSWORD EXPIRE;
 

-- =======================================================================

--                             PERMISSIONS
-- =======================================================================

--  These permissions only run once
   
GRANT connect to un;
GRANT create session to UN;
GRANT create table to UN;
GRANT CREATE ANY INDEX TO UN;
GRANT UNLIMITED TABLESPACE TO UN;
GRANT CREATE VIEW TO UN;
GRANT CREATE PROCEDURE TO  UN;

--GRANT CREATE PACKAGE TO  UN;
GRANT CREATE SEQUENCE TO  UN;





