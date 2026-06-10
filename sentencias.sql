## cambiar de schema/base de datos
USE store;

## crear una tabla
CREATE TABLE customer (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE something (
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

## eliminar tabla
DROP TABLE something;

## insertar información
INSERT INTO customer(name, email) VALUES ("Ángel","avm230@hotmail.com");

INSERT INTO customer(name, email) VALUES 
("Uriel", "uriel@gmail.com"),
("velasco", "velasco@gmail.com"),
("mejia", "mejia@gmail.com");

## consultar información
SELECT * FROM customer;

### consultar apartir de X registro, N cantidad de registros:
SELECT * FROM customer LIMIT 0,2;

### valor que se repite
SELECT "Constante", 3, name FROM customer;

### conversión a minúsculas o mayúsculas
SELECT id, UPPER(name) FROM customer;
SELECT id, LOWER(name) FROM customer;

### length longitud de caracteres
SELECT id, name, LENGTH(name) AS "longitud" FROM customer;






### insertar datos despues de TRUNCATE
INSERT INTO customer(name, email) VALUES
("juan", "juan@gmail.com"),
("ana","ana@gmail.com"),
("ana","ana2@gmail.com"),
("hector","hector@gmail.com"),
("francisco","francisco@gmail.com");

## Contar cantidad de registros en la tabla
SELECT count(*) AS "Cantidad de registros" FROM customer;

## Contar y agrupar por un campo
SELECT name, COUNT(*) AS "cantidad" FROM customer GROUP BY name;




SELECT * FROM customer;