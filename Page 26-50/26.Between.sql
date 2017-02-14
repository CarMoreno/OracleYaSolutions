DROP TABLE visitas;
DESCRIBE visitas;

INSERT INTO visitas VALUES ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','10/10/2006');
INSERT INTO visitas VALUES ('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','10/10/2006');
INSERT INTO visitas VALUES ('Juancito','JuanJosePerez@hotmail.com','Argentina','11/10/2006');
INSERT INTO visitas VALUES ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','12/10/2006');
INSERT INTO visitas VALUES ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','12/09/2006');
INSERT INTO visitas VALUES ('Juancito','JuanJosePerez@gmail.com','Argentina','12/09/2006');
INSERT INTO visitas VALUES ('Juancito','JuanJosePerez@hotmail.com','Argentina','15/09/2006');
INSERT INTO visitas VALUES ('Federico1','federicogarcia@xaxamail.com','Argentina',null);

--3- Seleccione los usuarios que visitaron la página entre el '12/09/2006' y '11/10/2006' (6 registros)
SELECT * FROM visitas WHERE fecha BETWEEN '12/09/2006' AND '11/10/2006';
SELECT * FROM visitas;

-------------------------------------------------------------------------------------------------------------
DROP TABLE medicamentos; 
DELETE medicamentos;
CREATE TABLE medicamentos(
  codigo NUMBER(6) not null,
  nombre VARCHAR2(20),
  laboratorio VARCHAR2(20),
  precio NUMBER(6,2),
  cantidad NUMBER(4),
  fechavencimiento DATE NOT NULL,
  PRIMARY KEY(codigo)
 );
INSERT INTO medicamentos VALUES(102,'Sertal','Roche',5.2,10,'01/02/2010');
INSERT INTO medicamentos VALUES(120,'Buscapina','Roche',4.10,200,'01/12/2007');
INSERT INTO medicamentos VALUES(230,'Amoxidal 500','Bayer',15.60,100,'28/12/2007');
INSERT INTO medicamentos VALUES(250,'Paracetamol 500','Bago',1.90,20,'01/02/2008');
INSERT INTO medicamentos VALUES(350,'Bayaspirina','Bayer',2.10,150,'01/12/2009'); 
INSERT INTO medicamentos VALUES(456,'Amoxidal jarabe','Bayer',5.10,250,'01/10/2010'); 

--3- Recupere los nombres y precios de los medicamentos cuyo precio esté entre 5 y 15 (2 registros)
SELECT * FROM medicamentos WHERE precio BETWEEN 5 AND 15;

--4- Seleccione los registros cuya cantidad se encuentre entre 100 y 200 (3 registros)
SELECT * FROM medicamentos WHERE cantidad BETWEEN 100 AND 200;

--5- Recupere los remedios cuyo vencimiento se encuentre entre la fecha actual y '01/01/2008' inclusive (2 registros)
SELECT * FROM medicamentos WHERE fechavencimiento BETWEEN sysdate AND '01/01/2008';

--6- Elimine los remedios cuyo vencimiento se encuentre entre el año 2007 y 2008 inclusive (3 registros)
DELETE FROM medicamentos 
  WHERE extract(year FROM fechavencimiento) BETWEEN 2007 AND 2008;