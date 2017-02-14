DROP TABLE medicamentos;
SELECT * FROM medicamentos;
--4- Recupere los nombres y precios de los medicamentos cuyo laboratorio sea "Bayer" o "Bago" empleando el operador "in" (4 registros)
SELECT nombre, precio FROM medicamentos
  WHERE laboratorio IN ('Bayer', 'Bago');

/*5- Recupere los nombres y precios de los medicamentos cuyo laboratorio NO sea "Bayer" o "Bago" empleando el operador "in" (1 registro)
Note que los valores nulos no se incluyen.*/
SELECT nombre, precio FROM medicamentos
  WHERE laboratorio NOT IN ('Bayer', 'Bago');
  
/*6- Seleccione los remedios cuya cantidad se encuentre entre 1 y 5 empleando el operador "between" y luego el operador "in" (2 registros)
Note que es más conveniente emplear, en este caso, el operador "between", simplifica la consulta.*/
SELECT * FROM medicamentos
  WHERE cantidad BETWEEN 1 AND 5;
  
SELECT * FROM medicamentos
  WHERE cantidad IN (1,2,3,4,5);

/*7- Recupere los registros cuyas fechas de vencimiento se encuentra entre enero de 2005 y enero del 2007 (emplee el operador apropiado)
(2 registros)*/
SELECT * FROM medicamentos 
  WHERE fechavencimiento BETWEEN '01/01/2005' AND '01/01/2007';
  
--8- Recupere los registros cuyo año de vencimiento sea 2005 o 2006 (emplee el operador apropiado) (2 registros)
SELECT * FROM medicamentos
  WHERE extract(year FROM fechavencimiento) IN (2005, 2006);