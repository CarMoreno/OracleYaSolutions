DROP TABLE empleados;
create table empleados(
  legajo number(5),
  documento char(8) not null,
  nombre varchar2(30) not null,
  domicilio varchar2(30),
  sueldo number(6,2),
  hijos number(2),
  primary key (legajo)
 );
 
insert into empleados
  values(1,'22333444','Ana Acosta','Avellaneda 213',870.79,2);
insert into empleados
  values(20,'27888999','Betina Bustos','Bulnes 345',950.85,1);
insert into empleados
  values(31,'30111222','Carlos Caseres','Caseros 985',1190,0);
insert into empleados
  values(39,'33444555','Daniel Duarte','Dominicana 345',1250.56,3);

--Vamos a mostrar los sueldos de los empleados redondeando el valor hacia abajo y luego hacia arriba (empleamos "floor" y "ceil"):
SELECT floor(sueldo) AS "SUELDO FLOOR", ceil(sueldo) AS "SUELDO CEIL" FROM empleados;

--Mostramos el nombre de cada empleado, su respectivo sueldo, y el sueldo redondeando el valor a entero ("round") y truncado a entero ("trunc"):
SELECT nombre, sueldo, round(sueldo) AS "REDONDEADO A ENTERO", trunc(sueldo) AS "TRUNCADO A ENTERO" FROM empleados;

--Mostramos el resto de la división "1234 / 5" ("mod"):
SELECT mod(1234,5) FROM dual;

--Calculamos la raíz cuadrada de 81:
SELECT sqrt(81) FROM dual;