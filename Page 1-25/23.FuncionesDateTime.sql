DESCRIBE libros;
DROP TABLE libros;
DESCRIBE libros;

CREATE TABLE libros(
  titulo VARCHAR2(40) NOT NULL,
  autor VARCHAR(20) DEFAULT 'Desconocido',
  editorial VARCHAR(20),
  edicion DATE,
  precio NUMBER(6,2)
);

INSERT INTO libros VALUES('El aleph','Borges','Emece','10/10/1980',25.33);
INSERT INTO libros VALUES('Java en 10 minutos','Mario Molina','Siglo XXI','05/05/2000',50.65);
INSERT INTO libros VALUES('Alicia en el pais de las maravillas','Lewis Carroll','Emece','08/09/2000',19.95);
INSERT INTO libros VALUES('Aprenda PHP','Mario Molina','Siglo XXI','02/04/2000',45);
SELECT * FROM libros;

--Mostramos el t�tulo del libro y el a�o de edici�n:
SELECT titulo, extract(YEAR FROM edicion) AS A�O FROM libros;

--Mostramos el t�tulo del libro y el mes de edici�n:
SELECT titulo, extract(MONTH FROM edicion) AS MES FROM libros;

--Mostramos el t�tulo del libro y los a�os que tienen de editados:
SELECT titulo, extract(YEAR FROM SYSDATE) - extract(YEAR FROM edicion) AS A�O_EDITADOS FROM libros;

--Mostramos los t�tulos de los libros que se editaron en el a�o 2000:
SELECT titulo FROM libros WHERE extract(YEAR FROM edicion) = 2000;

--Calcule 3 meses luego de la fecha actual empleando ""add_months":
SELECT add_months(SYSDATE, 3) FROM dual;

--Muestre la fecha del primer martes desde la fecha actual:
SELECT next_day(SYSDATE, 'MARTES') AS "FECHA PRIMER MARTES" FROM dual;

--Muestre la fecha que ser� 15 d�as despu�s de "24/08/2007" empleando el operador "+":
SELECT to_date('24/08/2007')+15 AS "DENTRO DE 15 D�AS" FROM dual;

--Muestre la fecha que 20 d�as antes del "12/08/2007" empleando el operador "-":
SELECT to_date('12/08/2007') - 20 AS "20 D�AS ANTES" FROM dual;