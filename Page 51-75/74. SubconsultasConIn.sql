DROP TABLE clientes;
DROP TABLE ciudades;

CREATE TABLE ciudades(
  codigo NUMBER(2),
  nombre VARCHAR2(20),
  PRIMARY KEY(codigo)
);

CREATE TABLE clientes(
  codigo NUMBER(4),
  nombre VARCHAR2(30),
  domicilio VARCHAR2(30),
  codigociudad NUMBER(2) NOT NULL,
  PRIMARY KEY(codigo),
  CONSTRAINT FK_clientes_codigociudad
  FOREIGN KEY(codigociudad)
  REFERENCES ciudades(codigo)
  ON DELETE CASCADE
);


insert into ciudades values(1,'Cordoba');
insert into ciudades values(2,'Cruz del Eje');
insert into ciudades values(3,'Carlos Paz');
insert into ciudades values(4,'La Falda');
insert into ciudades values(5,'Villa Maria');

insert into clientes values (100,'Lopez Marcos','Colon 111',1);
insert into clientes values (101,'Lopez Hector','San Martin 222',1);
insert into clientes values (105,'Perez Ana','San Martin 333',2);
insert into clientes values (106,'Garcia Juan','Rivadavia 444',3);
insert into clientes values (107,'Perez Luis','Sarmiento 555',3);
insert into clientes values (110,'Gomez Ines','San Martin 666',4);
insert into clientes values (111,'Torres Fabiola','Alem 777',5);
insert into clientes values (112,'Garcia Luis','Sucre 888',5);

--4- Necesitamos conocer los nombres de las ciudades de aquellos clientes cuyo domicilio es en calle "San Martin", empleando subconsulta.
SELECT c.nombre from ciudades c
  WHERE c.codigo IN 
    (SELECT cli.codigociudad FROM clientes cli
      WHERE cli.domicilio LIKE 'San Martin%');

--5- Obtenga la misma salida anterior pero empleando join.
SELECT DISTINCT c.nombre 
  FROM ciudades c JOIN clientes cli
  ON(c.codigo = cli.codigociudad)
  WHERE cli.domicilio LIKE 'San Martin%';

--6- Obtenga los nombre de las ciudades de los clientes cuyo apellido no comienza con una letra específica (letra "G"), 
--empleando subconsulta.

SELECT c.nombre FROM ciudades c
  WHERE c.codigo NOT IN 
    (SELECT cli.codigociudad FROM clientes cli
      WHERE cli.nombre LIKE 'G%');

--7- Pruebe la subconsulta del punto 6 separada de la consulta exterior para verificar que retorna una lista de valores de un solo campo.
SELECT cli.codigociudad FROM clientes cli
WHERE cli.nombre LIKE 'G%';