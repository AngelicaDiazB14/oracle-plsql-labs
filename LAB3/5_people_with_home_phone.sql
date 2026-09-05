SELECT e.id_employee, e.first_name, e.first_lastname, p.phone_number,p.id_phone
FROM employee e
INNER JOIN phonexemployee px 
ON e.id_employee = px.id_employee
INNER JOIN phone p 
ON px.id_phone = p.id_phone
INNER JOIN type r
ON p.id_type = r.id_type
WHERE r.name = 'HOME';



