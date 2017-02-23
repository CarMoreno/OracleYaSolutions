--57 foreign key
DROP TABLE clientes;
DROP TABLE provincias;

CREATE TABLE clientes(
  codigo NUMBER(5),
  nombre VARCHAR2(30),
  domicilio VARCHAR2(30),
  ciudad VARCHAR2(30),
  codigoprovincia NUMBER(2)
);

CREATE TABLE provincias(
  codigo NUMBER(2),
  nombre VARCHAR2(20)
);

--2- Intente agregar una restricción "foreign key" a la tabla "clientes" que haga referencia al campo "codigo" de "provincias"
ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_codigoprovincia
FOREIGN KEY(codigoprovincia)
REFERENCES provincias(codigo);

--3- Establezca una restricción "unique" al campo "codigo" de "provincias"
ALTER TABLE provincias
ADD CONSTRAINT PK_provincias_codigo
PRIMARY KEY(codigo);

insert into provincias values(1,'Cordoba');
insert into provincias values(2,'Santa Fe');
insert into provincias values(3,'Misiones');
insert into provincias values(4,'Rio Negro');

insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
insert into clientes values(102,'Acosta Ana','Avellaneda 333','Posadas',3);
insert into clientes values(103,'Luisa Lopez','Juarez 555','La Plata',6);

--6- Elimine el registro de "clientes" que no cumple con la restricción y establezca la restricción nuevamente.
DELETE FROM clientes WHERE codigoprovincia = 6;

--7- Intente agregar un cliente con un código de provincia inexistente en "provincias"
insert into clientes values(103,'Luisa Lopez','Juarez 555','La Plata',6);

--8- Intente eliminar el registro con código 3, de "provincias".
DELETE FROM provincias WHERE codigo = 3;

--9- Elimine el registro con código "4" de "provincias"
DELETE FROM provincias WHERE codigo = 4;

--10- Intente modificar el registro con código 1, de "provincias"
UPDATE provincias SET codigo = 10 WHERE codigo = 1;

--11- Vea las restricciones de "clientes" consultando "user_constraints"
SELECT constraint_name, constraint_type FROM user_constraints
WHERE table_name = 'PROVINCIAS';

--13- Intente eliminar la tabla "provincias" (mensaje de error)
DELETE provincias;

--14- Elimine la restricción "foreign key" de "clientes" y luego elimine la tabla "provincias"
ALTER TABLE clientes
DROP CONSTRAINT FK_clientes_codigoprovincia;
DELETE provincias;