SELECT * FROM lab_seeding.customers;

INSERT INTO customers (idcustomers, name, phone, email, address, city, province, country, postal)
VALUES (10001, 'Pablo Picasso', '636176382', 'null', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 2845),
(20001, 'Abraham Lincoln', '130590770', 'null', '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
(30001, 'Napoleon Bonaparte', '331797540', 'null', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);

SELECT * FROM customers;