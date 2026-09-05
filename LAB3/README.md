# LAB3 — SQL Queries, Joins, and Views

## Description

This lab focuses on **read queries (SELECT)**: text filtering, counts, joins across several related tables (employees, phones, customers, purchases), and the creation of **views** for salary and purchase reports.

The **SE** tablespace and schema are included again, with the permissions required to run the queries and create the views.

## Contents

| File | Description |
|---|---|
| `SE_TABLESPACES.sql` / `SE_SCHEME.sql` | **SE** tablespace and schema with permissions to query and create views |
| `1_Consult_the_total_number_of_people.sql` | Query for the total number of registered people |
| `2_names_starting_with_the_letter_B.sql` / `3_names_starting_with_the_letter_b.sql` | Names starting with "B" (upper/lowercase) |
| `4_total_number_of_phones_per_person.sql` | Total number of phones per person |
| `5_people_with_home_phone.sql` | People with a "home" type phone (join across `employee`, `phonexemployee`, `phone`, `type`) |
| `6_people_who_earn_less_than_3000.sql` | View of employees earning less than 3000 |
| `7_TOP_3_SALARY.sql` | View with the 3 highest salaries |
| `8_COUNT_CUSTOMER_WITH_PURCHASE.sql` | Count of distinct customers with at least one purchase |
| `9_TOTAL_CUSTOMERS.sql` | Total number of registered customers |
| `10_LIST_PURCHSE_BY_CUSTOMER.sql` | List of purchases per customer (join across `person`, `customer`, `purchase`, `productxpurchase`) |
| `11_CUSTOMERS_MORE_TWO_PURCHASE.sql` | Customers with more than 2 purchases |
| `BD_LAB3.drawio.pdf` | Entity-relationship model of the lab |
| `EVIDENCES.pdf` | Execution evidence in Oracle SQL Developer |

## Tool
Oracle SQL Developer
