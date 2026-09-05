-- =======================================================================

--                           CHANGELOG TABLE 
-- =======================================================================
CREATE TABLE changelog
(
  schema_name     VARCHAR2(20),
  table_name      VARCHAR2(20),
  field_name      VARCHAR2(20),
  previous_value  NUMBER(10),
  current_value   NUMBER(10)
);

ALTER TABLE changelog
ADD 
(
 CONSTRAINT changelog_Schema_name_nn CHECK(schema_name is NOT NULL),
 CONSTRAINT changelog_Table_name_nn CHECK(table_name is NOT NULL),
 CONSTRAINT changelog_Field_name_nn CHECK(field_name is NOT NULL),
 CONSTRAINT changelog_Previous_value_nn CHECK(previous_value is NOT NULL),
 CONSTRAINT changelog_current_value_nn CHECK(current_value is NOT NULL)
);