DROP TABLE medicamentos;
DESCRIBE medicamentos;
SELECT * FROM medicamentos;

 -- 6- Ingrese un registro con valor "0" para el precio y cadena vacía para el laboratorio.
INSERT INTO medicamentos(codigo, nombre, laboratorio, precio,cantidad)
  VALUES(4, 'Dolex', '', 0, 7);
  
--7- Intente ingresar un registro con cadena vacía para el nombre (mensaje de error)
INSERT INTO medicamentos(codigo, nombre, laboratorio, precio,cantidad)
  VALUES(5, '', '', 0, 7);

--8- Intente ingresar un registro con valor nulo para un campo que no lo admite (aparece un mensaje de error)  
INSERT INTO medicamentos(codigo, nombre, laboratorio, precio,cantidad)
  VALUES(NULL, '', '', 0, 7);

--9- Recupere los registros que contengan valor "null" en el campo "laboratorio" (3 registros)
SELECT * FROM medicamentos WHERE laboratorio IS NULL;

--10- Recupere los registros que contengan valor "null" en el campo "precio", luego los que tengan el valor 0 en el mismo campo.
--Note que el resultado es distinto (2 y 1 registros respectivamente)
SELECT * FROM medicamentos WHERE precio IS NULL;
SELECT * FROM medicamentos WHERE precio = 0;

--11- Recupere los registros cuyo laboratorio no contenga valor nulo (1 registro)
SELECT * FROM medicamentos WHERE laboratorio IS NOT NULL;

--12- Recupere los registros cuyo precio sea distinto de 0, luego los que sean distintos de "null" (1 y 2 resgistros respectivamente)
--Note que la salida de la primera sentencia no muestra los registros con valor 0 y tampoco los que tienen valor nulo; el resultado de
--la segunda sentencia muestra los registros con valor para el campo precio (incluso el valor 0).
SELECT * FROM medicamentos WHERE precio <> 0;
SELECT * FROM medicamentos WHERE precio IS NOT NULL;

--13- Ingrese un registro con una cadena de 1 espacio para el laboratorio.
INSERT INTO medicamentos(codigo, nombre, laboratorio, precio, cantidad)
  VALUES(6, 'Advil', ' ', 300, 6);

--14- Recupere los registros cuyo laboratorio sea "null" y luego los que contengan 1 espacio (3 y 1 registros respectivamente)
SELECT * FROM medicamentos WHERE laboratorio IS NULL;
SELECT * FROM medicamentos WHERE laboratorio = ' ';

--15- Recupere los registros cuyo laboratorio sea distinto de ' '(cadena de 1 espacio), luego los que sean distintos de "null"
--(1 y 2 registros respectivamente)
SELECT * FROM medicamentos WHERE laboratorio <> ' ';
SELECT * FROM medicamentos WHERE laboratorio IS NOT NULL;

--------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE peliculas;
SELECT * FROM peliculas;
DESCRIBE peliculas;
--6- Intente ingresar un registro con valor nulo para campos que no lo admiten (aparece un mensaje de error)
INSERT INTO peliculas(codigo, titulo, actor, duracion)
  VALUES(null, 'El Zorro', 'Antonio Banderas', 160);
  
--7- Muestre los registros con valor nulo en el campo "actor" (2 registros)
SELECT * FROM peliculas WHERE actor IS NULL;

--8- Actualice los registros que tengan valor de duración desconocido (nulo) por "120" (1 registro actualizado)
UPDATE peliculas SET duracion = 120 WHERE duracion IS NULL;

--9- Coloque 'Desconocido' en el campo "actor" en los registros que tengan valor nulo en dicho campo (2 registros)
UPDATE peliculas SET actor = 'Desconocido' WHERE actor IS NULL;

--11- Muestre todos los registros con valor nulo en el campo "actor" (ninguno)
SELECT * FROM peliculas WHERE actor IS NULL;

--12- Actualice la película en cuyo campo "duracion" hay 0 por "null" (1 registro)
UPDATE peliculas SET duracion = NULL 
  WHERE duracion = 0;

--14- Borre todos los registros en los cuales haya un valor nulo en "duracion" (1 registro)
DELETE FROM peliculas WHERE duracion IS NULL;