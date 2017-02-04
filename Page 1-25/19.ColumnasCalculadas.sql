DROP TABLE articulos;
DESCRIBE articulos;
CREATE TABLE articulos(
  codigo NUMBER(4),
  nombre VARCHAR2(20),
  descripcion VARCHAR2(30),
  precio NUMBER(8,2),
  cantidad NUMBER(3) DEFAULT 0,
  PRIMARY KEY (codigo)
);

INSERT INTO articulos
  VALUES (101,'impresora','Epson Stylus C45',400.80,20);
INSERT INTO articulos
  VALUES (203,'impresora','Epson Stylus C85',500,30);
INSERT INTO articulos
  VALUES (205,'monitor','Samsung 14',800,10);
INSERT INTO articulos
  VALUES (300,'teclado','ingles Biswal',100,50);

select * from articulos;

--4- El comercio quiere aumentar los precios de todos sus artículos en un 15%. Actualice todos los precios empleando operadores aritméticos.
UPDATE articulos SET precio = precio + (precio * 0.15);

--6- Muestre todos los artículos, concatenando el nombre y la descripción de cada uno de ellos separados por coma.
SELECT nombre||','||descripcion, precio, cantidad FROM articulos;

--7- Reste a la cantidad de todas las impresoras, el valor 5, empleando el operador aritmético menos ("-")
UPDATE articulos SET cantidad = cantidad - 5 WHERE nombre = 'impresora';

SELECT * FROM articulos WHERE nombre = 'impresora';

--9- Muestre todos los artículos concatenado los campos para que aparezcan de la siguiente manera 
--"Cod. 101: impresora Epson Stylus C45 $460,92 (15)"
SELECT 'Cod. '||codigo||': '||nombre||' '||descripcion||' $'||precio||' ('||cantidad||')' FROM articulos;