DROP TABLE visitas;
SELECT * FROM visitas;
 create table visitas (
  nombre varchar2(30) default 'Anonimo',
  mail varchar2(50),
  pais varchar2(20),
  fecha date
);

DELETE FROM visitas;

DESCRIBE visitas;
insert into visitas values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina', to_date('10/10/2006 10:10', 'dd/mm/yyyy hh:mi'));
insert into visitas values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile', to_date('10/10/2006 12:30', 'dd/mm/yyyy hh:mi'));
insert into visitas values ('Juancito','JuanJosePerez@hotmail.com','Argentina',to_date('11/10/2006 12:45', 'dd/mm/yyyy hh:mi'));
insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',to_date('12/10/2006 08:15', 'dd/mm/yyyy hh:mi'));
insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico', to_date('12/09/2006 11:45', 'dd/mm/yyyy hh:mi'));
insert into visitas values ('Juancito','JuanJosePerez@hotmail.com','Argentina',to_date('12/09/2006 12:20'));
insert into visitas values ('Juancito','JuanJosePerez@hotmail.com','Argentina',to_date('15/09/2006 06:25'));

--4- Ordene los registros por fecha, en orden descendente.
SELECT * FROM visitas ORDER BY fecha DESC;

--5- Muestre el nombre del usuario, pais y el mes, ordenado por pais (ascendente) y el mes (descendente)
SELECT nombre, pais, extract(MONTH FROM fecha) AS MES FROM visitas
  ORDER BY pais ASC, MES DESC;

--6- Muestre los mail, país, ordenado por país, de todos los que visitaron la página en octubre (4 registros)
SELECT mail, pais FROM visitas 
  WHERE extract(MONTH FROM fecha) = '10'
  ORDER BY pais;
