SELECT c.id_customer, p.first_name ,s.id_purchase,r.id_product, t.name AS name_product
FROM person p
INNER JOIN customer c
ON p.id_person = c.id_person
INNER JOIN purchase s
ON c.id_customer = s.id_customer
INNER JOIN productxpurchase r
ON s.id_purchase = r.id_purchase
INNER JOIN product t
ON r.id_product = t.id_product
ORDER BY c.id_customer;

