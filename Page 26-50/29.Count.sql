DROP TABLE medicamentos;

CREATE TABLE medicamentos(
  codigo NUMBER(5),
  nombre VARCHAR2(20),
  laboratorio VARCHAR2(20),
  precio NUMBER(6,2),
  cantidad NUMBER(3),
  fechavencimiento DATE NOT NULL,
  numerolote number(6) DEFAULT NULL,
  PRIMARY KEY(codigo)
);

describe MEDICAMENTOS;

INSERT INTO medicamentos VALUES(120,'Sertal','Roche',5.2,1,'01/02/2005',123456);
INSERT INTO medicamentos VALUES(220,'Buscapina','Roche',4.10,3,'01/02/2006',null);
INSERT INTO medicamentos VALUES(228,'Amoxidal 500','Bayer',15.60,100,'01/05/2007',null);
INSERT INTO medicamentos VALUES(324,'Paracetamol 500','Bago',1.90,20,'01/02/2008',null);
INSERT INTO medicamentos VALUES(587,'Bayaspirina',null,2.10,null,'01/12/2009',null); 
INSERT INTO medicamentos VALUES(789,'Amoxidal jarabe','Bayer',null,null,'15/12/2009',null);

--4- Muestre la cantidad de registros empleando la función "count(*)" (6 registros)
SELECT count(*) AS "NUMERO DE REGISTROS" FROM medicamentos;

--5- Cuente la cantidad de medicamentos que tienen laboratorio conocido (5 registros)
SELECT count(laboratorio) AS "NUMERO MEDICAMENTOS" FROM medicamentos;

--6- Cuente la cantidad de medicamentos que tienen precio y cantidad, con alias (5 y 4 respectivamente)
SELECT count(precio) AS "# CON PRECIO", count(cantidad) AS "# CON CANTIDAD" FROM medicamentos;

--7- Cuente la cantidad de remedios con precio conocido, cuyo laboratorio comience con "B" (2 registros)
SELECT count(precio) AS "# MEDICAMENTOS" FROM medicamentos
  WHERE laboratorio LIKE 'B%';

--8- Cuente la cantidad de medicamentos con número de lote distinto de "null" (1 registro)
SELECT count(numerolote) FROM medicamentos;
/*OTRA FORMA..
SELECT COUNT(*) FROM medicamentos
  WHERE numerolote IS NOT NULL;*/
  
--9- Cuente la cantidad de medicamentos con fecha de vencimiento conocida (6 registros)
SELECT count(fechavencimiento) FROM medicamentos;