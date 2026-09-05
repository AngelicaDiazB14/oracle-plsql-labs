------------------------------------         1_GE_TABLESPACES ------------------------------------ 
CREATE TABLESPACE GE_Data
   DATAFILE 'C:\app\david\oradata\NAUTILUS\gedata01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;

--
--PE: INDEX
-- 
CREATE TABLESPACE ge_Ind
   DATAFILE 'C:\app\david\oradata\NAUTILUS\geind01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;


GRANT connect to ge;
GRANT create session to GE;
GRANT create table to GE;
