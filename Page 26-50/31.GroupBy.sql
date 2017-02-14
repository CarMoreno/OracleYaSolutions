DROP TABLE visitantes;
CREATE TABLE visitantes(
  nombre VARCHAR2(30),
  edad NUMBER(2),
  sexo CHAR(1) DEFAULT 'f',
  domicilio VARCHAR2(30),
  ciudad VARCHAR2(20) DEFAULT 'Cordoba',
  telefono VARCHAR2(11),
  mail VARCHAR2(30) DEFAULT 'no tiene',
  montocompra NUMBER(6,2)
 );
 
INSERT INTO visitantes VALUES ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
INSERT INTO visitantes VALUES ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
INSERT INTO visitantes VALUES ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
INSERT INTO visitantes (nombre, edad,sexo,telefono, mail)
  VALUES ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
INSERT INTO visitantes (nombre, ciudad, montocompra)
  VALUES ('Alejandra Gonzalez','La Falda',280.50);
INSERT INTO visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  VALUES ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
INSERT INTO visitantes VALUES ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
INSERT INTO visitantes VALUES ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

--4- Queremos saber la cantidad de visitantes de cada ciudad utilizando la cláusula "group by" (4 filas devueltas)
SELECT ciudad, count(*) AS VISITANTES FROM visitantes group by ciudad;

--5- Queremos la cantidad visitantes con teléfono no nulo, de cada ciudad (4 filas devueltas)
SELECT ciudad, count(telefono) AS VISITANTES FROM visitantes GROUP BY ciudad;

/*6- Necesitamos el total del monto de las compras agrupadas por sexo (3 filas)
Note que los registros con valor nulo en el campo "sexo" se procesan como un grupo diferente.*/
SELECT sexo, sum(montocompra) AS TOTAL_MONTO FROM visitantes GROUP BY sexo;

/*7- Se necesita saber el máximo y mínimo valor de compra agrupados por sexo y ciudad (6 filas)*/
SELECT sexo, ciudad, max(montocompra) AS MAXIMA_COMPRA, min(montocompra) AS MINIMA_COMPRA FROM visitantes
  GROUP BY sexo, ciudad;
  
/*8- Calcule el promedio del valor de compra agrupados por ciudad (4 filas)*/  
SELECT ciudad, avg(montocompra) AS PROMEDIO FROM visitantes GROUP BY ciudad;

/*9- Cuente y agrupe por ciudad sin tener en cuenta los visitantes que no tienen mail (3 filas)*/
SELECT ciudad, count(*) AS No_VISITANTES FROM visitantes
  WHERE mail <> 'no tiene' AND mail IS NOT NULL 
  GROUP BY ciudad;
  
-------------------------------------------------------------------------------------------------
/*4- Cuente la cantidad de empleados agrupados por sección (5 filas)*/
SELECT seccion, count(*) AS EMPLEADOS FROM empleados GROUP BY seccion;

/*5- Calcule el promedio de hijos por sección (5 filas)*/
SELECT seccion, AVG(cantidadhijos) AS No_HIJOS FROM empleados GROUP BY seccion;

/*6- Cuente la cantidad de empleados agrupados por año de ingreso (6 filas)*/
SELECT extract(year FROM fechaingreso) AS EMPLEADOS_FECHAINGRESO, count(*) FROM empleados
  GROUP BY  extract(year FROM fechaingreso);
  
/*7- Calcule el promedio de sueldo por sección de los empleados con hijos (4 filas)*/
SELECT seccion, avg(sueldo) AS PROMEDIO FROM empleados
  WHERE cantidadhijos > 0 AND cantidadhijos IS NOT NULL
    GROUP BY seccion;