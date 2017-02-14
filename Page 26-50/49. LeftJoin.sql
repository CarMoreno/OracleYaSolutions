drop table clientes;
drop table provincias;

create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(3)
);

create table provincias(
  codigo number(3),
  nombre varchar2(20)
);

ALTER TABLE clientes
ADD CONSTRAINT UQ_clientes_codigo
UNIQUE(codigo);

ALTER TABLE provincias
ADD CONSTRAINT UQ_codigo_provincias
UNIQUE(codigo);

insert into provincias values(1,'Cordoba');
insert into provincias values(2,'Santa Fe');
insert into provincias values(3,'Corrientes');
insert into provincias values(4,'Santa Cruz');
insert into provincias values(null,'Salta');
insert into provincias values(null,'Jujuy');

insert into clientes values (100,'Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values (200,'Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values (300,'Garcia Juan','Rivadavia 333','Villa Maria',null);
insert into clientes values (400,'Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values (500,'Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values (600,'Torres Fabiola','Alem 777','La Plata',5);
insert into clientes values (700,'Garcia Luis','Sucre 475','Santa Rosa',null);

--3- Muestre todos los datos de los clientes, incluido el nombre de la provincia

SELECT c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA 
FROM clientes c LEFT JOIN provincias p 
ON(c.codigoprovincia = p.codigo);

--4- Realice la misma consulta anterior pero alterando el orden de las tablas.
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA 
FROM provincias p LEFT JOIN clientes c 
ON(p.codigo = c.codigoprovincia);

--5- Muestre solamente los clientes de las provincias que existen en "provincias" (4 registros)
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre AS provincia 
FROM provincias p LEFT JOIN clientes c
ON(p.codigo = c.codigoprovincia)
WHERE c.codigoprovincia IS NOT NULL;

--6- Muestre todos los clientes cuyo código de provincia NO existe en "provincias" ordenados por nombre del cliente (3 registros)
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre AS provincias 
FROM clientes c LEFT JOIN provincias p
ON(c.codigoprovincia = p.codigo)
WHERE p.codigo IS NULL
ORDER BY c.nombre;

--7- Obtenga todos los datos de los clientes de "Cordoba" (2 registros)
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA 
FROM clientes c LEFT JOIN provincias p
ON(c.codigoprovincia = p.codigo)
WHERE p.nombre = 'Cordoba';