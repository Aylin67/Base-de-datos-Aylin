CREATE DATABASE IF NOT EXISTS farmacia;

USE farmacia;

CREATE TABLE IF NOT EXISTS cliente (
  id_cliente INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(15) NOT NULL,
  apellido VARCHAR(15),
  edad INT,
  telefono CHAR(12),
  direccion VARCHAR(30) NOT NULL,
  PRIMARY KEY(id_cliente)
);

CREATE TABLE IF NOT EXISTS proveedor (
  id_proveedor INT NOT NULL AUTO_INCREMENT,
  edad INT,
  telefono CHAR(12),
  direccion VARCHAR(30) NOT NULL,
  correo VARCHAR(150),
  PRIMARY KEY(id_proveedor)
);

CREATE TABLE IF NOT EXISTS factura (
  id_factura INT NOT NULL AUTO_INCREMENT,
  precio DECIMAL(10,2),
  rfc VARCHAR(15),
  fecha DATE,
  id_cliente INT NOT NULL,
  PRIMARY KEY(id_factura),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE IF NOT EXISTS producto (
  codigo VARCHAR(25) PRIMARY KEY, -- 200222468
  cantidad INT,
  tipo_producto VARCHAR(150),
  nombre_producto VARCHAR(100),
  caducidad DATE
);

CREATE TABLE IF NOT EXISTS venta (
  id_venta INT NOT NULL AUTO_INCREMENT,
  id_cliente INT,
  id_producto INT NOT NULL,
  precio DECIMAL(10, 2),
  fecha_de_venta DATE,
  PRIMARY KEY(id_venta),
  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
  FOREIGN KEY (id_producto) REFERENCES producto(codigo)
);

CREATE TABLE IF NOT EXISTS compra (
  id_compra INT NOT NULL AUTO_INCREMENT,
  id_proveedor INT,
  id_producto INT,
  fecha_de_compra DATE,
  PRIMARY KEY(id_compra),
  FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor),
  FOREIGN KEY (id_producto) REFERENCES producto(codigo)
);
CREATE TABLE IF NOT EXISTS tipo_producto (
  id_tipo INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(25),
  PRIMARY KEY (id_tipo)
);
select * from tipo_producto;
alter table tipo_producto add column tipo varchar(25);
alter table tipo_producto drop column id_generico;
alter table tipo_producto drop column id_patente;

ALTER TABLE producto
ADD COLUMN id_tipo INT,
ADD CONSTRAINT fk_tipo_producto
FOREIGN KEY (id_tipo) REFERENCES tipo_producto(id_tipo);

INSERT INTO tipo_producto (tipo) VALUES
    ('GEN01'),
    ('PAT01'),
    ('GEN02'),
    ('PAT02'),
    ('GEN03'), 
    ('PAT03'),
    ('GEN04'),
    ('PAT04'),
    ('GEN05'), 
    ('PAT05');

update tipo_producto set tipo = "GEN01" where id_tipo = 1;
update tipo_producto set tipo = "GEN02" where id_tipo = 2;
update tipo_producto set tipo = "PAT01" where id_tipo = 1;
update tipo_producto set tipo = "PAT02" where id_tipo = 2;
update tipo_producto set tipo = "GEN03" where id_tipo = 3;
update tipo_producto set tipo = "GEN04" where id_tipo = 4;
update tipo_producto set tipo = "GEN05" where id_tipo = 5;
update tipo_producto set tipo = "PAT05" where id_tipo = 5;

INSERT INTO farmacia.proveedor (edad, telefono, direccion, correo) VALUES 
    (30, '1234567890', 'Calle Principal 123', 'proveedor1@example.com'),
	(25, '0987654321', 'Avenida Central 456', 'proveedor2@example.com'),
    (35, '2345678901', 'Calle Secundaria 789', 'proveedor3@example.com'),
    (40, '3456789012', 'Plaza Mayor 567', 'proveedor4@example.com'),
    (28, '4567890123', 'Calle Peatonal 890', 'proveedor5@example.com'),
    (45, '5678901234', 'Avenida Principal 678', 'proveedor6@example.com'),
    (32, '6789012345', 'Calle Secundaria 901', 'proveedor7@example.com'),
    (38, '7890123456', 'Paseo Marítimo 123', 'proveedor8@example.com'),
    (50, '8901234567', 'Avenida Central 234', 'proveedor9@example.com'),
    (29, '9012345678', 'Calle Mayor 345', 'proveedor10@example.com'),
    (42, '0123456789', 'Plaza Principal 890', 'proveedor11@example.com');
INSERT INTO producto (codigo, cantidad, tipo_producto, nombre_producto, caducidad) VALUES 

    ('200222471', 80, 'Medicamento', 'Omeprazol', '2025-03-20'),
    ('200222472', 120, 'Vitaminas', 'Vitamina D', '2025-10-31'),
    ('200222473', 30, 'Medicamento', 'Loratadina', '2024-08-15'),
    ('200222474', 60, 'Medicamento', 'Amoxicilina', '2024-11-30'),
    ('200222475', 40, 'Vitaminas', 'Vitamina B12', '2025-04-25'),
    ('200222476', 25, 'Medicamento', 'Dexametasona', '2024-07-10'),
    ('200222477', 70, 'Medicamento', 'Cetirizina', '2024-10-15'),
    ('200222478', 90, 'Vitaminas', 'Hierro', '2025-08-20'),
    ('200222479', 55, 'Medicamento', 'Clonazepam', '2024-06-05'),
    ('200222480', 65, 'Medicamento', 'Atorvastatina', '2025-02-28');


INSERT INTO cliente (nombre, apellido, edad, telefono, direccion) VALUES 
    ('María', 'González', 25, '0987654321', 'Avenida Central 456'),
    ('Pedro', 'López', 35, '2345678901', 'Calle Secundaria 789'),
    ('Ana', 'Martínez', 40, '3456789012', 'Plaza Mayor 567'),
    ('Luis', 'Hernández', 28, '4567890123', 'Calle Peatonal 890'),
    ('Laura', 'Díaz', 45, '5678901234', 'Avenida Principal 678'),
    ('Carlos', 'Ruiz', 32, '6789012345', 'Calle Secundaria 901'),
    ('Sofía', 'Torres', 38, '7890123456', 'Paseo Marítimo 123'),
    ('Miguel', 'Sánchez', 50, '8901234567', 'Avenida Central 234'),
    ('Lucía', 'Ramírez', 29, '9012345678', 'Calle Mayor 345'),
    ('Elena', 'Flores', 42, '0123456789', 'Plaza Principal 890');

INSERT INTO factura (precio, rfc, fecha, id_cliente) VALUES 
    (80.25, 'DEF456', '2024-04-18', 2),
    (120.75, 'GHI789', '2024-04-19', 3),
    (90.00, 'JKL012', '2024-04-20', 4),
    (110.50, 'MNO345', '2024-04-21', 5),
    (95.75, 'PQR678', '2024-04-22', 6),
    (85.30, 'STU901', '2024-04-23', 7),
    (130.00, 'VWX234', '2024-04-24', 8),
    (70.90, 'YZA567', '2024-04-25', 9),
    (105.20, 'BCD890', '2024-04-26', 10),
    (115.60, 'EFG123', '2024-04-27', 11);

INSERT INTO venta (id_cliente, id_producto, precio, fecha_de_venta) VALUES 
    (2, 1002, 30.50, '2024-04-18'),
    (3, 1003, 15.75, '2024-04-19'),
    (4, 1004, 40.20, '2024-04-20'),
    (5, 1005, 18.90, '2024-04-21'),
    (6, 1006, 27.80, '2024-04-22'),
    (7, 1007, 35.60, '2024-04-23'),
    (8, 1008, 22.45, '2024-04-24'),
    (9, 1009, 19.99, '2024-04-25'),
    (10, 1010, 45.75, '2024-04-26'),
    (11, 1011, 38.25, '2024-04-27');

INSERT INTO compra (id_proveedor, id_producto, fecha_de_compra) VALUES 
    (2, 200222471, '2024-04-18'),
    (3, 200222472, '2024-04-19'),
    (4, 200222473, '2024-04-20'),
    (5, 200222474, '2024-04-21'),
    (6, 200222475, '2024-04-22'),
    (7, 200222476, '2024-04-23'),
    (8, 200222477, '2024-04-24'),
    (9, 200222478, '2024-04-25'),
    (10, 200222479, '2024-04-26'),
    (11, 200222480, '2024-04-27');

select*from farmacia.compra;
select*from farmacia.producto;
select*from farmacia.cliente;
select*from farmacia.factura;
select*from farmacia.proveedor;


select id_cliente,nombre,edad from farmacia.cliente;
select id_proveedor,fecha_de_compra from farmacia.compra;
select precio,fecha from farmacia.factura;
select codigo,cantidad from farmacia.producto;
select correo,direccion from farmacia.proveedor;
select precio,fecha_de_venta from farmacia.venta;


select*from  cliente order by nombre ASC;
select*from  compra order by id_compra desc;
select*from  factura order by precio desc;
select*from producto order by cantidad asc;
select*from  proveedor order by telefono desc;
select*from  venta order by fecha_de_venta asc;

select count(*)from cliente;
select count(*)from compra;
select count(*)from factura;
select count(*)from producto;

select sum(cantidad)from producto;
select sum(precio)from factura;

select max(edad),min(edad) from cliente;
select max(id_producto),min(id_compra) from compra;
select max(precio),min(fecha) from factura;
select max(codigo),min(cantidad) from producto;
select max(edad),min(edad) from proveedor;





SELECT c.nombre, f.precio, f.fecha
FROM cliente c
INNER JOIN factura f ON c.id_cliente = f.id_cliente;
SELECT p.nombre_producto, c.fecha_de_compra
FROM producto p
INNER JOIN compra c ON p.codigo = c.id_producto;
SELECT p.nombre_producto, v.fecha_de_venta
FROM producto p
INNER JOIN venta v ON p.codigo = v.id_producto;
SELECT pr.correo, c.fecha_de_compra
FROM proveedor pr
INNER JOIN compra c ON pr.id_proveedor = c.id_proveedor;

SELECT p.nombre_producto, c.fecha_de_compra
FROM producto p
INNER JOIN compra c ON p.codigo = c.id_producto;
SELECT p.nombre_producto, v.fecha_de_venta
FROM producto p
INNER JOIN venta v ON p.codigo = v.id_producto;


SELECT pr.correo, c.fecha_de_compra FROM proveedor pr
INNER JOIN compra c ON pr.id_proveedor = c.id_proveedor;
SELECT c.nombre, f.precio, f.fecha FROM cliente c
INNER JOIN factura f ON c.id_cliente = f.id_cliente;
SELECT p.nombre_producto, c.fecha_de_compra FROM producto p
INNER JOIN compra c ON p.codigo = c.id_producto;
SELECT p.nombre_producto, v.fecha_de_venta FROM producto p
INNER JOIN venta v ON p.codigo = v.id_producto;




SELECT p.tipo_producto, COUNT(*) AS cantidad_productos, SUM(p.cantidad) AS total_cantidad, MAX(p.caducidad) AS fecha_caducidad_maxima, MIN(p.caducidad) AS fecha_caducidad_minima
FROM producto p GROUP BY p.tipo_producto;


SELECT c.nombre, f.fecha
FROM cliente c
INNER JOIN factura f ON c.id_cliente = f.id_cliente
WHERE MONTH(f.fecha) = MONTH(CURRENT_DATE()) - 1 AND YEAR(f.fecha) = YEAR(CURRENT_DATE());

SELECT nombre_producto AS  caducidad,codigo FROM producto
UNION
SELECT correo AS direccion,telefono
FROM proveedor;

SELECT id_cliente, nombre, edad
FROM cliente
WHERE nombre LIKE '%ar%';

SELECT id_proveedor, direccion, correo
FROM proveedor
WHERE direccion LIKE '%Secundaria%'