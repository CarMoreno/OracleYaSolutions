/*Problema 1: Peliculas*/
CREATE TABLE peliculas(
  nombre VARCHAR2(20),
  actor VARCHAR2(20),
  duracion NUMBER(3,0),
  cantidad_copias NUMBER(1,0)
);

DESCRIBE peliculas;

INSERT INTO peliculas(nombre, actor, duracion, cantidad_copias)
VALUES('Mision imposible', 'Tom Cruise', 128, 3);

INSERT INTO peliculas(nombre, actor, duracion, cantidad_copias)
VALUES('Mision imposible 2', 'Tom Cruise', 130, 2);

INSERT INTO peliculas(nombre, actor, duracion, cantidad_copias)
VALUES('Mujer Bonita', 'Julia Roberts', 118, 3);

INSERT INTO peliculas(nombre, actor, duracion, cantidad_copias)
VALUES('Elsa y Fred', 'China Zorilla', 110, 2);

INSERT INTO peliculas(nombre, actor, duracion, cantidad_copias)
VALUES('Mujer Bonita', 'Richard Gere', 120.20, 4);

INSERT INTO peliculas(nombre, actor, duracion, cantidad_copias)
VALUES('Eterno resplandor de una mente sin Recuerdo', 'Jim Carrey', 333, 9);

SELECT * FROM peliculas;

/*Problema 2: Empleados*/
DROP TABLE empleados;

CREATE TABLE empleados(
  nombre VARCHAR2(30),
  documento VARCHAR2(8),
  sexo VARCHAR2(1),
  domicilio VARCHAR2(30),
  sueldobasico NUMBER(6,2)
);

SELECT * FROM all_tables;
DESCRIBE empleados;

INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico)
VALUES('Juan Perez','22333444','m','Sarmiento 123',500);
INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico)
VALUES('Ana Acosta','24555666','f','Colon 134',650);
INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico)
VALUES('Bartolome Barrios','27888999','m','Urquiza 479',800);

SELECT * FROM empleados;

INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico)
VALUES('Carlos Moreno', '22333444', 'm', 'Calle', 123456);

/*Mostrando solo algunos campos*/
SELECT nombre, actor FROM peliculas;
SELECT nombre, duracion FROM peliculas;
SELECT nombre, cantidad_copias FROM peliculas;

SELECT nombre, documento, domicilio FROM empleados;
SELECT documento, sexo, sueldobasico FROM empleados;