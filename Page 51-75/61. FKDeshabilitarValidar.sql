DROP TABLE clientes;
DROP TABLE provincias;

create table clientes (
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  codigoprovincia number(2),
  primary key(codigo)
);

create table provincias(
  codigo number(2),
  nombre varchar2(20),
  primary key (codigo)
);

insert into provincias values(1,'Cordoba');
insert into provincias values(2,'Santa Fe');
insert into provincias values(3,'Misiones');
insert into provincias values(4,'Rio Negro');

insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
insert into clientes values(102,'Garcia Juan','Sucre 345','Cordoba',1);
insert into clientes values(103,'Lopez Susana','Caseros 998','Posadas',3);
insert into clientes values(104,'Marcelo Moreno','Peru 876','Viedma',4);
insert into clientes values(105,'Lopez Sergio','Avellaneda 333','La Plata',5);

--4- Intente agregar una restricci�n "foreign key" para que los c�digos de provincia de "clientes" 
--existan en "provincias" sin especificar la opci�n de comprobaci�n de datos
ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_codigoprovincia
FOREIGN KEY(codigoprovincia)
REFERENCES provincias(codigo);

--5- Agregue la restricci�n anterior pero deshabilitando la comprobaci�n de datos existentes
ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_codigoprovincia
FOREIGN KEY(codigoprovincia)
REFERENCES provincIas(codigo)
NOVALIDATE;

--6- Vea las restricciones de "clientes"
SELECT constraint_name, constraint_type FROM user_constraints
WHERE table_name = 'CLIENTES';

SELECT * FROM clientes;
--7- Deshabilite la restricci�n "foreign key" de "clientes"
ALTER TABLE clientes
DISABLE CONSTRAINT FK_clientes_codigoprovincia;

--9- Agregue un registro que no cumpla la restricci�n "foreign key", Se permite porque la restricci�n est� deshabilitada.
INSERT INTO clientes VALUES(200, 'Carlos Moreno', 'Carrera 1', 'Tulu� Valle', 6);

--10- Modifique el c�digo de provincia del cliente c�digo 104 por 9 Oracle lo permite porque la restricci�n est� deshabilitada.
UPDATE clientes SET codigoprovincia = 9 WHERE codigo = 104;

--11-Habilite la restricci�n "foreign key"
ALTER TABLE clientes
ENABLE CONSTRAINT FK_clientes_codigoprovincia;