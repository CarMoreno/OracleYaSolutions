DROP TABLE libros;
SELECT * FROM libros;

CREATE TABLE libros(
  codigo NUMBER(4) NOT NULL,
  titulo VARCHAR2(40) NOT NULL,
  autor VARCHAR2(15),
  editorial VARCHAR2(30),
  PRIMARY KEY(codigo)
);

INSERT INTO libros(codigo, titulo, autor, editorial)
  VALUES(1,'El aleph','Borges','Emece');
INSERT INTO libros(codigo, titulo, autor, editorial)
  VALUES(2,'Martin Fierro','Jose Hernandez','Planeta');
INSERT INTO libros(codigo, titulo, autor, editorial)
  VALUES(3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

-- Ingrese un registro con código repetido (aparece un mensaje de error)
INSERT INTO libros(codigo, titulo, autor, editorial)
  VALUES(3,'Aprenda PHP','Mario Molina','Nuevo Siglo');

-- 5- Intente ingresar el valor "null" en el campo "codigo"
INSERT INTO libros(codigo, titulo, autor, editorial)
  VALUES(NULL,'Aprenda PHP','Mario Molina','Nuevo Siglo');
  
--6- Intente actualizar el código del libro "Martin Fierro" a "1" (mensaje de error)
UPDATE libros SET codigo = 1 WHERE titulo = 'Martin Fierro';

--7- Actualice el código del libro "Martin Fierro" a "10"
UPDATE libros SET codigo = 10 WHERE titulo = 'Martin Fierro';

--8- Vea qué campo de la tabla "LIBROS" fue establecido como clave primaria
select uc.table_name, column_name from user_cons_columns ucc
  join user_constraints uc
  on ucc.constraint_name=uc.constraint_name
  where uc.constraint_type='P' and
  uc.table_name='LIBROS';

--9- Vea qué campo de la tabla "libros" (en minúsculas) fue establecido como clave primaria
select uc.table_name, column_name from user_cons_columns ucc
  join user_constraints uc
  on ucc.constraint_name=uc.constraint_name
  where uc.constraint_type='P' and
  uc.table_name='libros';
  
----------------------------------------------------------------------------------------------------
DROP TABLE alumnos;
CREATE TABLE alumnos(
  legajo VARCHAR2(4) NOT NULL,
  documento VARCHAR2(8) NOT NULL,
  nombre VARCHAR2(30),
  domicilio VARCHAR2(30),
  PRIMARY KEY(documento)
);
DESCRIBE alumnos;

INSERT INTO alumnos(legajo, documento, nombre, domicilio)
  VALUES('A233','22345345','Perez Mariana','Colon 234');
INSERT INTO alumnos(legajo, documento, nombre, domicilio)
  VALUES('A567','23545345','Morales Marcos','Avellaneda 348');

--6- Intente ingresar un alumno con número de documento existente (no lo permite)
INSERT INTO alumnos(legajo, documento, nombre, domicilio)
  VALUES('A567','23545345','Morales Marcos','Avellaneda 348');

--7- Intente ingresar un alumno con documento nulo (no lo permite)
INSERT INTO alumnos(legajo, documento, nombre, domicilio)
  VALUES('A567',NULL,'Morales Marcos','Avellaneda 348');
  
--8- Vea el campo clave primaria de "ALUMNOS".
select uc.table_name, column_name from user_cons_columns ucc
  join user_constraints uc
  on ucc.constraint_name=uc.constraint_name
  where uc.constraint_type='P' and
  uc.table_name='ALUMNOS';