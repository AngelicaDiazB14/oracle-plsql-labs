--                  TABLESPACES OF AD SCHEME

CREATE TABLESPACE AD_Data
   DATAFILE 'C:\app\david\oradata\NAUTILUS\addata01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;

--

--PE: INDEX
-- 
CREATE TABLESPACE ad_Ind
   DATAFILE 'C:\app\david\oradata\NAUTILUS\adind01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;





--                        AD SCHEME
CREATE USER ad
    IDENTIFIED BY ad
    DEFAULT TABLESPACE ad_data
    QUOTA 10M ON ad_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE app_user
    --PASSWORD EXPIRE;
    
GRANT connect to ad;
GRANT create session to AD;
GRANT create table to AD;
