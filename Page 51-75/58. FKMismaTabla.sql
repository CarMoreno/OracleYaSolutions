DROP TABLE clientes;
create table clientes(
  codigo number(5),
  nombre varchar2(30),
  domicilio varchar2(30),
  ciudad varchar2(20),
  referenciadopor number(5),
  primary key(codigo)
);


insert into clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
insert into clientes values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
insert into clientes values(110,'Fabian Torres','San Martin 987','Cordoba',50);
insert into clientes values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
insert into clientes values(140,'Ana Herrero','Colon 890','Carlos Paz',9);

ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_referenciadopor
FOREIGN KEY(referenciadopor)
REFERENCES clientes(codigo);

--4- Cambie el valor inv�lido de "referenciadopor" del registro que viola la restricci�n por uno v�lido:
UPDATE clientes SET referenciadopor = 90 WHERE referenciadopor = 9;

--6- Vea la informaci�n referente a las restricciones de la tabla "clientes"
SELECT constraint_name, constraint_type FROM user_constraints
WHERE table_name = 'CLIENTES';

--7- Intente agregar un registro que infrinja la restricci�n.
INSERT INTO clientes VALUES (40, 'Carlos Moreno', 'Carrera 1', 'Tulu� Valle', 2);

--8- Intente modificar el c�digo de un cliente que est� referenciado en "referenciadopor"
UPDATE clientes set codigo = 9  WHERE codigo = 90;

--9- Intente eliminar un cliente que sea referenciado por otro en "referenciadopor"
DELETE FROM clientes WHERE codigo = 50;

--10- Cambie el valor de c�digo de un cliente que no referenci� a nadie.
UPDATE clientes SET codigo = 200 WHERE codigo = 110;

--11- Elimine un cliente que no haya referenciado a otros.
DELETE FROM clientes WHERE codigo = 140;
