--  First Querie
CREATE VIEW top_3
AS
SELECT rownum AS id, 
       first_name || ' ' || first_lastname AS nombre, 
       salary
FROM (SELECT first_name, first_lastname, salary
      FROM employee 
      ORDER BY salary DESC)
WHERE rownum <= 3;

-- Second Querie
CREATE VIEW top_3_2
AS
SELECT first_name || ' ' || first_lastname AS nombre, salary
FROM (
  SELECT first_name, first_lastname, salary, RANK() OVER (ORDER BY salary DESC) AS salary_rank
  FROM employee
)
WHERE salary_rank <= 3;


-- Question
--The first query uses a subquery as a FROM declaration in which the table of employees is 
--sorted in descending order. Once this query is made, the rownum as ID that I place
--in the select allows assigning a unique ID to each row of the subquery that was made,
--therefore, the condition of this query is that it returns only the first three rows that are the higher salaries.
--The second uses a second query in the from statement where, unlike the first query, the window function rank() is
--used and asked to sort the salaries in descending order. Once this subconsultation is made, the rank of salaries less 
--than or equal to three is placed as a condition to have the top 3 of the highest.
--In conclusion, the first query selects the highest record based on the rank order given by rownum,
--while the second query selects the highest record based on the rank given by the RANK() window function,
--but both functions returns teh same result.