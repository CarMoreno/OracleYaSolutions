DROP TABLE cuentas;

CREATE TABLE cuentas(
  numeroCuenta NUMBER(4) NOT NULL,
  documento NUMBER(8) NOT NULL,
  nombre VARCHAR2(30),
  saldo NUMBER(8,2),
  PRIMARY KEY (numeroCuenta)
);

DESCRIBE cuentas;

INSERT INTO cuentas(numeroCuenta, documento, nombre, saldo)
  VALUES('1234','25666777','Pedro Perez',500000.60);
INSERT INTO cuentas(numeroCuenta,documento,nombre,saldo)
  VALUES('2234','27888999','Juan Lopez',-250000);
INSERT INTO cuentas(numeroCuenta,documento,nombre,saldo)
  VALUES('3344','27888999','Juan Lopez',4000.50);
INSERT INTO cuentas(numeroCuenta,documento,nombre,saldo)
  VALUES('3346','32111222','Susana Molina',1000);  

--4- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)
SELECT * FROM cuentas WHERE saldo > 4000;

--5- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 registros)
SELECT numeroCuenta, saldo FROM cuentas WHERE nombre = 'Juan Lopez';

--6- Muestre las cuentas con saldo negativo (1 registro)
SELECT * FROM cuentas WHERE saldo < 0;

--7- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros)
SELECT * FROM cuentas WHERE numeroCuenta >= 3000;

--------------------------------------------------------------------------------------------------------------------
DROP TABLE empleados;
DESCRIBE empleados;

CREATE TABLE empleados(
  nombre varchar2(30),
  documento char(8),
  sexo char(1),
  domicilio varchar2(30),
  sueldobasico number(7,2),--máximo estimado 99999.99
  cantidadhijos number(2)--no superará los 99
);

insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Juan Perez','22333444','m','Sarmiento 123',500,2);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Ana Acosta','24555666','f','Colon 134',850,0);
insert into empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
  values ('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4);
  
--4- Ingrese un valor de "sueldobasico" con más decimales que los definidos (redondea los decimales al valor más cercano 800.89)
INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos)
  VALUES('Carlos Moreno','27888999','m','ABCS 479', 1234.345,0);

SELECT * FROM empleados;  
--5- Intente ingresar un sueldo que supere los 7 dígitos (no lo permite)
INSERT INTO empleados(nombre, documento, sexo, domicilio, sueldobasico, cantidadhijos)
  VALUES('Carlos Moreno','27888999','m','ABCS 479', 123454.345,0);

--6- Muestre todos los empleados cuyo sueldo no supere los 900 pesos
SELECT * FROM empleados WHERE sueldobasico <= 900;

--7- Seleccione los nombres de los empleados que tengan hijos (3 registros)
SELECT nombre FROM empleados WHERE cantidadhijos > 0;