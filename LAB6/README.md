# LAB6 — Data Auditing (Triggers and Changelog)

## Description

Final lab, focused on **data auditing** in Oracle. Audit fields and **audit triggers** are added to the tables, a changelog table (**`changelog`**) is created to log the changes made, and an `update_salary` procedure is implemented that triggers the audit when an employee's salary is modified.

## Contents

| File | Description |
|---|---|
| `1_CREATING_AUDIT _FIELDS.sql` | **SE** schema tablespace and audit fields |
| `2_CREATING_AUDIT_TRIGGERS.sql` | Creates audit triggers on the `person` table |
| `3_ADM_schema_and_tablespaces.sql` | **ADM** tablespace and schema |
| `4_changelog_table.sql` | Creates the `changelog` table (change log) |
| `5_add_audit__fields_and_trigger.sql` | Adds audit fields and a trigger on `changelog` |
| `6_update_salary.sql` | `update_salary` procedure, which updates the salary and triggers the audit |
| `Evidences_LAB6.pdf` | Execution evidence in Oracle SQL Developer |

## Tool
Oracle SQL Developer
