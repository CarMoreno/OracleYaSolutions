/* Intente crear una tabla llamada "*agenda"*/
CREATE TABLE agenda(
  Apellido VARCHAR2(30),
  Nombre VARCHAR2(20),
  Domicilio VARCHAR2(30),
  Telefono VARCHAR2(11)
);

create table libros(
  titulo varchar2(30),
  autor varchar2(20),
  editorial varchar2(15)
);

/*Insertando datos*/

INSERT INTO agenda (Apellido, Nombre, Domicilio, Telefono)
VALUES ('Moreno', 'Alberto', 'Colon 123', '4234567');
INSERT INTO agenda (Apellido, Nombre, Domicilio, Telefono)
VALUES ('Torres', 'Juan', 'Avellaneda 135', '4458787');

INSERT INTO libros (titulo, autor, editorial)
VALUES ('El aleph', 'Borgues', 'Planeta');
INSERT INTO libros (titulo, autor, editorial)
VALUES ('Martin Fierro', 'Jose Hernández', 'Emece');
INSERT INTO libros (titulo, autor, editorial)
VALUES ('Aprenda PHP', 'Mario Molina', 'Emece');

/*-------------*/
drop table libros;
drop table agenda;
describe agenda;
describe libros;

/*Consultas*/
SELECT * FROM all_tables;
SELECT * FROM agenda;
SELECT * FROM libros;