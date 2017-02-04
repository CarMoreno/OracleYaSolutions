DROP TABLE agenda;
CREATE TABLE agenda(
  Apellido VARCHAR2(30),
  Nombre VARCHAR2(20),
  Domicilio VARCHAR2(30),
  Telefono VARCHAR2(11)
);
INSERT INTO agenda(Apellido, Nombre, Domicilio, Telefono)
  VALUES('Acosta','Alberto','Colon 123','4234567');
INSERT INTO agenda(Apellido, Nombre, Domicilio, Telefono)
  VALUES('Juarez','Juan','Avellaneda 135','4458787');
INSERT INTO agenda(Apellido, Nombre, Domicilio, Telefono)
  VALUES('Lopez','Maria','Urquiza 333','4545454');
INSERT INTO agenda(Apellido, Nombre, Domicilio, Telefono)
  VALUES('Lopez','Jose','Urquiza 333','4545454');  
INSERT INTO agenda(Apellido, Nombre, Domicilio, Telefono)
  VALUES('Suarez','Susana','Gral. Paz 1234','4123456');

--4- Elimine el registro cuyo nombre sea "Juan" (1 registro)
DELETE FROM agenda
  WHERE nombre = 'Juan';
  
--5- Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros)
DELETE FROM agenda
  WHERE telefono = '4545454';  

--6- Elimine todos los registros (2 registros)
DELETE FROM agenda;

-------------------------------------------------------------------------------------------
--5- Elimine los artículos cuyo precio sea mayor o igual a 500 (2 registros)
DELETE FROM articulos
  WHERE precio >= 500;
SELECT * from articulos;

--7- Elimine todas las impresoras (1 registro)
DELETE FROM articulos
  WHERE nombre = 'impresora';

--8- Elimine todos los artículos cuyo código sea diferente a 4 (1 registro)
DELETE FROM articulos
  WHERE codigo <> 4;