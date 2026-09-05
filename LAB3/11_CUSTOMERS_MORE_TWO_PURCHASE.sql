SELECT  c.id_customer, p.first_name 
FROM person p
INNER JOIN customer c
ON p.id_person = c.id_person
INNER JOIN purchase s
ON c.id_customer = s.id_customer
GROUP BY c.id_customer, p.first_name
HAVING COUNT(1) >2;