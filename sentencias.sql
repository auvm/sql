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
INSERT INTO customer(name, email) VALUES ("Ana", "ana@gmail.com");
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




## ordenar datos
SELECT * FROM customer 
ORDER BY name;

SELECT * FROM customer 
ORDER BY LOWER(name);

INSERT INTO customer(name, email) VALUES ("marco","marco@hotmail.com");



## Filtrar información
SELECT * FROM customer WHERE LOWER(name)="ANGEL";
SELECT * FROM customer WHERE LOWER(name)="ANGEL" OR LOWER(name)="velasco";
SELECT * FROM customer WHERE LOWER(name)="ANGEL" AND LOWER(email)="avm230@hotmail.com";
SELECT * FROM customer WHERE LENGTH(name)>5;

## Modificar / Actualizar información
UPDATE customer SET name = "pancho" WHERE id = 5;

### Para desactivar modo update safe (Para cuando se necesita actualizar sin usar un id o PK en el WHERE)
SET SQL_SAFE_UPDATES = 0;


UPDATE customer SET name = UPPER(name) WHERE name = "ana";
UPDATE customer SET name = "Frank", email = "frank58@gmail.com" WHERE id = 5;
UPDATE customer SET name = UPPER(name) WHERE id IN(2,4,6);
 
 
 
 ## Eliminar información
 DELETE FROM customer WHERE id=5;
 DELETE FROM customer WHERE id IN(1,3,5,7);

## Se se vuelve a insertar info, el id no se regresa
INSERT INTO customer(name, email) VALUES ("Ángel","avm230@hotmail.com");
INSERT INTO customer(name, email) VALUES ("Ana", "ana@gmail.com");
INSERT INTO customer(name, email) VALUES 
("Uriel", "uriel@gmail.com"),
("velasco", "velasco@gmail.com"),
("mejia", "mejia@gmail.com");

## Vaciar una tabla, es más rápido que el DELETE
TRUNCATE customer;

# Constraints

## PRIMARY KEYS llaves primarias
CREATE TABLE city (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

## NOT NULL
ALTER TABLE city CHANGE COLUMN name name VARCHAR(50) NOT NULL;
INSERT INTO city (name) VALUES (NULL);
INSERT INTO city (name) VALUES ("CDMX");
SELECT * FROM city;

DESCRIBE city;

## UNIQUE - valores unicos 
ALTER TABLE city ADD UNIQUE(name);
INSERT INTO city (name) VALUES ("CDMX"); # Genera error porque ya existe
INSERT INTO city (name) VALUES ("Guadalajara"); # Lo inserta inicialmente bien
INSERT INTO city (name) VALUES ("Guadalajara"); # Genera error porque ya existe

## DEFAULT - Asignar valores por defecto a una columna
ALTER TABLE customer ADD COLUMN currency VARCHAR(3) DEFAULT 'MXN'; #agrega la columna y rellena con el valor default
INSERT INTO customer (name, email, currency) VALUES ("Rodrigo", "rod@gmail.com", "USD"); #tiene preioridad el valor enviado sobre un default

## Agregar un valor DEFAULT a una columna ya existente
ALTER TABLE customer ADD COLUMN created_at DATETIME; #Eejemplo creamos una columna pero sin asignarle un valor default
ALTER TABLE customer ALTER created_at SET DEFAULT CURRENT_TIMESTAMP(); #se asigna el valor default con el alter a la columna
INSERT INTO customer (name, email, currency) VALUES ("Marco	", "marco@gmail.com", "RUB"); #cuando se inserta un nuevo registro ya se asigna el valor default al campo created_at

## INDEX - índices


SELECT * FROM city;
SELECT * FROM customer;