DROP TABLE agenda;
SELECT * FROM libros;

-- 4- Modifique el registro cuyo nombre sea "Juan" por "Juan Jose" (1 registro actualizado)
UPDATE agenda SET nombre='Juan Jose'
  WHERE nombre='Juan';

--5- Actualice los registros cuyo número telefónico sea igual a "4545454" por "4445566" (2 registros)
UPDATE agenda SET telefono = '4445566'
  WHERE telefono = '4545454';
------------------------------------------------------------------------------------------------

DROP TABLE libros;
CREATE TABLE libros(
  titulo VARCHAR2(30),
  autor VARCHAR2(20),
  editorial VARCHAR2(15),
  precio NUMBER(5,2)
);

INSERT INTO libros(titulo, autor, editorial, precio)
  VALUES('El aleph','Borges','Emece',25.00);
INSERT INTO libros(titulo, autor, editorial, precio)
  VALUES('Martin Fierro','Jose Hernandez','Planeta',35.50);
INSERT INTO libros(titulo, autor, editorial, precio)
  VALUES('Aprenda PHP','Mario Molina','Emece',45.50);
INSERT INTO libros(titulo, autor, editorial, precio)
  VALUES('Cervantes y el quijote','Borges','Emece',25);
INSERT INTO libros(titulo, autor, editorial, precio)
  VALUES('Matematica estas ahi','Paenza','Siglo XXI',15);  

--5- Modifique los registros cuyo autor sea igual a "Paenza", por "Adrian Paenza" (1 registro)
UPDATE libros SET autor = 'Adrian Paenza'
  WHERE autor = 'Paenza';

--7- Actualice el precio del libro de "Mario Molina" a 27 pesos (1 registro)
UPDATE libros SET precio = 27
  WHERE autor = 'Mario Molina';

--8- Actualice el valor del campo "editorial" por "Emece S.A.", para todos los registros cuya editorial sea igual a "Emece" (3 registros)
UPDATE libros SET editorial = 'Emec S.A.'
  WHERE editorial = 'Emece';