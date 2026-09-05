CREATE VIEW employee_salary 
AS
SELECT id_employee,first_name,first_lastname,salary
FROM employee
WHERE salary < 3000
ORDER BY id_employee;

