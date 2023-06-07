SELECT * FROM lab_seeding.invoices;

INSERT INTO invoices (idinvoices, date, car, customer, salesperson)
VALUES (852399038, '2018-08-22', 0, 1, 3),
(731166526, '2018-12-31', 3, 0, 5),
(271135104, '2019-01-22', 2, 2, 7);

SELECT * FROM invoices;