# LAB2 — DML Operations (Insert, Update, Delete)

## Description

This lab focuses on data manipulation (**DML**) on the tables created previously. It registers and deletes people and phones, updates data (names, phone types, salaries), assigns customers, creates products and purchases, and modifies the data type of an existing column.

The **GE** tablespace and schema are included again, since the schema holds the permissions required to perform the inserts.

## Contents

| File | Description |
|---|---|
| `GE_TABLESPACES.sql` / `GE_SCHEME.sql` | **GE** tablespace and schema with the permissions needed to insert data |
| `1_REGISTER_PEOPLE.sql` | Creates the `employee` table and registers people |
| `2_DELETE_PERSON.sql` | Deletes a record from `employee` |
| `3_PHONE_REGISTER.sql` | Creates the `phone` table and registers phones |
| `4_DELETE_PHONE.sql` | Deletes a record from `phone` |
| `5_DELETE_PERSON_PHONE.sql` | Intermediate table `phonexemployee` and deletion of person-phone relationships |
| `6_UPDATE_PERSON.sql` | Updates a person's data |
| `7_Update_a_phone_type.sql` | Updates a phone type |
| `8_Increase_salary_to_employee.sql` | Increases salary by 15% for employees over 30 years old |
| `9_Assign_15_people_as_customer_.sql` | Creates the `person` table and assigns 15 people as customers |
| `10_Creation_of_15_products.sql` | Inserts 15 products |
| `11_Creation_of_purchases_for_7_clients.sql` | Creates purchases for 7 customers (5 with more than 2 purchases) |
| `12_Change_the_data_type_of_a_column.sql` | Changes the data type of the `id_person` column |
| `BD_LAB2.drawio.pdf` | Entity-relationship model of the lab |
| `Evidences.pdf` | Execution evidence in Oracle SQL Developer |

## Tool
Oracle SQL Developer
