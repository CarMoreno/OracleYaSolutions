SELECT * FROM CLIENTES;
DESCRIBE clientes;
-- Usando la tabla clientes realize los siguientes ejercicios:

--3- Obtenga las provincias sin repetir (3 registros)
SELECT DISTINCT provincia FROM clientes;

--4- Cuente las distintas provincias (retorna 3)
SELECT count(DISTINCT provincia) AS PROVINCIAS FROM clientes;

--5- Se necesitan los nombres de las ciudades sin repetir (6 registros)
SELECT DISTINCT ciudad FROM clientes;

--6- Obtenga la cantidad de ciudades distintas (devuelve 6)
SELECT count(DISTINCT ciudad) AS CIUDADES FROM clientes;

--7- Combine con "where" para obtener las distintas ciudades de la provincia de Cordoba (3 registros)
SELECT DISTINCT ciudad, provincia FROM clientes
  WHERE provincia LIKE '%Cordoba%';
  
--8- Contamos las distintas ciudades de cada provincia empleando "group by" (3 filas)
SELECT provincia, count(DISTINCT ciudad) AS CIUDADES FROM clientes
  GROUP BY provincia;
  
-----------------------------------------------------------------------------------------
CREATE TABLE inmuebles(
  documento VARCHAR2(8) NOT NULL,
  apellido VARCHAR2(30),
  nombre VARCHAR2(30),
  domicilio VARCHAR2(20),
  barrio VARCHAR2(20),
  ciudad VARCHAR2(20),
  tipo CHAR(1),
  superficie NUMBER(8,2)
);

insert into inmuebles values ('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100);
insert into inmuebles values ('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200);
insert into inmuebles values ('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250);
insert into inmuebles values ('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200);
insert into inmuebles values ('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300);
insert into inmuebles values ('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200);
insert into inmuebles values ('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500);
insert into inmuebles values ('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350);
insert into inmuebles values ('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

--4- Muestre los distintos apellidos de los propietarios, sin repetir (3 registros)
SELECT DISTINCT apellido FROM inmuebles;

/*5- Recupere los distintos documentos de los propietarios y luego muestre los distintos 
documentos de los propietarios, sin repetir y vea la diferencia (9 y 6 registros respectivamente)*/
SELECT documento FROM inmuebles;
SELECT DISTINCT documento FROM inmuebles;

/*6- Cuente, sin repetir, la cantidad de propietarios de inmuebles de la ciudad de Cordoba (5)*/
SELECT count(DISTINCT documento) AS PROPIETARIOS FROM inmuebles
  WHERE ciudad LIKE '%Cordoba%';
  
--7- Cuente la cantidad de inmuebles con domicilio en 'San Martin' (3)
SELECT count(*) AS CANTIDAD FROM inmuebles
  WHERE domicilio LIKE '%San Martin%';
  
/*8- Cuente la cantidad de inmuebles con domicilio en 'San Martin', sin repetir la ciudad (2 registros). Compare con la sentencia anterior.*/
SELECT count(DISTINCT ciudad) AS CANTIDAD FROM inmuebles
  WHERE domicilio LIKE '%San Martin%';
  
--9- Muestre los apellidos y nombres de todos los registros(9 registros)
SELECT apellido, nombre FROM inmuebles;

--10- Muestre los apellidos y nombres, sin repetir (5 registros)
SELECT DISTINCT apellido, nombre FROM inmuebles;

--11- Muestre la cantidad de inmuebles que tiene cada propietario en barrios conocidos, agrupando por documento (6 registros)
SELECT DISTINCT documento, count(barrio) AS CANTIDAD FROM inmuebles
  WHERE barrio IS NOT NULL
  GROUP BY documento;
  
--12- Realice la misma consulta anterior pero en esta oportunidad, sin repetir barrio (6 registros)
SELECT DISTINCT documento, count(DISTINCT barrio) AS CANTIDAD FROM inmuebles
  WHERE barrio IS NOT NULL
  GROUP BY documento;