drop table visitantes;
drop table ciudades;
create table visitantes(
  nombre varchar2(30),
  edad number(2),
  sexo char(1) default 'f',
  domicilio varchar2(30),
  codigociudad number(2),
  mail varchar(30),
  montocompra decimal (6,2)
);

create table ciudades(
  codigo number(2),
  nombre varchar(20)
);
 
insert into ciudades values(1,'Cordoba');
insert into ciudades values(2,'Carlos Paz');
insert into ciudades values(3,'La Falda');
insert into ciudades values(4,'Cruz del Eje');

insert into visitantes values ('Susana Molina', 35,'f','Colon 123', 1, null,59.80);
insert into visitantes values ('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50);
insert into visitantes values ('Mariana Juarez', 45,'f','San Martin 111',2,null,23.90);
insert into visitantes values ('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0);
insert into visitantes values ('Alejandra Garcia',28,'f',null,2,null,280.50);
insert into visitantes values ('Gaston Perez',29,'m',null,5,'gastonperez1@gmail.com',95.40);
insert into visitantes values ('Mariana Juarez',33,'f',null,2,null,90);

--4- Cuente la cantidad de visitas por ciudad mostrando el nombre de la ciudad (3 filas)
SELECT c.nombre AS CIUDAD, count(*) AS "CANTIDAD VISITAS"
FROM ciudades c JOIN visitantes v
ON(c.codigo = v.codigociudad)
GROUP BY c.nombre;

--5- Muestre el promedio de gastos de las visitas agrupados por ciudad y sexo (4 filas)
SELECT c.nombre AS CIUDAD, v.sexo, AVG(v.montocompra) AS PROMEDIO
FROM ciudades c JOIN visitantes v
ON(c.codigo = v.codigociudad)
GROUP BY c.nombre, v.sexo;

--6- Muestre la cantidad de visitantes con mail, agrupados por ciudad (3 filas)
SELECT c.nombre, count(v.mail) AS "CON MAIL"
FROM ciudades c JOIN visitantes v
ON(c.codigo = v.codigociudad)
GROUP BY c.nombre;

--7- Obtenga el monto de compra más alto de cada ciudad (3 filas)
SELECT c.nombre, MAX(v.montocompra) AS "MONTO MAS ALTO"
FROM ciudades c JOIN visitantes v
ON(c.codigo = v.codigociudad)
GROUP BY c.nombre;

--8- Realice la misma consulta anterior pero con "left join" (4 filas)
SELECT c.nombre, MAX(v.montocompra) AS "MONTO MAS ALTO"
FROM visitantes v LEFT JOIN ciudades c
ON(c.codigo = v.codigociudad)
GROUP BY c.nombre;
 
