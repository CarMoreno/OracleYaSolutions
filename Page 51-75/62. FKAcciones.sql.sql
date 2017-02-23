DROP TABLE provincias;
drop table clientes;

insert into provincias values(1,'Cordoba');
insert into provincias values(2,'Santa Fe');
insert into provincias values(3,'Misiones');
insert into provincias values(4,'Rio Negro');

insert into clientes values(100,'Perez Juan','San Martin 123','Carlos Paz',1);
insert into clientes values(101,'Moreno Marcos','Colon 234','Rosario',2);
insert into clientes values(102,'Acosta Ana','Avellaneda 333','Posadas',3);

--4- Establezca una restricción "foreign key" especificando la acción "set null" para eliminaciones.
ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_codigoprovincia
FOREIGN KEY(codigoprovincia)
REFERENCES provincias(codigo)
ON DELETE SET NULL;

--5- Elimine el registro con código 3, de "provincias" y consulte "clientes" para ver qué cambios ha realizado Oracle en los
--registros coincidentes Todos los registros con "codigoprovincia" 3 han sido seteados a null.
DELETE FROM provincias WHERE codigo = 3;
SELECT * FROM clientes;

--6- Consulte el diccionario "user_constraints" para ver qué acción se ha establecido para las eliminaciones
SELECT constraint_name, constraint_type, delete_rule 
FROM user_constraints 
WHERE table_name = 'CLIENTES';

--7- Intente modificar el registro con código 2, de "provincias"
UPDATE provincias SET codigo = 10 WHERE codigo = 2;

--8- Elimine la restricción "foreign key" establecida sobre "clientes"
ALTER TABLE clientes
DROP CONSTRAINT FK_clientes_codigoprovincia;

--9- Establezca una restricción "foreign key" sobre "codigoprovincia" de "clientes" especificando la acción "cascade" para eliminaciones
ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_codigoprovincia
FOREIGN KEY(codigoprovincia)
REFERENCES provincias(codigo)
ON DELETE CASCADE;

--10- Consulte el diccionario "user_constraints" para ver qué acción se ha establecido para las eliminaciones sobre las restricciones 
--"foreign key" de la tabla "clientes"
SELECT constraint_name, constraint_type, delete_rule
FROM user_constraints
WHERE table_name = 'CLIENTES';

--11- Elimine el registro con código 2, de "provincias"
DELETE FROM provincias WHERE codigo = 2;

--12- Verifique que el cambio se realizó en cascada, es decir, que se eliminó en la tabla "provincias" y todos los clientes de la provincia eliminada
SELECT * FROM provincias;
SELECT * FROM clientes;

--13- Elimine la restricción "foreign key"
ALTER TABLE clientes
DROP CONSTRAINT FK_clientes_codigoprovincia;

--14- Establezca una restricción "foreign key" sin especificar acción para eliminaciones
ALTER TABLE clientes
ADD CONSTRAINT FK_clientes_codigoprovincia
FOREIGN KEY(codigoprovincia)
REFERENCES provincias(codigo);

--15- Intente eliminar un registro de la tabla "provincias" cuyo código exista en "clientes"
DELETE FROM provincias WHERE codigo = 1;

--16- Consulte el diccionario "user_constraints" para ver qué acción se ha establecido para las eliminaciones sobre la restricción "FK_CLIENTES_CODIGOPROVINCIA"
SELECT delete_rule FROM user_constraints
WHERE constraint_name = 'FK_CLIENTES_CODIGOPROVINCIA';

--17- Intente elimimar la tabla "provincias"
DROP TABLE provincias;

--18- Elimine la restricción "foreign key"
ALTER TABLE clientes
DROP CONSTRAINT FK_clientes_codigoprovincia;
--19- Elimine la tabla "provincias"