DROP TABLE articulos;
CREATE TABLE articulos(
  codigo NUMBER(5),
  nombre VARCHAR2(20),
  descripcion VARCHAR2(30),
  precio NUMBER(6,2),
  cantidad NUMBER(3)
);

DESCRIBE articulos;

INSERT INTO articulos(codigo, nombre, descripcion, precio, cantidad)
VALUES (1,'impresora','Epson Stylus C45',400.80,20);
INSERT INTO articulos(codigo, nombre, descripcion, precio, cantidad)
VALUES (2,'impresora','Epson Stylus C85',500,30);
INSERT INTO articulos(codigo, nombre, descripcion, precio, cantidad)
VALUES (3,'monitor','Samsung 14',800,10);
INSERT INTO articulos(codigo, nombre, descripcion, precio, cantidad)
VALUES (4,'teclado','ingles Biswal',100,50);
INSERT INTO articulos(codigo, nombre, descripcion, precio, cantidad)
VALUES (5,'teclado','español Biswal',90,50);

--5- Seleccione los datos de las impresoras (2 registros)
SELECT * FROM articulos
  WHERE nombre = 'impresora';

--6- Seleccione los artículos cuyo precio sea mayor o igual a 400 (3 registros)
SELECT * FROM articulos
  WHERE precio >= 300;

--7- Seleccione el código y nombre de los artículos cuya cantidad sea menor a 30 (2 registros)
SELECT codigo, nombre FROM articulos
  WHERE cantidad < 30;

--8- Selecciones el nombre y descripción de los artículos que NO cuesten $100 (4 registros)
SELECT nombre, descripcion FROM articulos
  WHERE precio <> 100;
----------------------------------------------------------------------------------------------
DROP TABLE peliculas;
CREATE TABLE peliculas(
  titulos VARCHAR2(20),
  actor VARCHAR2(20),
  duracion NUMBER(3),
  cantidad NUMBER(1)
);

DESCRIBE peliculas;

INSERT INTO peliculas(titulos, actor, duracion, cantidad)
  VALUES('Mision imposible','Tom Cruise',120,3);
INSERT INTO peliculas(titulos, actor, duracion, cantidad)
  VALUES('Mision imposible 2','Tom Cruise',180,4);
INSERT INTO peliculas(titulos, actor, duracion, cantidad)
  VALUES('Mujer bonita','Julia R.',90,1);
INSERT INTO peliculas(titulos, actor, duracion, cantidad)
  VALUES('Elsa y Fred','China Zorrilla',80,2);

--4- Seleccione las películas cuya duración no supere los 90 minutos (2 registros) 
SELECT * FROM peliculas
  WHERE duracion <= 90;
  
--5- Seleccione el título de todas las películas en las que el actor NO sea "Tom Cruise" (2 registros)
SELECT titulos FROM peliculas
  WHERE actor <> 'Tom Cruise';

--6- Muestre todos los campos, excepto "duracion", de todas las películas de las que haya más de 2 copias (2 registros)
SELECT titulos, actor, cantidad FROM peliculas
  WHERE cantidad > 2;