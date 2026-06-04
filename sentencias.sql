## cambiar de schema/base de datos
USE store;

## crear una tabla
CREATE TABLE customer (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

## agregar columnas
ALTER TABLE customer ADD email VARCHAR(50);
ALTER TABLE customer ADD phone varchar(20);

## eliminar columnas
ALTER TABLE customer DROP COLUMN phone;

## modificar columnas
ALTER TABLE customer MODIFY email VARCHAR(200) NOT NULL;


SELECT * FROM customer;