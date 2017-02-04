DESCRIBE cuentas;
DROP TABLE cuentas;
SELECT * FROM cuentas;

create table cuentas(
  numero number(10) not null,
  documento char(8) not null,
  nombre varchar2(30),
  saldo number(9,2)
 );
 
 --3- Ingrese un registro con valores para todos sus campos, omitiendo la lista de campos.
 INSERT INTO cuentas VALUES(123456789, '87654321', 'Carlos Moreno', 345.44);
 
 --4- Ingrese un registro omitiendo algún campo que admita valores nulos.
 INSERT INTO cuentas(numero, documento, saldo)
  VALUES(12345, '24681234', 2000.3)

--6- Intente ingresar un registro listando 3 campos y colocando 4 valores. Un mensaje indica que hay demasiados valores.
INSERT INTO cuentas(numero, documento, nombre)
  VALUES(12345, '24681234', 'Mr. Z', 2000.3);
  
--7- Intente ingresar un registro listando 3 campos y colocando 2 valores. Un mensaje indica que no hay suficientes valores.
INSERT INTO cuentas(numero, documento, nombre)
  VALUES(12345, '24681234');

--8- Intente ingresar un registro sin valor para un campo definido "not null".
INSERT INTO cuentas (nombre,saldo)
  VALUES ('Mr. Y',2330);
  
SELECT * FROM cuentas;  