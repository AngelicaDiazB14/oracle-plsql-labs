------------------------------------         1_SE_TABLESPACES ------------------------------------ 
CREATE TABLESPACE SE_Data
   DATAFILE 'C:\app\david\oradata\NAUTILUS\sedata01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;

--
--PE: INDEX
-- 
CREATE TABLESPACE se_Ind
   DATAFILE 'C:\app\david\oradata\NAUTILUS\seind01.dbf'
   SIZE 10M
   REUSE
   AUTOEXTEND ON
   NEXT 512k
   MAXSIZE 200M;



