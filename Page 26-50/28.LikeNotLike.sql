DROP TABLE empleados;
DESCRIBE empleados;
CREATE TABLE empleados(
  nombre VARCHAR2(30),
  documento CHAR(8) NOT NULL,
  domicilio VARCHAR2(30),
  fechaingreso DATE,
  seccion VARCHAR2(20),
  sueldo NUMBER(6,2),
  PRIMARY KEY(documento)
);

INSERT INTO empleados VALUES('Juan Perez','22333444','Colon 123','08/10/1990','Gerencia',900.50);
INSERT INTO empleados VALUES('Ana Acosta','23444555','Caseros 987','18/12/1995','Secretaria',590.30);
INSERT INTO empleados VALUES('Lucas Duarte','25666777','Sucre 235','15/05/2005','Sistemas',790);
INSERT INTO empleados VALUES('Pamela Gonzalez','26777888','Sarmiento 873','12/02/1999','Secretaria',550);
INSERT INTO empleados VALUES('Marcos Juarez','30000111','Rivadavia 801','22/09/2002','Contaduria',630.70);
INSERT INTO empleados VALUES('Yolanda perez','35111222','Colon 180','08/10/1990','Administracion',400);
INSERT INTO empleados VALUES('Rodolfo perez','35555888','Coronel Olmedo 588','28/05/1990','Sistemas',800);

SELECT * FROM empleados;

/*4- Muestre todos los empleados con apellido "Perez" empleando el operador "like" (1 registro)
Note que no incluye los "perez" (que comienzan con minúscula).*/

SELECT * FROM empleados WHERE nombre LIKE '%Perez%';

/*5- Muestre todos los empleados cuyo domicilio comience con "Co" y tengan un "8" (2 registros)*/
SELECT * FROM empleados WHERE domicilio LIKE '%Co%8%';

/*6- Seleccione todos los empleados cuyo documento finalice en 1 ó 4 (2 registros)*/
SELECT * FROM empleados WHERE documento LIKE '%_1' OR documento LIKE '%_4';

/*7- Seleccione todos los empleados cuyo documento NO comience con 2 y cuyo nombre finalice en "ez"*/
SELECT * FROM empleados
  WHERE documento NOT LIKE '2%' AND nombre LIKE '%ez';
  
/*8- Recupere todos los nombres que tengan una "G" o una "J" en su nombre o apellido (3 registros)*/
SELECT nombre FROM empleados WHERE nombre LIKE '%G%' OR nombre LIKE '%J%';

/*9- Muestre los nombres y sección de los empleados que pertenecen a secciones que comiencen con "S" o "G" y tengan 8 caracteres (3 registros)*/
SELECT nombre, seccion FROM empleados 
  WHERE (seccion LIKE 'S%' OR seccion LIKE 'G%') AND (length(seccion) = 8);

/*10- Muestre los nombres y sección de los empleados que pertenecen a secciones que NO comiencen con "S" (3 registros)*/
SELECT nombre, seccion FROM empleados
  WHERE seccion NOT LIKE 'S%';

/*11- Muestre todos los nombres y sueldos de los empleados cuyos sueldos se encuentren entre 500,00 y 599,99 empleando "like" (2 registros)*/
SELECT nombre, sueldo FROM empleados
  WHERE sueldo LIKE '5__%';
  
/*14- Elimine todos los empleados cuyos apellidos comiencen con "p" (minúscula) (2 registros)*/
DELETE FROM empleados WHERE nombre LIKE '%p%';

SELECT length(seccion) AS LONGITUD FROM empleados;  