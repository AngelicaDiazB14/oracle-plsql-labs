-- DROP CONSTRAINTS

ALTER TABLE food
DROP CONSTRAINT food_price_nn;
ALTER TABLE food
DROP CONSTRAINT food_validPrice_min;
ALTER TABLE food
DROP CONSTRAINT food_nameFood_nn;



ALTER TABLE food
RENAME COLUMN price TO  cost;
ALTER TABLE food
RENAME COLUMN name_food  TO name;


--            CHANGE EVERYTHING THAT IS REFERENCED WITH PRICE AND FOOD_NAME 


--            ADD NEW CONSTRAINTS

ALTER TABLE food
ADD
(
 CONSTRAINT food_cost_nn CHECK(cost is NOT NULL),
 CONSTRAINT food_validCost_min CHECK(cost > 0),
 CONSTRAINT food_name_nn CHECK(name is NOT NULL)
);