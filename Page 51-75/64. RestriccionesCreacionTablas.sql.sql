DROP TABLE socios;
DROP TABLE profesores;
DROP TABLE deportes;
DROP TABLE inscriptos;

CREATE TABLE profesores(
  documento CHAR(8) NOT NULL,
  nombre VARCHAR2(30),
  domicilio VARCHAR2(30),
  CONSTRAINT PK_profesores_documento
    PRIMARY KEY(documento)
);
CREATE TABLE deportes(
  codigo NUMBER(2),
  nombre VARCHAR2(20),
  dia VARCHAR(9) DEFAULT 'sábado',
  documentoprofesor CHAR(8),
  CONSTRAINT CK_deportes_dia_lista
    CHECK(dia IN ('lunes', 'martes', 'miercoes', 'jueves', 'viernes', 'sábado')),
  CONSTRAINT PK_deportes_codigo
    PRIMARY KEY(codigo),
  CONSTRAINT FK_deportes_documentoprofesor
    FOREIGN KEY(documentoprofesor)
    REFERENCES profesores(documento)
    ON DELETE SET NULL
);

CREATE TABLE socios(
  numero NUMBER(4),
  documento CHAR(8),
  nombre VARCHAR2(30),
  domicilio VARCHAR2(30),
  CONSTRAINT PK_socios_numero
    PRIMARY KEY(numero),
  CONSTRAINT UQ_socios_documento
    UNIQUE(documento)

);

CREATE TABLE inscriptos(
  numerosocio NUMBER(4),
  codigodeporte NUMBER(2),
  matricula CHAR(1),
  CONSTRAINT PK_inscriptos_numerodeporte
    PRIMARY KEY(numerosocio, codigodeporte),
  CONSTRAINT FK_inscriptos_socio
    FOREIGN KEY (numerosocio)
    REFERENCES socios(numero)
    ON DELETE CASCADE,
  CONSTRAINT FK_inscriptos_deporte
    FOREIGN KEY(codigodeporte)
    REFERENCES deportes(codigo),
  CONSTRAINT CK_matricula_valores
    CHECK (matricula IN ('s', 'n'))    
);
delete inscriptos;

--
insert into profesores values('21111111','Andres Acosta','Avellaneda 111');
insert into profesores values('22222222','Betina Bustos','Bulnes 222');
insert into profesores values('23333333','Carlos Caseros','Colon 333');

--
insert into deportes values(1,'basquet','lunes',null);
insert into deportes values(2,'futbol','lunes','23333333');
insert into deportes values(3,'natacion',null,'22222222');
insert into deportes values(4,'padle',default,'23333333');
insert into deportes values(5,'tenis','jueves',null);

--
insert into socios values(100,'30111111','Martina Moreno','America 111');
insert into socios values(200,'30222222','Natalia Norte','Bolivia 222');
insert into socios values(300,'30333333','Oscar Oviedo','Caseros 333');
insert into socios values(400,'30444444','Pedro Perez','Dinamarca 444');
 
--
insert into inscriptos values(100,3,'s');
insert into inscriptos values(100,5,'s');
insert into inscriptos values(200,1,'s');
insert into inscriptos values(400,1,'n');
insert into inscriptos values(400,4,'s');

--8- Realice un "join" (del tipo que sea necesario) para mostrar todos los datos del socio junto con el nombre de los deportes
--en los cuales está inscripto, el día que tiene que asistir y el nombre del profesor que lo instruirá (5 registros)
SELECT s.nombre, s.domicilio, d.nombre AS DEPORTE, d.dia, p.nombre AS PROFESOR
FROM inscriptos i JOIN socios s
ON(i.numerosocio = s.numero)
JOIN deportes d
ON(i.codigodeporte = d.codigo)
LEFT JOIN profesores p
ON(d.documentoprofesor = p.documento);

--9- Realice la misma consulta anterior pero incluya los socios que no están inscriptos en ningún deporte (6 registros)
SELECT s.nombre, s.domicilio, d.nombre AS DEPORTE, d.dia, p.nombre AS PROFESOR
FROM inscriptos i RIGHT JOIN socios s
ON(i.numerosocio = s.numero)
RIGHT JOIN deportes d
ON(i.codigodeporte = d.codigo)
LEFT JOIN profesores p
ON(d.documentoprofesor = p.documento);

--10- Muestre todos los datos de los profesores, incluido el deporte que dicta y el día, incluyendo los profesores que no tienen
--asignado ningún deporte, ordenados por documento (4 registros)
SELECT p.*, d.nombre AS DEPORTE, d.dia
FROM deportes d RIGHT JOIN profesores p
ON(d.documentoprofesor = p.documento)
ORDER BY p.documento;

--11- Muestre todos los deportes y la cantidad de inscriptos en cada uno de ellos, incluyendo aquellos deportes para los cuales
--no hay inscriptos, ordenados por nombre de deporte (5 registros)
SELECT d.nombre, count(i.numerosocio) AS "CANT INSCRIPTOS" 
FROM deportes d LEFT JOIN inscriptos i
ON(d.codigo = i.codigodeporte)
GROUP BY d.nombre
ORDER BY d.nombre;

--12- Muestre las restricciones de "socios"
SELECT constraint_name, constraint_type, delete_rule FROM user_constraints WHERE table_name = 'SOCIOS';

--13- Muestre las restricciones de "deportes"
SELECT constraint_name, constraint_type, delete_rule FROM user_constraints WHERE table_name = 'DEPORTES';

--14- Obtenga información sobre la restricción "foreign key" de "deportes"
SELECT * FROM user_constraints WHERE constraint_name = 'FK_DEPORTES_DOCUMENTOPROFESOR';

--15- Muestre las restricciones de "profesores"
SELECT constraint_name, constraint_type, delete_rule FROM user_constraints WHERE table_name = 'PROFESORES';

--16- Muestre las restricciones de "inscriptos"
SELECT constraint_name, constraint_type, delete_rule FROM user_constraints WHERE table_name = 'INSCRIPTOS';

--17- Consulte "user_cons_columns" y analice la información retornada sobre las restricciones de "inscriptos"

--18- Elimine un profesor al cual haga referencia algún registro de "deportes"

--19- Vea qué sucedió con los registros de "deportes" cuyo "documentoprofesor" existía en "profesores"
--Fue seteado a null porque la restricción "foreign key" sobre "documentoprofesor" de "deportes" fue definida "on delete set null".


--20- Elimine un socio que esté inscripto
DELETE FROM socios WHERE numero = 200;

--21- Vea qué sucedió con los registros de "inscriptos" cuyo "numerosocio" existía en "socios"
--Fue eliminado porque la restricción "foreign key" sobre "numerosocio" de "inscriptos" fue definida "on delete cascade".
SELECT * FROM inscriptos;

--22- Intente eliminar un deporte para el cual haya inscriptos
--Mensaje de error porque la restricción "foreign key sobre "codigodeporte" de "inscriptos" fue establecida "no action".
DELETE FROM deportes WHERE codigo = 3;

--23- Intente eliminar la tabla "socios"
--No puede eliminarse, mensaje de error, una "foreign key" sobre "inscriptos" hace referencia a esta tabla.
DROP TABLE socios;
--24- Elimine la tabla "inscriptos"
DROP TABLE inscriptos;

--25- Elimine la tabla "socios"

--26- Intente eliminar la tabla "profesores"
--No puede eliminarse, mensaje de error, una "foreign key" sobre "deportes" hace referencia a esta tabla.
DROP TABLE profesores;

--27- Elimine la tabla "deportes"
DROP TABLE deportes;
--28- Elimine la tabla "profesores"
