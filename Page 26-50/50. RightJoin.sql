drop table clientes;
 drop table provincias;

 create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2),
  primary key(codigo)
 );

 create table provincias(
  codigo number(2),
  nombre varchar2(20),
  primary key (codigo)
 );
 
insert into provincias values(1,'Cordoba');
insert into provincias values(2,'Santa Fe');
insert into provincias values(3,'Corrientes');

insert into clientes values (101,'Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values (102,'Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values (103,'Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values (104,'Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values (105,'Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values (106,'Torres Fabiola','Alem 777','La Plata',4);
insert into clientes values (107,'Garcia Luis','Sucre 475','Santa Rosa',5);
 
--3- Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un "right join".
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA
FROM provincias p RIGHT JOIN clientes c
ON(p.codigo = c.codigoprovincia);

--4- Obtenga la misma salida que la consulta anterior pero empleando un "left join".
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA
FROM clientes c LEFT JOIN provincias p
ON(c.codigoprovincia = p.codigo);

--5- Empleando un "right join", muestre solamente los clientes de las provincias que existen en "provincias" (5 registros)
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA
FROM provincias p RIGHT JOIN clientes c
ON(p.codigo = c.codigoprovincia)
WHERE p.codigo IS NOT NULL;

--6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por ciudad (2 registros)
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA
FROM provincias p RIGHT JOIN clientes c
ON(p.codigo = c.codigoprovincia)
WHERE p.codigo IS NULL
ORDER BY c.ciudad;