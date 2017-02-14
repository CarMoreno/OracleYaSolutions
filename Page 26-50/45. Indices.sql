DESCRIBE alumnos;
DROP TABLE alumnos;
select * from alumnos;
CREATE TABLE alumnos(
  legajo CHAR(5) NOT NULL,
  documento CHAR(8) NOT NULL,
  nombre VARCHAR2(30),
  curso CHAR(1),
  materia VARCHAR2(30),
  notafinal NUMBER(4,2)
);

insert into alumnos values ('A123','22222222','Perez Patricia','5','Matematica',9);
 insert into alumnos values ('A234','23333333','Lopez Ana','5','Matematica',9);
 insert into alumnos values ('A345','24444444','Garcia Carlos','6','Matematica',8.5);
 insert into alumnos values ('A348','25555555','Perez Patricia','6','Lengua',7.85);
 insert into alumnos values ('A457','26666666','Perez Fabian','6','Lengua',3.2);
 
--3- Intente crear un índice único para el campo "nombre". No lo permite porque hay valores duplicados. 
CREATE UNIQUE INDEX I_alumnos_nombre ON alumnos(nombre);

DELETE FROM alumnos WHERE nombre = 'Perez Patricia';

--5- Cree un índice único, para el campo "lejago".
CREATE UNIQUE INDEX I_alumnos_legajo ON alumnos(legajo);

--6- Establezca una restricción "primary key" sobre el campo "legajo".
ALTER TABLE alumnos
ADD CONSTRAINT PK_alumnos_legajo
PRIMARY KEY(legajo);

--7- Verifique que Oracle no creó un índice al agregar la restricción, utilizó el índice "I_alumnos_legajo" existente.
SELECT INDEX_NAME FROM user_indexes WHERE table_name = 'ALUMNOS';

--8- Agregue una restricción única sobre el campo "documento".
ALTER TABLE alumnos
ADD CONSTRAINT UQ_alumnos_documento
UNIQUE(documento);

--9- Verifique que Oracle creó un índice al agregar la restricción y le dio el nombre de la restricción.
SELECT INDEX_NAME FROM user_indexes WHERE table_name = 'ALUMNOS';

--10- Intente crear un índice único para la tabla "alumnos" sobre el campo "notafinal"
CREATE UNIQUE INDEX I_alumnos_notafinal ON alumnos(notafinal);

--11- Indexe la tabla "alumnos" por el campo "notafinal" (índice no único)--ERROR, Ya se creo un indice sobre ese campo y es unico
CREATE INDEX I_alumnos_notafinal_2 ON alumnos(notafinal);

--12- Indexe la tabla "alumnos" por los campos "curso" y "materia" (índice no único)
CREATE INDEX I_alumnos_curso_materia ON alumnos(curso, materia);

--13- Intente crear un índice único sobre "materia" (error pues hay datos duplicados)
CREATE UNIQUE INDEX I_alumnos_materia ON alumnos(materia);

--14- Vea los indices de "alumnos"
 select index_name, index_type, uniqueness
  from user_indexes
  where table_name='ALUMNOS';