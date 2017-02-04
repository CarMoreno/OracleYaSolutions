DROP TABLE libros;

create table libros(
  codigo number(5),
  titulo varchar2(40) not null,
  autor varchar2(20) default 'Desconocido',
  editorial varchar2(20),
  precio number(6,2),
  cantidad number(3)
 );
 
 insert into libros
   values(1,'El aleph','Borges','Emece',25,100);
 insert into libros
  values(2,'Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros
  values(3,'Alicia en el pais de las maravillas','Lewis Carroll','Emece',15.50,200);
 insert into libros
  values(4,'El pais de las hadas',default,'Emece',25.50,150);
  
DESCRIBE libros;
SELECT * FROM libros;

--Mostramos s�lo los 12 primeros caracteres de los t�tulos de los libros y sus autores, empleando la funci�n "substr"
SELECT substr(titulo,1,12) as titulo FROM libros;

--Mostramos s�lo los 20 primeros caracteres de los t�tulos de los libros y rellenando los espacios restantes con "*", 
--empleando la funci�n "rpad":

SELECT rpad(titulo,20, '*') as titulo FROM libros;

--Mostramos los t�tulos de los libros empleando la funci�n "initcap":
SELECT initcap(titulo) as titulo FROM libros;

--Mostramos los t�tulos de los libros y sus autores en may�sculas:
SELECT titulo, upper(autor) AS autor FROM libros;

--Concatenamos t�tulo y autor empleando "concat":
SELECT concat(titulo, autor) AS "Titulo-Autor" FROM libros;

--Mostramos el t�tulo y el precio de todos los libros concatenando el signo "$" a los precio
SELECT titulo, concat('$', precio) AS precio FROM libros;

--Recuperamos el t�tulo y editorial de "libros" reemplazando "Emece" por "Sudamericana":
SELECT titulo, replace(editorial, 'Emece', 'Sudamericana') AS editorial FROM libros;

--Recuperamos el autor de todos los libros reemplazando las letras "abc" por "ABC" respectivamente (empleando "translate"):
SELECT translate(autor, 'abc', 'ABC') AS autor FROM libros;

--Mostramos la posici�n de la primera ocurrencia de la cadena "pais" en los t�tulos de los libros:
SELECT instr(titulo,'pais') AS titulo FROM libros;