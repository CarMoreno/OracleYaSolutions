DROP TABLE empleados;

CREATE TABLE empleados(
  documento CHAR(8),
  nombre VARCHAR2(20),
  cantidadhijos NUMBER(2),
  seccion VARCHAR2(20),
  sueldo NUMBER(6,2) DEFAULT -1 
);

--3- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el sueldo.
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_sueldopositivo
CHECK(sueldo >= 0);

--4- Intente ingresar un registro con la palabra clave "default" en el campo "sueldo" (mensaje de error)
INSERT INTO empleados VALUES('12345678', 'Carlos', 0, 'Tecnología', DEFAULT);

--5- Ingrese algunos registros válidos:

 insert into empleados values ('22222222','Alberto Lopez',1,'Sistemas',1000);
 insert into empleados values ('33333333','Beatriz Garcia',2,'Administracion',3000);
 insert into empleados values (null,'Carlos Castro',10,'Contaduria',3000);

--6- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el valor 5000.
--La sentencia no se ejecuta porque hay un sueldo que no cumple la restricción.

ALTER TABLE empleados
ADD CONSTRAINT PK_sueldo_menor5000
CHECK(sueldo <= 5000);

--7- Elimine el registro infractor y vuelva a crear la restricción
DELETE FROM empleados WHERE sueldo = 6000;

--8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", "Administracion" y "Contaduría".
ALTER TABLE empleados
ADD CONSTRAINT CK_valores_seccion
CHECK (seccion IN ('Sistemas', 'Administracion', 'Contaduria'));

--9- Ingrese un registro con valor "null" en el campo "seccion".
INSERT INTO empleados VALUES('87654321', 'Carlos M.', 0, NULL, 2000);

--10- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 15.
ALTER TABLE empleados
ADD CONSTRAINT CK_cantidadhijos
CHECK(cantidadhijos BETWEEN 0 AND 15);

--11- Vea todas las restricciones de la tabla (4 filas)
 select *from user_constraints where table_name='EMPLEADOS';
 
--13- Intente modificar un registro colocando en "cantidadhijos" el valor "21".
UPDATE empleados SET cantidadhijos = 21 WHERE cantidadhijos = 0;

--14- Intente modificar el valor de algún registro en el campo "seccion" cambiándolo por uno que no esté incluido en la lista de permitidos.
UPDATE empleados SET seccion = 'Recursos Humanos' WHERE seccion = 'Sistemas';

--15- Intente agregar una restricción al campo sección para aceptar solamente valores que comiencen con la letra "B".
ALTER TABLE empleados
ADD CONSTRAINT CK_empleados_seccion_letraB
CHECK(seccion LIKE 'B%');

--17- Intente agregar una restricción "primary key" para el campo "documento".
--No lo permite porque existe un registro con valor nulo en tal campo.
ALTER TABLE empleados
ADD CONSTRAINT PK_empleados_documento
PRIMARY KEY(documento);

--18- Elimine el registro que infringe la restricción y establezca la restricción del punto 17.
DELETE FROM empleados WHERE documento IS NULL;

--
SELECT constraint_name, constraint_type, search_condition FROM user_constraints WHERE table_name = 'EMPLEADOS';

--Eliminar restricciones
ALTER TABLE empleados
DROP CONSTRAINT CK_VALORES_SECCION;

ALTER TABLE empleados
DROP CONSTRAINT CK_cantidadhijos;

