DROP TABLE pacientes;
DROP TABLE medicos;

CREATE TABLE medicos(
  legajo NUMBER(3),
  documento VARCHAR2(8) NOT NULL,
  nombre VARCHAR2(30),
  domicilio VARCHAR2(30),
  especialidad VARCHAR2(30),
  PRIMARY KEY(legajo)
);
CREATE TABLE pacientes(
  documento VARCHAR2(8) NOT NULL,
  nombre VARCHAR2(30),
  domicilio VARCHAR2(30),
  obrasocial VARCHAR2(20),
  PRIMARY KEY(documento)
);

INSERT INTO medicos VALUES(1,'20111222','Ana Acosta','Avellaneda 111','clinica');
insert into medicos values(2,'21222333','Betina Bustos','Bulnes 222','clinica');
insert into medicos values(3,'22333444','Carlos Caseros','Colon 333','pediatria');
insert into medicos values(4,'23444555','Daniel Duarte','Duarte Quiros 444','oculista');
insert into medicos values(5,'24555666','Estela Esper','Esmeralda 555','alergia');

insert into pacientes values('24555666','Estela Esper','Esmeralda 555','IPAM');
insert into pacientes values('23444555','Daniel Duarte','Duarte Quiros 444','OSDOP');
insert into pacientes values('30111222','Fabiana Fuentes','Famatina 666','PAMI');
insert into pacientes values('30111222','Gaston Gonzalez','Guemes 777','PAMI');

/*
4- La clínica necesita el nombre y domicilio de médicos y pacientes para enviarles una tarjeta de invitación a la inauguración 
de un nuevo establecimiento.  Emplee el operador "union" para obtener dicha información de ambas tablas (7 registros)
Note que existen dos médicos que también están presentes en la tabla "pacientes"; tales registros aparecen una sola vez en el resultado
de "union".
*/
select nombre, domicilio from medicos
union
select nombre, domicilio from pacientes;

/*
5- La clínica necesita el nombre y domicilio de los pacientes que también son médicos para enviarles una tarjeta de descuento
para ciertas prácticas. Emplee el operador "intersect" para obtener dicha información de ambas tablas
*/

select nombre, domicilio from medicos
intersect
select nombre, domicilio from pacientes;

---------------------------------------MINUS------------------------------------------
--4- La clínica necesita el nombre y domicilio de médicos y pacientes para enviarles una tarjeta de invitación a la 
--inauguración de un nuevo establecimiento. Emplee el operador "union" para obtener dicha información de ambas tablas (7 registros)
SELECT nombre, domicilio FROM medicos
UNION 
SELECT nombre, domicilio FROM pacientes;

--5- Se necesitan los nombres de los médicos que también son pacientes de la clínica. Realice una intersección entre las tablas.
SELECT nombre, domicilio FROM medicos
INTERSECT
SELECT nombre, domicilio FROM pacientes;

--6- La clínica necesita los nombres de los pacientes que no son médicos. Realice una operación de resta.
SELECT nombre FROM pacientes
MINUS
SELECT nombre FROM medicos;

--7- Se necesitan los registros que no coinciden en ambas tablas. Realice la operación necesaria.

------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE proveedores;
DROP TABLE clientes;
DROP TABLE empleados;

create table proveedores(
  codigo number(3) not null,
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key(codigo)
);
 create table clientes(
  codigo number(4),
  nombre varchar2(30),
  domicilio varchar2(30),
  primary key(codigo)
);
 create table empleados(
  documento char(8) not null,
  nombre varchar2(20),
  apellido varchar2(20),
  domicilio varchar2(30),
  primary key(documento)
);

insert into proveedores values(1,'Valeria Vazquez','Colon 123');
insert into proveedores values(2,'Carnes Unica','Caseros 222');
insert into proveedores values(3,'Blanca Bustos','San Martin 987');
insert into proveedores values(4,'Luis Luque','San Martin 1234');
insert into clientes values(100,'Supermercado Lopez','Avellaneda 34');
insert into clientes values(101,'Almacen Anita','Colon 987');
insert into clientes values(102,'Juan Garcia','Sucre 345');
insert into clientes values(103,'Luis Luque','San Martin 1234');
insert into clientes values(104,'Valeria Vazquez','Colon 123');
insert into clientes values(105,'Federico Ferreyra','Colon 987');
insert into empleados values('23333333','Federico','Ferreyra','Colon 987');
insert into empleados values('28888888','Ana','Marquez','Sucre 333');
insert into empleados values('30111111','Pedro','Perez','Caseros 956');
insert into empleados values('31222333','Juan','Garcia','Sucre 345');
insert into empleados values('32333444','Luis','Luque','San Martin 1234');
insert into empleados values('33444555','Valeria','Vazquez','Colon 123');
insert into empleados values('34555666','Blanca','Bustos','San Martin 987');

/*4- El supermercado quiere enviar un bono de descuento a todos los empleados que son clientes. Realice una combinación de intersección
entre las tablas "clientes" y "empleados" (4 registros)*/

SELECT nombre FROM clientes
INTERSECT 
SELECT nombre||' '||apellido FROM empleados;

/*5- Se necesitan los nombres de aquellos proveedores que son clientes y también empleados del supermercado (presentes en las tres tablas).
Realice las operaciones necesarias (2 registros)*/

SELECT nombre FROM clientes
INTERSECT
SELECT nombre FROM proveedores
INTERSECT
SELECT nombre||' '||apellido FROM empleados;