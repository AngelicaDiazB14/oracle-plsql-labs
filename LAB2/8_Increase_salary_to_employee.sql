--Increase salary by 15% for people over 30 years  of age
UPDATE employee
SET salary = salary * 0.15 + salary
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, birthdate)/12) > 30;
