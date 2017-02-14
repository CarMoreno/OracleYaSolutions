SELECT * FROM clientes;
DROP TABLE clientes;
DESCRIBE clientes;
CREATE TABLE clientes(
  nombre VARCHAR2(30) NOT NULL,
  domicilio VARCHAR2(30),
  ciudad VARCHAR2(20),
  provincia VARCHAR2(20),
  telefono VARCHAR2(11)
);
INSERT INTO clientes VALUES ('Lopez Marcos','Colon 111','Cordoba','Cordoba',null);
INSERT INTO clientes VALUES ('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585');
INSERT INTO clientes VALUES ('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445');
INSERT INTO clientes VALUES ('Perez Luis','Sarmiento 444','Rosario','Santa Fe',null);
INSERT INTO clientes VALUES ('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685');
INSERT INTO clientes VALUES ('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525');
INSERT INTO clientes VALUES ('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455');
INSERT INTO clientes VALUES ('Lopez Carlos',null,'Cruz del Eje','Cordoba',null);
INSERT INTO clientes VALUES ('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366');
INSERT INTO clientes VALUES ('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');

/*4- Obtenga el total de los registros agrupados por ciudad y provincia (6 filas)*/
SELECT ciudad, provincia, count(*) FROM clientes GROUP BY ciudad, provincia;

/*5- Obtenga el total de los registros agrupados por ciudad y provincia sin considerar los que tienen menos de 2 clientes (3 filas)*/
SELECT ciudad, provincia, count(*) FROM clientes
  GROUP BY ciudad, provincia
  HAVING count(*) > 1;

/*6- Obtenga el total de los clientes que viven en calle "San Martin" (where), agrupados por provincia (group by), de aquellas
ciudades que tengan menos de 2 clientes (having) y omitiendo la fila correspondiente a la ciudad de "Cordoba" (having) (2 filas devueltas)*/

SELECT ciudad, count(*) FROM clientes
  WHERE domicilio LIKE '%San Martin%'
  GROUP BY ciudad
  HAVING count(*) < 2 and ciudad <> 'Cordoba';

-------------------------------------------------------------------------------------------------------------------------
DROP TABLE visitantes;

CREATE TABLE visitantes(
  nombre VARCHAR2(30),
  edad NUMBER(2),
  sexo CHAR(1),
  domicilio VARCHAR2(30),
  ciudad VARCHAR2(20),
  telefono VARCHAR2(11),
  montocompra NUMBER(6,2) NOT NULL
 );
 
INSERT INTO visitantes VALUES ('Susana Molina',28,'f',null,'Cordoba',null,45.50);  
INSERT INTO visitantes VALUES ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
INSERT INTO visitantes VALUES ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
INSERT INTO visitantes VALUES ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
INSERT INTO visitantes VALUES ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20); 
INSERT INTO visitantes VALUES ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
INSERT INTO visitantes VALUES ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
INSERT INTO visitantes VALUES ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
INSERT INTO visitantes VALUES ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
INSERT INTO visitantes VALUES ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

SELECT * FROM visitantes;

/*4- Obtenga el total de las compras agrupados por ciudad y sexo de aquellas filas que devuelvan un valor superior a 50 (3 filas)*/
SELECT ciudad, sexo, sum(montocompra) AS TOTAL_COMPRAS FROM visitantes
  GROUP BY ciudad, sexo
  HAVING sum(montocompra) > 50;

/*5- Obtenga el total de las compras agrupados por ciudad y sexo (group by), considerando sólo los montos de compra superiores a 50 (where),
los visitantes con teléfono (where), sin considerar la ciudad de "Cordoba" (having), ordenados por ciudad (order by) (2 filas)*/

SELECT ciudad, sexo, sum(montocompra) AS TOTAL_COMPRAS FROM visitantes
  WHERE montocompra > 50 AND telefono IS NOT NULL
  GROUP BY ciudad, sexo
  HAVING ciudad <> 'Cordoba'
  ORDER BY ciudad;

/*6- Muestre el monto mayor de compra agrupado por ciudad, siempre que dicho valor supere los 50 pesos (having), considerando sólo los visitantes
de sexo femenino y domicilio conocido (where) (2 filas)*/  

SELECT ciudad, max(montocompra) FROM visitantes
  WHERE sexo = 'f' AND domicilio IS NOT NULL
  GROUP BY ciudad
  HAVING max(montocompra) > 50;

/*7- Agrupe por ciudad y sexo, muestre para cada grupo el total de visitantes, la suma de sus compras y el promedio de compras, ordenado
por la suma total y considerando las filas con promedio superior a 30 (3 filas)*/  

SELECT ciudad, sexo, count(*) AS NO_VISITANTES, sum(montocompra) AS TOTAL_MONTO, avg(montocompra) AS PROMEDIO_COMPRAS FROM visitantes
  GROUP BY ciudad, sexo
  HAVING avg(montocompra) > 30
  ORDER BY sum(montocompra);