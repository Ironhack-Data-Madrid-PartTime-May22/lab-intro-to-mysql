USE lab_coches;
SELECT * FROM facturas;

INSERT INTO clientes (nombre, telefono, direccion, ciudad, provincia_del_estado, pais, postal)
VALUES ('Pablo Picasso', '+34636176382', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'España', 28045),
('Abraham Lincoln', '+13059077086', '120 SW Calle 8', 'miami', 'Florida', 'Estados Unidos', 33130),
('Napoleón Bonaparte', '+33179754000', '40 Rue du Colisée', 'París', 'Isla de Francia	', 'Francia', 75008);

INSERT INTO vendedores (nombre, almacenar)
VALUES ('crucero petey', 'Madrid'),
('ana estesia', 'Barcelona'),
('Pablo Molive', 'Berlina'),
('Gail Fuerzaviento', 'París'),
('paige turner', 'mimia'),
('Bob Frapples', 'Ciudad de México'),
('walter melón', 'Ámsterdam'),
('shonda leer', 'Sao Paulo');

INSERT INTO automovil (VIN, fabricante, modelo, año, color)
VALUES ('3K096I98581DHSNUP', 'volkswagen', 'tiguan', 2019, 'Azul'),
('ZM8G7BEUQZ97IH46V', 'peugeot', 'Rifter', 2019, 'Rojo'),
('RKXVNNIHLVVZOUB4M', 'Vado', 'Fusión', 2018, 'Blanco'),
('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Plata'),
('DAM41UDN3CHU2WVF6', 'volvo', 'V60', 2019, 'Gris'),
('DAM41UDN3CHU2WVF6', 'volvo', 'V60 a campo traviesa', 2019, 'Gris');

INSERT INTO facturas (n_factura, fecha, vendedores_idvendedores, clientes_idclientes, automovil_idautomovil)
VALUES (852399038, '2018-08-22', 1, 1, 3),
(731166526, '2018-12-31', 3, 1, 5),
(271135104, '2019-01-22', 2, 2, 7);



SELECT * FROM clientes;

