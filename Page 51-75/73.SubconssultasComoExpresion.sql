DROP TABLE alumnos;

CREATE TABLE alumnos(
  documento CHAR(8),
  nombre VARCHAR2(30),
  nota NUMBER(4,2),
  PRIMARY KEY(documento),
  CONSTRAINT CK_alumnos_nota_valores
  CHECK(nota >= 0 and nota <= 10)
);

insert into alumnos values('30111111','Ana Algarbe',5.1);
insert into alumnos values('30222222','Bernardo Bustamante',3.2);
insert into alumnos values('30333333','Carolina Conte',4.5);
insert into alumnos values('30444444','Diana Dominguez',9.7);
insert into alumnos values('30555555','Fabian Fuentes',8.5);
insert into alumnos values('30666666','Gaston Gonzalez',9.70);

--4- Obtenga todos los datos de los alumnos con la nota más alta, empleando subconsulta
SELECT * FROM alumnos
WHERE nota = (SELECT max(nota) FROM alumnos);

/**5- Realice la misma consulta anterior pero intente que la consulta interna retorne, además del máximo valor de nota, 
el nombre del alumno. Mensaje de error, porque la lista de selección de una subconsulta que va luego de un operador de
comparación puede incluir sólo un campo o expresión (excepto si se emplea "exists" o "in").*/
SELECT * FROM alumnos
WHERE nota = (SELECT max(nota), nombre FROM alumnos);

--6- Muestre los alumnos que tienen una nota menor al promedio, su nota, y la diferencia con el promedio.
SELECT nombre, nota, nota - (SELECT AVG(nota) FROM alumnos) AS DIFERENCIA 
FROM alumnos
WHERE nota < (SELECT AVG(nota) FROM alumnos);

--7- Cambie la nota del alumno que tiene la menor nota por 4.
UPDATE alumnos SET nota = 4
WHERE nota = (SELECT MIN(nota) FROM alumnos);

--8- Elimine los alumnos cuya nota es menor al promedio.
DELETE FROM alumnos
WHERE nota < (SELECT AVG(nota) FROM alumnos);
