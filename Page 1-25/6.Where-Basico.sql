/*Problema 1: Agenda*/
DROP TABLE agenda;
CREATE TABLE agenda(
  apellido VARCHAR2(30),
  nombre VARCHAR2(30),
  domicilio VARCHAR2(30),
  telefono VARCHAR2(11)
);
DESCRIBE agenda;

INSERT INTO agenda(apellido, nombre, domicilio, telefono)
VALUES('Acosta', 'Ana', 'Colon 123', '4234567');
INSERT INTO agenda(apellido, nombre, domicilio, telefono)
VALUES('Bustamante', 'Betina', 'Avellaneda 135', '4458787');
INSERT INTO agenda(apellido, nombre, domicilio, telefono)
VALUES('Lopez', 'Hector', 'Salta 545', '4887788');
INSERT INTO agenda(apellido, nombre, domicilio, telefono)
VALUES('Lopez', 'Luis', 'Urquiza 333', '4545454');
INSERT INTO agenda(apellido, nombre, domicilio, telefono)
VALUES('Lopez', 'Marisa', 'Urquiza 333', '4545454');

SELECT * FROM agenda;

SELECT * FROM agenda
WHERE nombre='Marisa';

SELECT nombre, domicilio FROM agenda
WHERE apellido='Lopez';

SELECT nombre, domicilio FROM agenda
WHERE apellido='lopez';

SELECT nombre FROM agenda
WHERE telefono='4545454';

/*Problema 2: Articulos*/
DROP TABLE articulos;

CREATE TABLE articulos(
  codigo NUMBER(5),
  nombre VARCHAR2(20),
  descripcion VARCHAR2(30),
  precio NUMBER(7,2)
);

DESCRIBE articulos;

INSERT INTO articulos(codigo, nombre, descripcion, precio)
VALUES(1,'impresora','Epson Stylus C45',400.80);
INSERT INTO articulos(codigo, nombre, descripcion, precio)
VALUES(2,'impresora','Epson Stylus C85',500);
INSERT INTO articulos(codigo, nombre, descripcion, precio)
VALUES(3,'monitor','Samsung 14',800);
INSERT INTO articulos(codigo, nombre, descripcion, precio)
VALUES(4,'teclado','ingles Biswal',100);
INSERT INTO articulos(codigo, nombre, descripcion, precio)
VALUES(5,'teclado','español Biswal',90);

SELECT * FROM articulos
WHERE nombre='impresora';

SELECT codigo, descripcion, precio FROM articulos
WHERE nombre='teclado';