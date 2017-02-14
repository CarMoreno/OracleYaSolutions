DROP TABLE provincias; 
DROP TABLE clientes;


CREATE TABLE clientes(
  codigo NUMBER(5),
  nombre VARCHAR2(30),
  domicilio varchar2(30),
  ciudad VARCHAR(20),
  codigoprovincia NUMBER(2)
);

CREATE TABLE provincias(
  codigo NUMBER(5),
  nombre VARCHAR2(20)
);

insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Corrientes');
 insert into provincias values(null,'La Pampa');

 insert into clientes values (1,'Lopez Marcos','Colon 111','Córdoba',1);
 insert into clientes values (2,'Perez Ana','San Martin 222','Cruz del Eje',1);
 insert into clientes values (3,'Garcia Juan','Rivadavia 333','Villa Maria',null);
 insert into clientes values (4,'Perez Luis','Sarmiento 444','Rosario',2);
 insert into clientes values (5,'Pereyra Lucas','San Martin 555','Cruz del Eje',1);
 insert into clientes values (6,'Gomez Ines','San Martin 666','Santa Fe',2);
 insert into clientes values (7,'Torres Fabiola','Alem 777','Ibera',3);
 insert into clientes values (8,'Garcia Paco','Avellaneda 888','Rawson',5);
 
--4- Obtenga los datos de ambas tablas, usando alias.
SELECT cli.nombre, cli.domicilio, cli.ciudad, pro.nombre FROM clientes cli JOIN provincias pro 
ON(cli.codigoprovincia = pro.codigo);

--5- Obtenga la misma información anterior pero ordenada por nombre de provincia (join y order by)
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre FROM clientes c JOIN provincias p
ON(c.codigoprovincia = p.codigo)
ORDER BY p.nombre;


--6- Recupere todos los datos de los clientes de la provincia "Santa Fe"
SELECT c.nombre, c.domicilio, c.ciudad, p.nombre FROM clientes c JOIN provincias P
ON(c.codigoprovincia = p.codigo)
WHERE P.nombre LIKE '%Santa Fe%';

---------------------------------------------------------------------------------------------------------

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


--3- Muestre el nombre, el deporte y las fechas de inasistencias, ordenado por nombre y deporte.

SELECT ins.nombre, ins.deporte, inas.fecha FROM inscriptos ins JOIN inasistencias inas
ON(ins.documento = inas.documento AND ins.deporte = inas.deporte)
ORDER BY ins.nombre, ins.deporte;

--4- Obtenga el nombre, deporte y las fechas de inasistencias de un determinado inscripto en un determinado 
--deporte (3 registros).

SELECT ins.nombre, ins.deporte, inas.fecha FROM inscriptos ins JOIN inasistencias inas
ON(ins.documento = inas.documento AND ins.deporte = inas.deporte)
WHERE ins.nombre LIKE '%Juan Perez%';

--5- Obtenga el nombre, deporte y las fechas de inasistencias de todos los inscriptos que pagaron la matrícula (4 registros)
SELECT ins.nombre, ins.deporte, inas.fecha FROM inscriptos ins JOIN inasistencias inas
ON(ins.documento = inas.documento AND ins.deporte = inas.deporte)
WHERE ins.matricula = 's';

