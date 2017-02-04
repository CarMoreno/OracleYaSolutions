DROP TABLE medicamentos;
CREATE TABLE medicamentos(
  codigo NUMBER(5) NOT NULL,
  nombre VARCHAR2(20) NOT NULL,
  laboratorio VARCHAR2(20),
  precio NUMBER(5,2),
  cantidad NUMBER(3,0) NOT NULL
);

describe medicamentos;

INSERT INTO medicamentos(codigo, nombre, laboratorio, precio, cantidad)
  VALUES (1, 'Sertal Gotas', null, null, 100);
INSERT INTO medicamentos(codigo, nombre, laboratorio, precio, cantidad)
  VALUES (2,'Sertal compuesto',null,8.90,150);
INSERT INTO medicamentos(codigo, nombre, laboratorio, precio, cantidad)
  VALUES (3,'Buscapina','Roche',null,200);
  
--6- Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio.  
INSERT INTO medicamentos(codigo, nombre, laboratorio, precio, cantidad)
  VALUES (3,'Ibuprofeno','',0,200);
  
--7- Intente ingresar un registro con cadena vacía para el nombre (mensaje de error)
INSERT INTO medicamentos(codigo, nombre, laboratorio, precio, cantidad)
  VALUES (3,'','MK',0,200);

--9- Ingrese un registro con una cadena de 1 espacio para el laboratorio.
INSERT INTO medicamentos(codigo, nombre, laboratorio, precio, cantidad)
  VALUES (3,'Dolex',' ',345,200);

--10- Recupere los registros cuyo laboratorio contenga 1 espacio (1 registro)
SELECT * FROM medicamentos
  WHERE laboratorio = ' ';

--Recupere los registros cuyo laboratorio sea distinto de ' '(cadena de 1 espacio) 
SELECT * FROM medicamentos
  WHERE laboratorio <> ' ';
---------------------------------------------------------------------------------------------
DROP TABLE peliculas;
CREATE TABLE peliculas(
  codigo number(5) not null,
  titulo varchar2(40) not null,
  actor varchar2(20),
  duracion number(3)
);

describe peliculas;

INSERT INTO peliculas(codigo, titulo, actor, duracion)
VALUES(1,'Mision imposible','Tom Cruise',120);
INSERT INTO peliculas(codigo, titulo, actor, duracion)
VALUES(2,'Harry Potter y la piedra filosofal',null,180);
INSERT INTO peliculas(codigo, titulo, actor, duracion)
VALUES(3,'Harry Potter y la camara secreta','Daniel R.',null);
INSERT INTO peliculas(codigo, titulo, actor, duracion)
VALUES(0,'Mision imposible 2','',150);
INSERT INTO peliculas(codigo, titulo, actor, duracion)
VALUES(4,'Titanic','L. Di Caprio',220);
INSERT INTO peliculas(codigo, titulo, actor, duracion)
VALUES(5,'Mujer bonita','R. Gere-J. Roberts',0);

--6- Intente ingresar un registro con valor nulo para campos que no lo admiten (aparece un mensaje de error)
INSERT INTO peliculas(codigo, titulo, actor, duracion)
VALUES(null,'Mujer bonita','R. Gere-J. Roberts',0);

select * from peliculas;

--8- Actualice la película en cuyo campo "duracion" hay 0 por "null" (1 registro)
update peliculas set duracion = null
  where duracion = 0;