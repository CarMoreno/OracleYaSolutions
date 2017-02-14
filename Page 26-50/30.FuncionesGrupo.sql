DROP TABLE empleados;
CREATE TABLE empleados(
  nombre VARCHAR2(30),
  documento CHAR(8),
  domicilio VARCHAR2(30),
  seccion VARCHAR2(20),
  sueldo NUMBER(6,2),
  cantidadhijos NUMBER(2),
  fechaingreso DATE,
  PRIMARY KEY(documento)
);

INSERT INTO empleados VALUES('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'10/10/1980');
INSERT INTO empleados VALUES('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'15/08/1998');
INSERT INTO empleados VALUES('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,null);
INSERT INTO empleados VALUES('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,null);
INSERT INTO empleados VALUES('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'26/08/2000');
INSERT INTO empleados VALUES('Yolanda Perez','35111222','Colon 180','Administracion',3200,1,'25/09/2001');
INSERT INTO empleados VALUES('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,null);
INSERT INTO empleados VALUES('Martina Rodriguez','30141414','Sarmiento 1234','Administracion',3800,4,'14/12/2000');
INSERT INTO empleados VALUES('Andres Costa','28444555',default,'Secretaria',null,null,'08/08/1990');

--4- Muestre la cantidad de empleados usando "count" (9 empleados)
SELECT count(*) AS "NUMERO EMPLEADOS" FROM empleados;

--5- Muestre la cantidad de empleados con fecha de ingreso conocida (6 empleados)
SELECT count(fechaingreso) FROM empleados;

--6- Muestre la cantidad de empleados con sueldo (8 empleados)
SELECT count(sueldo) FROM empleados;

--7- Muestre la cantidad de empleados con sueldo de la sección "Secretaria" (2 empleados)
SELECT count(sueldo) FROM empleados WHERE seccion = 'Secretaria';

--8- Muestre el sueldo más alto y el más bajo colocando un alias (5000 y 2000 respectivamente)
SELECT max(sueldo) AS "SUELDO MAS ALTO", min(sueldo) AS "SUELDO MAS BAJO" FROM empleados;

--9- Muestre el valor mayor de "cantidadhijos" de los empleados "Perez" (3 hijos)
SELECT max(cantidadhijos) FROM empleados WHERE nombre LIKE '%Perez%';

--10- Muestre la fecha de ingreso más reciente (max) y la más lejana (min) (25/09/01 y 10/10/80 respectivamente)
SELECT max(fechaingreso) AS "MAS RECIENTE", min(fechaingreso) AS "MAS LEJANA" FROM empleados;

--11- Muestre el documento menor (22333444)
SELECT min(documento) AS "DOCUMENTO MENOR" FROM empleados;

--12- Muestre el promedio de sueldos de todo los empleados (3400. Note que hay un sueldo nulo y no es tenido en cuenta)
SELECT avg(sueldo) AS "PROMEDIO $" FROM empleados;

/*13- Muestre el promedio de sueldos de los empleados de la sección "Secretaría" (2100. Note que hay 3 registros de la sección solicitada, 
pero como uno de ellos tiene sueldo nulo, no es tenido en cuenta)*/
SELECT avg(sueldo) AS "PROMEDIO $ SECRETARIA" FROM empleados WHERE seccion = 'Secretaria';

--14- Muestre el promedio de hijos de todos los empleados de "Sistemas" (retorna 2)
SELECT avg(cantidadhijos) AS "PROMEDIO HIJOS" FROM empleados WHERE seccion = 'Sistemas';

/*15- Muestre la cantidad de empleados, la cantidad de empleados con domicilio conocido, la suma de los hijos, el promedio de los sueldos
y los valores mínimo y máximo del campo "fechaingreso" de todos los empleados. Empleamos todas las funciones de grupo en una sola
consulta y nos retorna 9, 8, 14, 3400, 10/10/80 y 25/09/01.*/

SELECT count(*) AS "CANT. EMPLEADOS", count(domicilio) AS "CON DOMICILIO", sum(cantidadhijos) AS "SUMA HIJOS",
  avg(sueldo) AS "PROMEDIO $", min(fechaingreso) AS "FECHA LEJANA", max(fechaingreso) AS "FECHA CERCANA" FROM empleados;
  
/*16- Realice la misma consulta anterior pero ahora de los empleados de la sección "Recursos". Al no existir tal sección, "count(*)" y "count(domicilio)" 
retornan 0 (cero) y las demás funciones de grupo retornan "null".*/
SELECT count(*) AS "CANT. EMPLEADOS", count(domicilio) AS "CON DOMICILIO", sum(cantidadhijos) AS "SUMA HIJOS",
  avg(sueldo) AS "PROMEDIO $", min(fechaingreso) AS "FECHA LEJANA", max(fechaingreso) AS "FECHA CERCANA" FROM empleados
    WHERE seccion = 'Recursos';  