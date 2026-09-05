CREATE USER se
    IDENTIFIED BY se
    DEFAULT TABLESPACE se_data
    QUOTA 10M ON se_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE app_user
    --PASSWORD EXPIRE;
    
GRANT connect to se;
GRANT create session to SE;
GRANT create table to SE;

--  These permissions only run once
GRANT CREATE ANY INDEX TO SE;
GRANT UNLIMITED TABLESPACE TO SE;
GRANT CREATE VIEW TO SE;

