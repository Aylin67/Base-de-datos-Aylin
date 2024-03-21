create database farmacia;
CREATE TABLE IF NOT EXISTS FARMACIA.CLIENTE(
PRIMARY KEY ide Cliente,
nombre varchar(15) not NULL,
apellido varchar(15),
edad int,
 telelefono char (12),
 direccion varchar(30)not null,
 CREATE TABLE IF NOT EXISTS FARMACIA.PROVEDOR(
   PRIMARY KEY codigo provedor,
apellido varchar (15),
edad int,
telefono char(12),
direccion varchar (30)not null,
correo varchar (20)null,
CREATE TABLE IF NOT EXISTS FARMACIA.FACTURA(
  PRIMARY KEY  iddf
precio decimal,
rfc varchar,
fecha int(3)
CREATE TABLE IF NOT EXISTS FARMACIA.PRODUCTO(
  codigo PRIMARY KEY 
 cantidad int
 tipo de producto varchar(150)
 nombre del producto varchar(100)
 caducidad date
  )
