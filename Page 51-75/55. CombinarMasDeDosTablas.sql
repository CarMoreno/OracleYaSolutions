DROP TABLE socios;
DROP TABLE inscriptos;
DROP TABLE deportes;


create table socios(
  documento char(8) not null, 
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key(documento)
);
 create table deportes(
  codigo number(2),
  nombre varchar2(20),
  profesor varchar2(15),
  primary key(codigo)
);
 create table inscriptos(
  documento char(8) not null, 
  codigodeporte number(2) not null,
  año char(4),
  matricula char(1),--'s'=paga, 'n'=impaga
  primary key(documento,codigodeporte,año)
);

--Socios
insert into socios values('22222222','Ana Acosta','Avellaneda 111');
insert into socios values('23333333','Betina Bustos','Bulnes 222');
insert into socios values('24444444','Carlos Castro','Caseros 333');
insert into socios values('25555555','Daniel Duarte','Dinamarca 44');

--Deportes
insert into deportes values(1,'basquet','Juan Juarez');
insert into deportes values(2,'futbol','Pedro Perez');
insert into deportes values(3,'natacion','Marina Morales');
insert into deportes values(4,'tenis','Marina Morales');

--
insert into inscriptos values ('22222222',3,'2006','s');
insert into inscriptos values ('23333333',3,'2006','s');
insert into inscriptos values ('24444444',3,'2006','n');
 
--
insert into inscriptos values ('22222222',3,'2005','s');
insert into inscriptos values ('22222222',3,'2007','n');

--
insert into inscriptos values ('24444444',1,'2006','s');
insert into inscriptos values ('24444444',2,'2006','s');
--
insert into inscriptos values ('26666666',0,'2006','s');

--9- Muestre el nombre del socio, el nombre del deporte en que se inscribió y el año empleando diferentes tipos de join (8 filas):
SELECT s.nombre, d.nombre AS DEPORTE, i.año 
  FROM inscriptos i LEFT JOIN socios s
  ON(i.documento = s.documento)
  LEFT JOIN deportes d 
  ON(d.codigo = i.codigodeporte);

SELECT s.nombre, d.nombre AS DEPORTE, i.año
  FROM socios s RIGHT JOIN inscriptos i
  ON(i.documento = s.documento)
  RIGHT JOIN deportes d
  ON(d.codigo = i.codigodeporte);
  
SELECT s.nombre, d.nombre AS DEPORTE, i.año
  FROM socios s RIGHT JOIN inscriptos i
  ON(i.documento = s.documento)
  LEFT JOIN deportes d
  ON(d.codigo = i.codigodeporte);

--11- Muestre todas las inscripciones del socio con documento "22222222" (3 filas)
SELECT s.nombre, d.nombre AS DEPORTE, i.año 
  FROM inscriptos i LEFT JOIN socios s
  ON(i.documento = s.documento)
  LEFT JOIN deportes d 
  ON(d.codigo = i.codigodeporte)
  WHERE s.documento = '22222222';

--10- Muestre todos los datos de las inscripciones (excepto los códigos) incluyendo aquellas inscripciones cuyo código de deporte 
--no existe en "deportes" y cuyo documento de socio no se encuentra en "socios" (10 filas)

SELECT s.nombre, d.nombre AS DEPORTE, i.año, i.matricula
FROM inscriptos i FULL JOIN socios s
ON(i.documento = s.documento)
FULL JOIN deportes d
ON(i.codigodeporte = d.codigo);