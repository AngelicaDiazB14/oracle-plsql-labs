<h1 align="center">Oracle PL/SQL Labs</h1>

<p align="center">
  <img src="https://readme-typing-svg.demolab.com/?font=Fira+Code&weight=500&size=20&pause=1200&color=2CA5E0&center=true&vCenter=true&width=560&lines=Database+Systems+I+%E2%80%94+Course+Labs;Schemas+%C2%B7+ER+Modeling+%C2%B7+DML%2FDDL;PL%2FSQL%3A+Procedures+%C2%B7+Cursors+%C2%B7+Triggers" alt="Typing SVG"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Oracle-000000?style=flat-square&logo=oracle&logoColor=F80000"/>
  <img src="https://img.shields.io/badge/SQL-000000?style=flat-square&logo=mysql&logoColor=4479A1"/>
  <img src="https://img.shields.io/badge/PL%2FSQL-000000?style=flat-square&logoColor=white"/>
  <img src="https://img.shields.io/badge/SQL%20Developer-000000?style=flat-square&logo=oracle&logoColor=F80000"/>
</p>

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=rect&color=0:2CA5E0,100:8511FA&height=3&width=1000" alt="divider"/>
</p>

## Description

This repository gathers the **labs developed for the Database Systems I course**. Each lab builds on the previous one, covering the full lifecycle of designing and administering a relational database in Oracle: from tablespaces and schemas, through entity-relationship modeling, constraints and indexes, DML operations, queries and views, up to PL/SQL programming with procedures, functions, cursors, and audit triggers.

All the work was developed using **Oracle SQL Developer** as the client to administer and run the SQL/PL-SQL scripts.

## Authors

- **Angélica Díaz Barrios**
- **David Centeno Araya**

## Tools used

- **Oracle Database**
- **Oracle SQL Developer**
- **draw.io** — used to design the conceptual/logical entity-relationship models of each lab

## Repository contents

| Lab | Main topic |
|---|---|
| [LAB1](./LAB1) | Tablespaces, schemas, table creation, primary keys, indexes, constraints, and structure changes |
| [LAB2](./LAB2) | DML operations: insert, update, and delete |
| [LAB3](./LAB3) | SQL queries (SELECT), joins, and view creation |
| [LAB4](./LAB4) | Entity-relationship model, foreign keys, sequences, CHECK constraints, and PL/SQL (procedures, functions, and packages) |
| [LAB5](./LAB5) | Explicit and implicit cursors (SYS_REFCURSOR) in PL/SQL |
| [LAB6](./LAB6) | Data auditing: audit fields and triggers, changelog table |

Each lab folder includes:
- The **`.sql` scripts** in the order they were executed.
- The **entity-relationship / conceptual-logical model** as a PDF (exported from draw.io).
- An **evidence PDF** with screenshots of the execution in Oracle SQL Developer.
- Its own **README.md** describing what that specific lab covers.

## How to run these scripts

To execute the scripts yourself, you need a local Oracle database and a client to run SQL/PL-SQL against it.

1. **Install Oracle Database.** Download and install **Oracle Database Express Edition (XE)**, the free version, from the official Oracle site: https://www.oracle.com/database/technologies/appdev/xe.html
2. **Install Oracle SQL Developer.** Download it (also free) from: https://www.oracle.com/database/sqldeveloper/
3. **Create a connection** in SQL Developer to your local Oracle XE instance (default user `system`, the password is the one you set during installation).
4. **Adjust the datafile paths.** The tablespace scripts (e.g. `1_GE_TABLESPACES.sql`) contain a hardcoded Windows path (`C:\app\...\oradata\...`). Before running them, change that path to a valid data directory on your own machine, or remove the `DATAFILE` clause to let Oracle use the default location.
5. **Run each lab's scripts in numerical order** (the file name prefix, e.g. `1_`, `2_`, `3_`...), since each script depends on objects created by the previous one (tablespace → schema → tables → constraints → data → queries/procedures).
6. Compare your output against the **evidence PDF** included in each lab folder to check that the results match what was originally executed.

---
<p align="center">Labs developed for the <b>Database Systems I</b> course</p>

