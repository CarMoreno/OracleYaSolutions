DROP TABLE clientes;
CREATE TABLE clientes(
  nombre VARCHAR2(30),
  sexo CHAR(1),
  edad NUMBER(2),
  domicilio VARCHAR2(30)
);

INSERT INTO clientes VALUES('Maria Lopez','f',45,'Colon 123');
insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
insert into clientes values('Federico Pereyra','m',38,'Colon 234');
insert into clientes values('Juan Garcia','m',50,'Peru 333');

--3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo masculino. Use un "cross join" (12 filas)

SELECT c1.nombre,c1.edad,c2.nombre,c2.edad
  FROM clientes c1 CROSS JOIN clientes c2
  WHERE c1.sexo='f' AND c2.sexo='m';

--4- Obtenga la misma salida anterior pero realizando un "join"
SELECT c1.nombre, c1.edad, c2.nombre, c2.edad
  FROM clientes c1 JOIN clientes c2
  ON(c1.sexo <> c2.sexo)
  WHERE c1.sexo = 'f' AND c2.sexo = 'm';

--5- Realice la misma autocombinación que el punto 3 pero agregue la condición que las parejas no tengan una
--diferencia superior a 5 años (5 filas)

SELECT c1.nombre,c1.edad,c2.nombre,c2.edad
  FROM clientes c1 CROSS JOIN clientes c2
  WHERE (c1.sexo='f' AND c2.sexo='m') AND (ABS(c1.edad - c2.edad) <= 5 );

----------------------------------------------------------------------------------------------------------------------------------------

DROP TABLE equipos;
CREATE TABLE equipos(
  nombre VARCHAR2(30),
  barrio VARCHAR2(20),
  domicilio VARCHAR2(30),
  entrenador VARCHAR2(20)
);

insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
Insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

--4- Cada equipo jugará con todos los demás 2 veces, una vez en cada sede. Realice un "cross join" para combinar los equipos 
--teniendo en cuenta que un equipo no juega consigo mismo (12 filas)

SELECT e1.nombre, e2.nombre
FROM equipos e1 CROSS JOIN equipos e2
WHERE e1.nombre <> e2.nombre;

--5- Obtenga el mismo resultado empleando un "join".
SELECT e1.nombre, e2.nombre
FROM equipos e1 JOIN equipos e2
ON(e1.nombre <> e2.nombre);

--6- Realice un "cross join" para combinar los equipos para que cada equipo juegue con cada uno de los otros una sola vez (6 filas)
SELECT e1.nombre, e2.nombre
FROM equipos e1 CROSS JOIN equipos e2
WHERE e1.nombre > e2.nombre;