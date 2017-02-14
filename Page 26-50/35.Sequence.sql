DROP TABLE empleados;
CREATE TABLE empleados(
  legajo NUMBER(3),
  documento CHAR(8) NOT NULL,
  nombre VARCHAR2(30) NOT NULL,
  PRIMARY KEY (legajo)
);

/*3- Elimine la secuencia "sec_legajoempleados" y luego créela estableciendo el valor mínimo (1), máximo (999), valor inicial (100),
valor de incremento (2) y no circular. Finalmente inicialice la secuencia.*/

DROP SEQUENCE sec_legajoempleados;
CREATE SEQUENCE sec_legajoempleados
  START WITH 100
  MINVALUE 1
  MAXVALUE 999
  INCREMENT BY 2
  NOCYCLE;

sec_legajoempleados.NEXTVAL;
SELECT * FROM empleados;

INSERT INTO empleados VALUES(sec_legajoempleados.CURRVAL, '22333444','Ana Acosta');
insert into empleados values (sec_legajoempleados.NEXTVAL,'23444555','Betina Bustamante');
insert into empleados values (sec_legajoempleados.NEXTVAL,'24555666','Carlos Caseros');
insert into empleados values (sec_legajoempleados.NEXTVAL,'25666777','Diana Dominguez');
insert into empleados values (sec_legajoempleados.NEXTVAL,'26777888','Estela Esper');

--6- Vea el valor actual de la secuencia empleando la tabla "dual". Retorna 108.
SELECT sec_legajoempleados.CURRVAL FROM dual;

--7- Recupere el valor siguiente de la secuencia empleando la tabla "dual" Retorna 110.
SELECT sec_legajoempleados.NEXTVAL FROM dual;

--8- Ingrese un nuevo empleado (recuerde que la secuencia ya tiene el próximo valor, emplee "currval" para almacenar el valor de legajo)
INSERT INTO empleados VALUES(sec_legajoempleados.CURRVAL, '27888900', 'Carlos Moreno');

--10- Incremente el valor de la secuencia empleando la tabla "dual" (retorna 112)
SELECT sec_legajoempleados.NEXTVAL FROM dual;

--11- Ingrese un empleado con valor de legajo "112".
INSERT INTO empleados VALUES(112, '30334412', 'Juan Perez');

--12- Intente ingresar un registro empleando "currval":

 insert into empleados
  values (sec_legajoempleados.currval,'29000111','Hector Huerta');
