# LAB1 — Tablespaces, Schemas, and Base Table Structure

## Description

First lab of the course. It creates the **tablespaces** and **schemas** (`GE` and `AD`) that serve as the foundation for the rest of the labs, and defines the first tables (`people`/`employee`, `phone`, among others), including primary keys, indexes, and constraints (`NOT NULL`, `CHECK`). It also covers structure-modification operations: renaming columns/tables and enlarging an existing table.

## Contents

| File | Description |
|---|---|
| `1_GE_TABLESPACES.sql` | Creates the tablespace for the **GE** schema |
| `2_GE_SCHEME.sql` | Creates the **GE** user/schema with its quotas |
| `3_PEOPLE_AND _PHONE_TABLES.sql` | Creates the `people` and `phone` tables |
| `4_PKIN INDEXES_TABLESPACE.sql` | Defines primary keys and indexes |
| `5_CONSTRAINTS_TABLES.sql` | `NOT NULL` / `CHECK` constraints on the tables |
| `6_AD_SCHEME.sql` | Creates the tablespace and schema for **AD** |
| `7_TABLES_IN_AD.sql` | Creates tables inside the **AD** schema (e.g. `customer`) |
| `8_RENAMING _COLUMNS.sql` | Drops and renames constraints/columns |
| `9_ENLARGE_SIZE_PEOPLE_TABLE.sql` | Renames the `people` table to `employee` and enlarges a column |
| `3_CMODEL_LMODEL_LAB1.drawio.pdf` / `7_CMODEL_LMODEL_LAB1.drawio.pdf` | Conceptual and logical model of the lab |
| `Evidences_LAB1.pdf` | Execution evidence in Oracle SQL Developer |

## Tool
Oracle SQL Developer
