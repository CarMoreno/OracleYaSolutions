DROP TABLE visitantes;
CREATE TABLE visitantes(
  nombre VARCHAR2(30),
  edad NUMBER(2),
  sexo CHAR(1) DEFAULT 'F',
  domicilio VARCHAR2(30),
  ciudad VARCHAR2(20) DEFAULT 'Cordoba',
  telefono VARCHAR2(11),
  mail VARCHAR2(30) DEFAULT 'No tiene',
  montocompra number(6,2)
);

--4- Analice la información que retorna la siguiente consulta:

select column_name,nullable,data_default
  from user_tab_columns where TABLE_NAME = 'VISITANTES';
  

INSERT INTO visitantes(domicilio,ciudad,telefono,mail,montocompra)
  VALUES('Colon 123','Cordoba','4334455','juanlopez@hotmail.com',59.80);
INSERT INTO visitantes (nombre,edad,sexo,telefono,mail,montocompra)
  VALUES ('Marcos Torres',29,'m','4112233','marcostorres@hotmail.com',60);
INSERT INTO visitantes (nombre,edad,sexo,domicilio,ciudad)
  VALUES ('Susana Molina',43,'f','Bulnes 345','Carlos Paz');  

--6- Recupere todos los registros.
SELECT * FROM visitantes;

--7- Use la palabra "default" para ingresar valores en un "insert"
INSERT INTO visitantes VALUES('Carlos Moreno', 21, 'm', 'Calle 123', DEFAULT, '3144566554', DEFAULT, 200);

SELECT * FROM visitantes WHERE nombre = 'Carlos Moreno';