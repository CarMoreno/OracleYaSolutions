DROP TABLE clientes;
DROP TABLE provincias;

CREATE TABLE clientes(
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2)
);

CREATE TABLE provincias(
  codigoprovincia number(2),
  nombre varchar2(20)
);

insert into provincias values(1,'Cordoba');
insert into provincias values(2,'Santa Fe');
insert into provincias values(3,'Corrientes');
insert into provincias values(null,'Salta');

insert into clientes values (100,'Lopez Marcos','Colon 111','Córdoba',1);
insert into clientes values (101,'Perez Ana','San Martin 222','Cruz del Eje',1);
insert into clientes values (102,'Garcia Juan','Rivadavia 333','Villa Maria',1);
insert into clientes values (103,'Perez Luis','Sarmiento 444','Rosario',2);
insert into clientes values (104,'Gomez Ines','San Martin 666','Santa Fe',2);
insert into clientes values (105,'Torres Fabiola','Alem 777','La Plata',4);
insert into clientes values (106,'Garcia Luis','Sucre 475','Santa Rosa',null);


--3- Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un "left join" (7 filas)
SELECT c.codigo, c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA
FROM clientes c LEFT JOIN provincias p
ON(c.codigoprovincia = p.codigoprovincia);

--4- Obtenga la misma salida que la consulta anterior pero empleando un "join" con el modificador (+)
SELECT c.codigo, c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA
FROM clientes c JOIN provincias p
ON(c.codigoprovincia = p.codigoprovincia (+));

--5- Muestre todos los datos de los clientes, incluido el nombre de la provincia empleando un "right join" para que las 
--provincias de las cuales no hay clientes también aparezcan en la consulta (7 filas)
SELECT c.codigo, c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA
FROM clientes c RIGHT JOIN provincias p
ON(c.codigoprovincia = p.codigoprovincia);

--6- Obtenga la misma salida que la consulta anterior pero empleando un "join" con el modificador (+)
SELECT c.codigo, c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA
FROM provincias p JOIN clientes c
ON(c.codigoprovincia (+) = p.codigoprovincia);

--7- Intente colocar en una consulta "join", el modificador "(+)" en ambos campos del enlace (mensaje de error)
SELECT c.codigo, c.nombre, c.domicilio, c.ciudad, p.nombre AS PROVINCIA
FROM clientes c JOIN provincias p
ON(c.codigoprovincia (+) = p.codigoprovincia (+));

--8- Intente realizar un natural join entre ambas tablas mostrando el nombre del cliente, la ciudad y nombre de la provincia (las tablas 
--tienen 2 campos con igual nombre "codigoprovincia" y "nombre"; mensaje de error)
SELECT c.nombre, c.ciudad, p.nombre AS PROVINCIA
FROM clientes c NATURAL JOIN provincias p;

--9- Realice una combinación entre ambas tablas empleando la cláusula "using" (5 filas)
SELECT c.nombre, c.ciudad, p.nombre AS PROVINCIA
FROM clientes c JOIN provincias p
USING(codigoprovincia);

---------------------------------------------------------------------------------------------------------------------------------
drop table inscriptos;
drop table inasistencias;

create table inscriptos(
  nombre varchar2(30),
  documento char(8),
  deporte varchar2(15),
  matricula char(1), --'s'=paga; 'n'=impaga
  primary key(documento,deporte)
);

create table inasistencias(
  documento char(8),
  deporte varchar2(15),
  fecha date
);

insert into inscriptos values('Juan Perez','22222222','tenis','s');
insert into inscriptos values('Maria Lopez','23333333','tenis','s');
insert into inscriptos values('Agustin Juarez','24444444','tenis','n');
insert into inscriptos values('Marta Garcia','25555555','natacion','s');
insert into inscriptos values('Juan Perez','22222222','natacion','s');
insert into inscriptos values('Maria Lopez','23333333','natacion','n');

insert into inasistencias values('22222222','tenis','01/12/2006');
insert into inasistencias values('22222222','tenis','08/12/2006');
insert into inasistencias values('23333333','tenis','01/12/2006');
insert into inasistencias values('24444444','tenis','08/12/2006');
insert into inasistencias values('22222222','natacion','02/12/2006');
insert into inasistencias values('23333333','natacion','02/12/2006');

--3- Muestre toda la información de "inscriptos", realizando una combinación con 
--"inasistencias". Realice un "left join" para incluir todos los "inscriptos" aunque no se encuentren en "inasistencias" (7 filas)
SELECT ins.nombre, ins.deporte, ins.matricula
FROM inscriptos ins LEFT JOIN inasistencias inas
ON(ins.documento = inas.documento AND ins.deporte = inas.deporte);

--4- Obtenga el mismo resultado anterior empleando un "join" y el modificador "(+)" (7 filas)
SELECT ins.nombre, ins.deporte, ins.matricula
FROM inscriptos ins LEFT JOIN inasistencias inas
ON(ins.documento = inas.documento(+) AND ins.deporte = inas.deporte(+));

--5- Intente realizar un natural join entre ambas tablas mostrando el nombre del inscripto, el deporte y la fecha de inasistencia
--(mensaje de error porque hay 2 campos con igual nombre)
SELECT ins.nombre, ins.deporte, ins.matricula
FROM inscriptos ins NATURAL JOIN inasistencias inas;

--6- Realice una combinación entre ambas tablas mostrando toda la información y empleando la cláusula "using" (6 filas)
SELECT * FROM inscriptos JOIN inasistencias USING(documento, deporte);