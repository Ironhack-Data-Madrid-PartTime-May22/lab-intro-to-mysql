USE lab_intro;




INSERT INTO car
VALUES ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red'),
('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White'),
('HKNDGS7CU31E9Z7JW','Toyota','RAV4', '2018', 'Silver'),
('DAM41UDN3CHU2WVF6','Volvo','V60','2019','Gray'),
('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
 
#('DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country','2019', 'Gray');


INSERT INTO customer (idcustomer, name, phone, address, city, state, country, postal)
VALUES (1001, 'Pablo Picasso', '+34 636176382', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid','Spain',28045);


INSERT INTO customer (idcustomer, name, phone, address, city, state, country, postal)
VALUES (20001, 'Abraham Lincoln', '+1 305 907 7086', '	120 SW 8th St', 'Miami', 'Florida','United States',33130),
(30001,'Napoleon Bonaparte','+33 1 79 75 40 00','40 Rue du Colisée','Paris','Île-de-France','France',75008);



INSERT INTO salesperson
VALUES (00001,'Petery Cruiser',"Madrid"),
(00002,"Anna Sthesia","Barcelona"),
(00003,'Paul Molive','Berlin'),
(00004,'Gail Forcewind','Paris'),
(00005,'Paige Turner','Mimia'),
(00006,'Bob Frapples','Mexico City'),
(00007,'Walter Melon','Amsterdam'),
(00008,'Shonda Leer','São Paulo');

select * from salesperson;

INSERT INTO invoice (idinvoice, date)
VALUES (852399038, '2018-08-22'),
(731166526,'2018-12-31'),
(271135104,'2019-01-22');


