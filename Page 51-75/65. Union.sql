DROP TABLE medicos;
DROP TABLE pacientes;

CREATE TABLE medicos(
  legajo NUMBER(4),
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
  obrasocial VARCHAR2(30),
  PRIMARY KEY(documento)
);

insert into medicos values(1,'20111222','Ana Acosta','Avellaneda 111','clinica');
insert into medicos values(2,'21222333','Betina Bustos','Bulnes 222','clinica');
insert into medicos values(3,'22333444','Carlos Caseros','Colon 333','pediatria');
insert into medicos values(4,'23444555','Daniel Duarte','Duarte Quiros 444','oculista');
insert into medicos values(5,'24555666','Estela Esper','Esmeralda 555','alergia');

insert into pacientes values('24555666','Estela Esper','Esmeralda 555','IPAM');
insert into pacientes values('23444555','Daniel Duarte','Duarte Quiros 444','OSDOP');
insert into pacientes values('30111222','Fabiana Fuentes','Famatina 666','PAMI');
insert into pacientes values('31222333','Gaston Gonzalez','Guemes 777','PAMI');

/*4- La clínica necesita el nombre y domicilio de médicos y pacientes para enviarles una tarjeta de
invitación a la inauguración de un nuevo establecimiento. Emplee el operador "union" para obtener dicha información de ambas tablas (7 registros)
Note que existen dos médicos que también están presentes en la tabla "pacientes"; tales registros aparecen una sola vez en el resultado de "union".
*/
SELECT nombre, domicilio FROM medicos
UNION
SELECT nombre, domicilio FROM pacientes;

--5- Realice la misma consulta anterior pero esta vez, incluya los registros duplicados. Emplee "union all" (9 registros)
SELECT nombre, domicilio FROM medicos
UNION ALL
SELECT nombre, domicilio FROM pacientes;

--6- Realice la misma consulta anterior y esta vez ordene el resultado por nombre (9 registros)
SELECT nombre, domicilio FROM medicos
UNION ALL
SELECT nombre, domicilio FROM pacientes
ORDER BY nombre;

--7- Agregue una columna extra a la consulta con el encabezado "condicion" en la que aparezca el literal "médico" o "paciente"
--según si la persona es uno u otro (9 registros)
SELECT nombre, domicilio, 'medico' AS CONDICION FROM medicos 
UNION
SELECT nombre, domicilio, 'paciente' AS CONDICION FROM pacientes;

------------------------------------------------------------------------------------------------------------------
--1- Elimine las tablas:

drop table clientes;
drop table proveedores;
drop table empleados;

--2- Cree las tablas:

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

--3- Ingrese algunos registros:

insert into proveedores values(1,'Golosinas Dulce','Colon 123');
insert into proveedores values(2,'Carnes Unica','Caseros 222');
insert into proveedores values(3,'Lacteos Blanca','San Martin 987');
insert into proveedores values(4,'Luis Luque','San Martin 1234');
insert into clientes values(100,'Supermercado Lopez','Avellaneda 34');
insert into clientes values(101,'Almacen Anita','Colon 987');
insert into clientes values(102,'Juan Garcia','Sucre 345');
insert into clientes values(103,'Luis Luque','San Martin 1234');
insert into empleados values('23333333','Federico','Lopez','Colon 987');
insert into empleados values('28888888','Ana','Marquez','Sucre 333');
insert into empleados values('30111111','Pedro','Perez','Caseros 956');
insert into empleados values('31222333','Juan','Garcia','Sucre 345');

--4- El supermercado quiere enviar una tarjeta de salutación a todos los proveedores, clientes y empleados y necesita el nombre y domicilio
--de todos ellos. Emplee el operador "union" para obtener dicha información de las tres tablas. Ordene la información por nombre.
--La consulta a la tabla "empleados" debe incluir el nombre y el apellido (10 registros)
SELECT nombre||' '||apellido, domicilio FROM empleados
UNION 
SELECt nombre, domicilio FROM clientes
UNION
SELECT nombre, domicilio FROM proveedores;


--5- Realice la misma operación de unión anterior, pero ahora incluya los registros duplicados y ordénelos por nombre (12 registros)
--Note que "Luis Luque" es proveedor y cliente y que "Juan Garcia" es cliente y empleado; por lo tanto ambos aparecen 2 veces.
SELECT nombre||' '||apellido AS nombre, domicilio FROM empleados
UNION ALL
SELECt nombre, domicilio FROM clientes
UNION ALL
SELECT nombre, domicilio FROM proveedores
ORDER BY nombre;

--6- Realice la misma consulta anterior y agregue una columna con un literal para indicar si es un proveedor, un cliente o un empleado(12 registros)
SELECT nombre||' '||apellido AS nombre, domicilio, 'empleados' AS TIPO FROM empleados
UNION ALL
SELECt nombre, domicilio, 'clientes' AS TIPO FROM clientes
UNION ALL
SELECT nombre, domicilio, 'proveedor' AS TIPO FROM proveedores
ORDER BY nombre;

