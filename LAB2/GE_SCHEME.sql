CREATE USER ge
    IDENTIFIED BY ge
    DEFAULT TABLESPACE ge_data
    QUOTA 10M ON ge_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE app_user
    --PASSWORD EXPIRE;
    
GRANT connect to ge;
GRANT create session to GE;
GRANT create table to GE;

--  These permissions only run once
GRANT CREATE ANY INDEX TO GE;
GRANT UNLIMITED TABLESPACE TO GE;