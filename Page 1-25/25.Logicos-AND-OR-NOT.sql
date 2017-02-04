DROP TABLE medicamentos;
DESCRIBE medicamentos;

INSERT INTO medicamentos VALUES(100,'Sertal','Roche',5.2,100);
INSERT INTO medicamentos VALUES(102,'Buscapina','Roche',4.10,200);
INSERT INTO medicamentos VALUES(205,'Amoxidal 500','Bayer',15.60,100);
INSERT INTO medicamentos VALUES(230,'Paracetamol 500','Bago',1.90,200);
INSERT INTO medicamentos VALUES(345,'Bayaspirina','Bayer',2.10,150); 
INSERT INTO medicamentos VALUES(347,'Amoxidal jarabe','Bayer',5.10,250); 

/*4- Recupere los códigos y nombres de los medicamentos cuyo laboratorio sea "Roche' y cuyo precio sea menor a 5 
(1 registro cumple con ambas condiciones)*/

SELECT codigo, nombre FROM medicamentos
  WHERE laboratorio = 'Roche' AND precio < 5;

/*5- Recupere los medicamentos cuyo laboratorio sea "Roche" o cuyo precio sea menor a 5 (4 registros)*/
SELECT codigo, nombre FROM medicamentos
  WHERE laboratorio = 'Roche' OR precio < 5;

/*6- Muestre todos los medicamentos cuyo laboratorio NO sea "Bayer" y cuya cantidad sea=100. Luego muestre todos los 
medicamentos cuyo laboratorio sea "Bayer" y cuya cantidad NO sea=100*/

SELECT * FROM medicamentos
  WHERE NOT laboratorio = 'Bayer' AND cantidad = 100;

SELECT * FROM medicamentos
  WHERE (laboratorio = 'Bayer') AND (NOT cantidad = 100);

/*7- Recupere los nombres de los medicamentos cuyo precio esté entre 2 y 5 inclusive (2 registros)*/
SELECT nombre FROM medicamentos
  WHERE precio >= 2 AND precio <= 5;

/*8- Elimine todos los registros cuyo laboratorio sea igual a "Bayer" y su precio sea mayor a 10 (1 registro eliminado)*/
DELETE FROM medicamentos WHERE laboratorio = 'Bayer' AND precio > 10;

/*9- Cambie la cantidad por 200, de todos los medicamentos de "Roche" cuyo precio sea mayor a 5 (1 registro afectado)*/
UPDATE medicamentos SET cantidad = 200 WHERE laboratorio = 'Roche' AND precio > 5;

--10- Muestre todos los registros para verificar el cambio.
SELECT * FROM medicamentos;

/*11- Borre los medicamentos cuyo laboratorio sea "Bayer" o cuyo precio sea menor a 3 (3 registros borrados)*/
DELETE FROM medicamentos WHERE laboratorio = 'Bayer' OR precio < 3;

-----------------------------------------------------------------------------------------------------------------------------
DROP TABLE peliculas;

CREATE TABLE peliculas(
  codigo NUMBER(4),
  titulo VARCHAR2(40) NOT NULL,
  actor VARCHAR2(20),
  duracion NUMBER(3),
  PRIMARY KEY (codigo)
 );
 
INSERT INTO peliculas VALUES(1020,'Mision imposible','Tom Cruise',120);
INSERT INTO peliculas VALUES(1021,'Harry Potter y la piedra filosofal','Daniel R.',180);
INSERT INTO peliculas VALUES(1022,'Harry Potter y la camara secreta','Daniel R.',190);
INSERT INTO peliculas VALUES(1200,'Mision imposible 2','Tom Cruise',120);
INSERT INTO peliculas VALUES(1234,'Mujer bonita','Richard Gere',120);
INSERT INTO peliculas VALUES(900,'Tootsie','D. Hoffman',90);
INSERT INTO peliculas VALUES(1300,'Un oso rojo','Julio Chavez',100);
INSERT INTO peliculas VALUES(1301,'Elsa y Fred','China Zorrilla',110);

--4- Recupere los registros cuyo actor sea "Tom Cruise" o "Richard Gere" (3 registros)
SELECT * FROM peliculas WHERE actor = 'Tom Cruise' OR actor = 'Richard Gere';

--5- Recupere los registros cuyo actor sea "Tom Cruise" y duración menor a 100 (ninguno cumple ambas condiciones)
SELECT * FROM peliculas WHERE actor = 'Tom Cruise' AND duracion < 100;

--6- Recupere los nombres de las películas cuya duración se encuentre entre 100 y 120 minutos(5 registros)
SELECT titulo FROM peliculas WHERE duracion >= 100 AND duracion <= 120;

--7- Cambie la duración a 200, de las películas cuyo actor sea "Daniel R." y cuya duración sea 180 (1 registro afectado)
UPDATE peliculas SET duracion = 200 WHERE actor = 'Daniel R.' AND duracion = 180;

--8- Recupere todos los registros para verificar la actualización anterior
SELECT * FROM peliculas;

--9- Borre todas las películas donde el actor NO sea "Tom Cruise" y cuya duración sea mayor o igual a 100 (2 registros eliminados)
DELETE FROM peliculas WHERE (NOT actor = 'Tom Cruise') AND (duracion >= 100);