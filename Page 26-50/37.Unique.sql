DROP TABLE remis;
CREATE TABLE remis(
  numero NUMBER(5),
  patente CHAR(6),
  marca VARCHAR2(15),
  modelo CHAR(4)
);

--3- Ingrese algunos registros, 2 de ellos con patente repetida y alguno con patente nula.
INSERT INTO remis VALUES(1, 'ABC123', 'Renault', '1994');
INSERT INTO remis VALUES(2, 'ABC123', 'Mazda', '1993');
INSERT INTO remis VALUES(3, NULL, 'Toyota', '2010');
INSERT INTO remis VALUES(4, 'ABD123', 'Mercedez', '2014');

--4- Agregue una restricción "primary key" para el campo "numero".
ALTER TABLE remis
ADD CONSTRAINT PK_remis_numero
PRIMARY KEY(numero);

--5- Intente agregar una restricción "unique" para asegurarse que la patente del remis no tomará valores repetidos.
ALTER TABLE remis
ADD CONSTRAINT UQ_remis_patente
UNIQUE(patente);

--6- Elimine el registro con patente duplicada y establezca la restricción.
DELETE FROM remis WHERE patente = 'ABC123';

SELECT * FROM remis;