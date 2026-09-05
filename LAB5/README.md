# LAB5 — Cursors in PL/SQL

## Description

This lab focuses on the use of **cursors** in PL/SQL. A `GETPHONES` procedure based on a cursor is created and tested with different combinations and domains of fields. Phone data is also modified using both **explicit cursors** (`LOOP`) and **implicit cursors** (`SYS_REFCURSOR`).

## Contents

| File | Description |
|---|---|
| `1_CURSOR_GETPHONES.sql` | Definition of the cursor and the `GETPHONES` procedure |
| `2_TEST_PROCEDURE_GETPHONES.sql` | Tests for the `GETPHONES` procedure |
| `3_Test_with_more_fields.sql` | Test of the cursor with more fields |
| `4_Test_with_fewer_fields.sql` | Test of the cursor with fewer fields |
| `5_Test_with_fields_of_different_domain_to_the_cursor.sql` | Test with fields of a different domain than the cursor's |
| `6_Modify_Phone_Cursor_with_Loop.sql` | Modifies phone data using an explicit cursor with `LOOP` |
| `7_Modify_Phone_Cursor_with_SYS_REFCURSOR.sql` | Modifies phone data using `SYS_REFCURSOR` |
| `8.UN_schema_and_getCourses.sql` | **UN** schema and the `getCourses` procedure |
| `BD_LAB5_1_to_7.drawio.pdf` / `BD_LAB5_8.drawio.pdf` | Entity-relationship models of the lab |
| `EVIDENCES_LAB5.pdf` | Execution evidence in Oracle SQL Developer |

## Tool
Oracle SQL Developer
