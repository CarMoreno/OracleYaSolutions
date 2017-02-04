DROP TABLE autos;
CREATE TABLE autos(
  patente CHAR(6),
  marca VARCHAR2(20),
  modelo CHAR(4),
  precio NUMBER(8,2),
  PRIMARY KEY(patente)
);
INSERT INTO autos(patente, marca, modelo, precio)
  VALUES('ABC123','Fiat 128','1970',15000);
INSERT INTO autos (patente,marca,modelo,precio)
  VALUES('BCD456','Renault 11','1990',40000);
INSERT INTO autos (patente,marca,modelo,precio)
  VALUES('CDE789','Peugeot 505','1990',80000);
INSERT INTO autos (patente,marca,modelo,precio)
  VALUES('DEF012','Renault Megane','1998',95000);  

--Ingrese un registro omitiendo las comillas en el valor de "modelo" Oracle convierte el valor a cadena.  
INSERT INTO autos (patente,marca,modelo,precio)
  VALUES('HIJ002','Mazda 3',2017,32000);

SELECT * FROM autos;

--6- Seleccione todos los autos modelo "1990"
SELECT * FROM autos WHERE modelo = '1990';

--7- Intente ingresar un registro con un valor de patente de 7 caracteres
INSERT INTO autos(patente,marca,modelo,precio)
  VALUES('ÑLOP098', 'Chevrolet', '2004', 1000000);

------------------------------------------------------------------------------------------------------------------
DROP TABLE clientes;
DESCRIBE clientes;

CREATE TABLE clientes(
  documento CHAR(8) NOT NULL,
  apellido VARCHAR2(20),
  nombre VARCHAR2(20),
  domicilio VARCHAR2(30),
  telefono VARCHAR2(11)
);

INSERT INTO clientes(documento, apellido, nombre, domicilio, telefono)
  VALUES('22333444','Perez','Juan','Sarmiento 980','4223344');
INSERT INTO clientes (documento,apellido,nombre,domicilio,telefono)
  VALUES('23444555','Perez','Ana','Colon 234',null);
INSERT INTO clientes (documento,apellido,nombre,domicilio,telefono)
  VALUES('30444555','Garcia','Luciana','Caseros 634',null);

--5- Intente ingresar un registro con más caracteres que los permitidos para el campo "telefono"
INSERT INTO clientes (documento,apellido,nombre,domicilio,telefono)
  VALUES('30444225','Garcia','Luciana','Caseros 634','123456789101');

--6- Intente ingresar un registro con más caracteres que los permitidos para el campo "documento"
INSERT INTO clientes (documento,apellido,nombre,domicilio,telefono)
  VALUES('123456789','Garcia','Luciana','Caseros 634','123456789101');

--7- Intente ingresar un registro omitiendo las comillas en el campo "apellido"
INSERT INTO clientes (documento,apellido,nombre,domicilio,telefono)
  VALUES('123456789',Garcia,'Luciana','Caseros 634','123456789101');

--8- Seleccione todos los clientes de apellido "Perez" (2 registros)
SELECT * FROM clientes WHERE apellido = 'Perez';