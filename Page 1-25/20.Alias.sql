DROP TABLE articulos;
DESCRIBE articulos;

insert into articulos
  values (101,'impresora','Epson Stylus C45',400.80,20);
insert into articulos
  values (203,'impresora','Epson Stylus C85',500,30);
insert into articulos
  values (205,'monitor','Samsung 14',800,10);
insert into articulos
  values (300,'teclado','ingles Biswal',100,50);

/*4- El comercio hace un descuento del 15% en ventas mayoristas. Necesitamos recuperar el c�digo, nombre, decripci�n de
todos los art�culos con una columna extra que muestre el precio de cada art�culo para la venta mayorista con el siguiente
encabezado "precio mayorista"*/

SELECT codigo, nombre, descripcion, precio - (precio * 0.15) AS "precio mayorista"  
  FROM articulos;

/*5- Muestre los precios de todos los art�culos, concatenando el nombre y la descripci�n con el encabezado "art�culo"
(sin emplear "as" ni comillas)*/
SELECT nombre||' '||descripcion articulo, precio FROM articulos;

/*6- Muestre todos los campos de los art�culos y un campo extra, con el encabezado "monto total" en la que calcule el monto
total en dinero de cada art�culo (precio por cantidad) */
SELECT codigo, nombre, descripcion, precio, cantidad, precio*cantidad AS "Monto Total"
  FROM articulos;
  
/*7- Muestre la descripci�n de todas las impresoras junto al precio con un 20% de recargo con un encabezado que lo especifique.*/
SELECT descripcion, precio + (precio*0.20) AS Recargo FROM articulos
  WHERE nombre = 'impresora';