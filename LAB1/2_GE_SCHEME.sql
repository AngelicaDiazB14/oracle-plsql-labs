CREATE USER ge
    IDENTIFIED BY ge
    DEFAULT TABLESPACE ge_data
    QUOTA 10M ON ge_data
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system;
    --PROFILE app_user
    --PASSWORD EXPIRE;

--                                 QUESTIONS

-- a. Can multiple schemas be created in the same database?

-- Yes you can create different schemas in the same database. 
-- Since the schema of a database is the owner of all the objects that are in it.
-- Each of the schemes has a different name.
-- Therefore, it is possible to create multiple schemas, each with a unique set of database objects.

-- b. What is the purpose of creating more than one schema in the same DB?

-- It allows a better management and organization of the different objects of the databases. 
-- By having different schemas, the tables related to one topic can be better subdivided from others.
-- This may be the case of a bank with a schema for the collection area that needs objects and tables
-- only related to that topic, another schema for the human resources area and so on with the different
-- divisions that are required. that is, creating more than one schema in a database can be useful for
-- organizing, controlling access, improving performance, and facilitating the migration of database objects.