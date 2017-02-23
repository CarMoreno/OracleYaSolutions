DROP TABLE deportes;
DROP TABLE inscriptos;

CREATE TABLE deportes(
  codigo NUMBER(2),
  nombre VARCHAR2(30),
  profesor VARCHAR2(30)
);
CREATE TABLE inscriptos(
  documento CHAR(8),
  codigodeporte NUMBER(2),
  matricula CHAR(1) --'s' = paga, 'n'='impaga' 
);
ALTER TABLE deportes
ADD CONSTRAINT PK_deportes_codigo
PRIMARY KEY(codigo);

ALTER TABLE inscriptos
ADD CONSTRAINT PK_inscriptos_doc_coddeporte
PRIMARY KEY(documento, codigodeporte);

insert into deportes values(1,'tenis','Marcelo Roca');
insert into deportes values(2,'natacion','Marta Torres');
insert into deportes values(3,'basquet','Luis Garcia');
insert into deportes values(4,'futbol','Marcelo Roca');
 
insert into inscriptos values('22222222',3,'s');
insert into inscriptos values('23333333',3,'s');
insert into inscriptos values('24444444',3,'n');
insert into inscriptos values('22222222',2,'s');
insert into inscriptos values('23333333',2,'s');
insert into inscriptos values('22222222',4,'n'); 
insert into inscriptos values('22222222',5,'n'); 

--3- Muestre todos la información de la tabla "inscriptos", y consulte la tabla "deportes" para obtener el nombre de
--cada deporte (6 registros)

SELECT i.documento, i.matricula, d.nombre AS DEPORTE
FROM inscriptos i JOIN deportes d
ON(i.codigodeporte = d.codigo);

--4- Empleando un "left join" con "deportes" obtenga todos los datos de los inscriptos (7 registros)
SELECT i.documento, i.matricula, d.nombre, d.profesor
FROM inscriptos i LEFT JOIN deportes d
ON(i.codigodeporte = d.codigo);

--5- Obtenga la misma salida anterior empleando un "rigth join"
SELECT i.documento, i.matricula, d.nombre, d.profesor
FROM deportes d RIGHT JOIN inscriptos i
ON(d.codigo = i.codigodeporte);

--6- Muestre los deportes para los cuales no hay inscriptos, empleando un "left join" (1 registro)
SELECT d.nombre, d.profesor 
FROM deportes d LEFT JOIN inscriptos i
ON(d.codigo = i.codigodeporte)
WHERE i.codigodeporte IS NULL;

--7- Muestre los documentos de los inscriptos a deportes que no existen en la tabla "deportes" (1 registro)
SELECT i.documento FROM inscriptos i LEFT JOIN deportes d ON(i.codigodeporte = d.codigo)
WHERE d.codigo IS NULL;

--8- Emplee un "full join" para obtener todos los datos de ambas tablas, incluyendo las inscripciones a deportes inexistentes
--en "deportes" y los deportes que no tienen inscriptos (8 registros)

SELECT d.nombre, d.profesor, i.documento, i.matricula 
FROM deportes d FULL JOIN inscriptos i
ON(d.codigo = i.codigodeporte);