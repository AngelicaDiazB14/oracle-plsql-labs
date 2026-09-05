
-- =====================================================================================
-- Creation of purchases for 7 customers, with 5 customers having more than 2 purchases
-- =====================================================================================
-- #1............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (1,10,TO_DATE('22/02/2023','DD/MM/YYYY'));

-- #2............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (2,2,TO_DATE('10/11/2020','DD/MM/YYYY'));

-- #3............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (3,7,TO_DATE('15/12/2018','DD/MM/YYYY'));

-- #4............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (4,3,TO_DATE('01/09/2022','DD/MM/YYYY'));

-- #5............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (5,15,TO_DATE('01/01/2020','DD/MM/YYYY'));

-- #6............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (6,11,TO_DATE('20/01/2023','DD/MM/YYYY'));

-- #7............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (7,8,TO_DATE('22/02/2023','DD/MM/YYYY'));


-- #8............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (8,8,TO_DATE('22/02/2023','DD/MM/YYYY'));


-- #9............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (9,8,TO_DATE('02/03/2023','DD/MM/YYYY'));

-- #10............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (10,15,TO_DATE('01/01/2022','DD/MM/YYYY'));

-- #11............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (11,11,TO_DATE('20/01/2023','DD/MM/YYYY'));

-- #12............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (12,15,TO_DATE('29/01/2023','DD/MM/YYYY'));

-- #13............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (13,11,TO_DATE('20/01/2023','DD/MM/YYYY'));

-- #14............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (14,11,TO_DATE('20/02/2023','DD/MM/YYYY'));

-- #14............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (15,2,TO_DATE('10/11/2020','DD/MM/YYYY'));

-- #16............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (16,2,TO_DATE('10/10/2021','DD/MM/YYYY'));

-- #17............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (17,2,TO_DATE('10/09/2022','DD/MM/YYYY'));

-- #18............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (18,2,TO_DATE('30/07/2022','DD/MM/YYYY'));


-- #19............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (19,3,TO_DATE('01/11/2022','DD/MM/YYYY'));

-- #20............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (20,3,TO_DATE('24/12/2022','DD/MM/YYYY'));

-- #21............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (21,3,TO_DATE('25/12/2022','DD/MM/YYYY'));

-- #22............................................................................
INSERT INTO purchase (id_purchase,id_customer,entry_date)
VALUES (22,3,TO_DATE('31/01/2023','DD/MM/YYYY'));

-- =======================================================================
--                  Allocation of products for purchases
-- =======================================================================



-- #1............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (1,1,1,3);

-- #2............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (2,2,4,2);

-- #3............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (3,3,5,10);

-- #4............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (4,4,11,5);

-- #5............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (5,5,14,2);

-- #6............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (6,6,15,12);

-- #7............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (7,7,12,9);

-- #8............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (8,8,10,2);

-- #9............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (9,9,6,3);

-- #10............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (10,10,3,4);

-- #11............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (11,11,7,2);

-- #12............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (12,12,11,3);

-- #13............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (13,13,10,2);

-- #14............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (14,14,13,2);

-- #15............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (15,15,9,3);

-- #16............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (16,16,15,7);

-- #17............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (17,17,5,10);

-- #18............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (18,18,4,3);

-- #19............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (19,19,2,3);

-- #20............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (20,20,1,5);

-- #21............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (21,21,3,3);

-- #22............................................................................
INSERT INTO productxpurchase (id_productx_purchase,id_purchase,id_product,amount)
VALUES (22,22,6,3);



