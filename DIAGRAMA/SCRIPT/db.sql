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
  correo VARCHAR(20),
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
