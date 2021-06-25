/********************************************
			LABORATORIO 1
********************************************/

-- 1- Eliminar si existe la base de datos Laboratorio.
drop database if exists Laboratorio;

-- 2- Crear la base de datos Laboratorio.
create database Laboratorio;
use Laboratorio;

-- 3- Crear la tabla Facturas dentro de la base de datos con el siguiente detalle:
drop table if exists Facturas;
create table Facturas (
	Letra 		char,
	Numero 		integer,
    ClienteID  	integer,
    ArticuloID 	integer,
	Fecha 		date,
	Monto 		double,
	primary key (Letra, Numero)
);

-- 4- Crear la tabla ArtÃ­culos dentro de la base de datos con el siguiente detalle:
drop table if exists Articulos;
create table Articulos (
	ArticuloID	integer,
	Nombre 		varchar(50),
	Precio 		double,
	Stock 		integer,
	primary key (ArticuloID)
);
-- 5- Crear la tabla Clientes dentro de la base de datos con el siguiente detalle.
drop table if exists Clientes;
create table Clientes (
	ClienteID      	integer,
	Nombre    		varchar(50),
	Apellido   		varchar(50),
	Cuit      	 	char(16),
	Direccion  		varchar(50),
    Comentarios 	varchar(50),
    primary key (ClienteID)
);

-- 6- Cargar 5 registros en la tabla Facturas , ArtÃ­culos y Clientes.	 

insert into facturas (Letra	, Numero, ClienteID	, ArticuloID, Fecha			, Monto	) 
values				 ('A'	, 1		, 1			, 1			, '2011/10/18'	, 500	),
					 ('A'	, 2		, 2			, 2			, '2011/10/18'	, 2500	),
					 ('A'	, 3		, 3			, 3			, '2011/10/18'	, 320	),
					 ('A'	, 4		, 4			, 4			, '2011/10/18'	, 120	),
					 ('A'	, 5		, 5			, 5			, curdate()   	, 300	);

select * from facturas;

insert into articulos	(ArticuloID	, Nombre			, Precio, Stock	) 
values					(1			, 'Destornillador'	, 25	, 50	),
						(2			, 'Pinza'         	, 35	, 22	),
						(3			, 'Martillo'      	, 15	, 28	),
						(4			, 'Maza'          	, 35	, 18	),
						(5			, 'Tornillo'        , 35	, 20	),
						(6			, 'Balde'         	, 55	, 13	);

select * from articulos;

insert into Clientes	( ClienteID	, Nombre	, Apellido, Cuit			, Direccion		, Comentarios	) 
values					( 1			, 'Agustin' , 'Diaz'  , '20-35987452-0'	, 'Lima 458'    , NULL			),
						( 2			, 'Angela'  , 'Lopez' , '20-37987854-0'	, 'Peru 32'     , NULL			),
						( 3			, 'Cristian', 'Fraga' , '20-36887498-0'	, 'Chile 6985'  , NULL			),
						( 4			, 'Sol'     , 'Cabral', '20-25982495-0'	, 'Lavalle 1201', NULL			),
						( 5			, 'Ezequiel', 'Perez' , '20-21987111-0'	, 'Uruguay 25'  , NULL			);

select * from Clientes;

/********************************************
			LABORATORIO 1 - BONUS
********************************************/

-- 1- Elimine la tabla "agenda", si existe:
drop table if exists agenda;

-- 2- Cree una tabla llamada agenda. Debe tener la siguiente estructura:
drop table if exists agenda;
create table agenda (
	Contacto	integer,
	Nombre 		varchar(20),
	Domicilio 	varchar(30),
	Telefono 	varchar(9),
	primary key (Contacto)
);

-- 3- Visualice las tablas existentes en la base de datos para verificar la creaciรณn de agenda.
show tables;

-- 4- Visualice la estructura de campos de la tabla "agenda". 
describe agenda;

-- 5- Ingrese los registros en la tabla Agenda:
insert into agenda 	(Contacto	, Nombre			, Domicilio			, Telefono	) 
values 				(1			, 'Alberto Mores'	, 'Colon 123'		, '4234567'	),
					(2			, 'Juan Torres'		, 'Avellaneda 135'	, '4458787'	),
					(3			, 'Carla Paez'		, 'Lima 2335'		, '6658747'	);

-- 6- Seleccione y muestre todos los registros de la tabla:
select * from agenda;

/********************************************
			LABORATORIO 2
********************************************/

	# 1 - Basándose en la tabla artículos obtener los siguientes listados.
-- a- artículos con precio mayor a 100
select * from articulos where precio > 100;

-- b- artículos con precio entre 20 y 40 (usar < y >)
select * from articulos where precio >= 20 and precio <= 40;

-- c- artículos con precio entre 40 y 60 (usar BETWEEN)
select * from articulos where precio between 40 and 60;

-- d- artículos con precio = 20 y stock mayor a 30
select * from articulos where precio = 20 and stock>30;

-- e- artículos con precio (12,20,30) no usar IN
select * from articulos where precio in (12,20,30);

-- f- artículos con precio (12,20,30) usar el IN
select * from articulos where (precio=12 or precio=20 or precio=30);

-- g- artículos que su precio no sea (12,20,30)
select * from articulos where precio not in (12,20,30);

-- 2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben quedar ordenados por nombre.
select * from articulos order by precio, nombre desc;

-- 3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual deberá tener el monto con el iva del producto.
select *, (precio * 1.21) as IVA from articulos;

/* 4- Listar todos los artículos incluyendo una columna denominada “cantidad de cuotas” y otra “valor de cuota”, la cantidad es fija y es 3, el
	  valor de cuota corresponde a 1/3 del monto con un 5% de interés*/
select *, 3 as 'cuotaFija', (precio / 3) * 1.05 as 'valorCuota' from articulos; 

/********************************************
			LABORATORIO 2 - BONUS
********************************************/

-- 01- Seleccionar todos los registros de la tabla Articulos.
select * from articulos;

-- 02- Mostrar los artículos con precio menor o igual a 50.
select * from articulos where precio <= 50;

-- 03- Seleccionar los artículos cuyo precio sea mayor o igual a 500.
select * from articulos where precio >= 500;

-- 04- Seleccionar los artículos cuyo stock sea menor a 30.
select * from articulos where stock < 30;

-- 05- Seleccionar el nombre y descripción de los artículos que no cuesten $100:
select nombre from articulos where precio <> 100;

-- 06- Obtener un listado de los productos que contengan una letra “a”.
select * from articulos where nombre like "%a%";

-- 07- Obtener un listado de artículos cuyo precio se encuentre entre 100 y 200 pesos.
select * from articulos where precio > 100 and precio < 200;
select * from articulos where precio between 20 and 40;

-- 08 Obtener un listado de artículos con precio con IVA menor a 40.
select *, (precio * 1.21) as IVA from articulos where (precio * 1.21) < 40;

-- 09 Obtener un listado de artículos cuyo stock sea menor a 10 y precio con iva mayor a 200.
select *, (precio * 1.21) as IVA from articulos where stock < 10 and (precio * 1.21) > 200;

-- 10 Obtener un listado de artículos que pagaderos en 3 cuotas sin interes, tenga un valor de cuota menor a 50$
select *, 3 as 'Cuota', (precio/3) as 'valorCuota' from articulos where (precio / 3) < 50;

/********************************************
			LABORATORIO 3
********************************************/

select * from Clientes;
/* SE SACA LA PROTECCION PARA MODIFICAR LA TABLA */
set sql_safe_updates = 0;
-- 2- Actualizar el nombre del cliente 1 a José.
update Clientes set Nombre = "José" where ClienteId = 1;
-- 3- Actualizar el nombre apellido y cuit del cliente 3 a Pablo Fuentes 20-21053119-0.
update Clientes set Nombre = "Pablo", Apellido = "Fuentes", Cuit = "20-21053113-0" where ClienteId = 3;
-- 4- Actualizar todos los comentarios NULL a ‘’.
update Clientes set Comentarios = "";
-- 5- Eliminar los clientes con apellido Perez.
delete from Clientes where Apellido = "Perez";
-- 6- Eliminar los clientes con CUIT Terminan en 0
delete from Clientes where right(Cuit, 1) = 0;
-- 7- Aumentar un 20% los precios de los artículos con precio menor igual a 50.
select * from Articulos;
update Articulos set precio = precio * 1.20 where precio <= 50;
-- 8- Aumentar un 15% los precios de los artículos con precio mayor a 50.
update Articulos set precio = precio * 1.15 where precio > 50;
-- 9- Bajar un 5% los precios de los artículos con precio mayor a 200.
update Articulos set precio = precio * 0.95 where precio > 200;
-- 10- Eliminar los artículos con stock menor a 0.
delete from Articulos where stock < 0;

/********************************************
		LABORATORIO 3 - Bonus Track
********************************************/

select * from facturas;
-- 1- Obtener el monto máximo de factura.
select max(Monto) as Monto from facturas;
-- 2- Obtener el monto mínimo de factura.
select min(Monto) as Monto from facturas;
-- 3- Obtener el monto mínimo de factura entre los años 2011 y 2020.
select min(Monto) as Monto from facturas where year(Fecha) between 2011 and 2020;
-- 4- Obtener el monto promedio de factura.
select round(avg(Monto), 2) as Promedio from facturas;
-- 5- Obtener la factura con el monto promedio del año 2011.
select round(avg(Monto),2) as Promedio from facturas where year(Fecha) = 2011;
-- 6- Obtener la cantidad de facturas.
select count(*) as CantFact from facturas;
-- 7- Obtener la cantidad de facturas que tienen un monto entre $500 y $3.300.
select count(*) as CantFact from facturas where Monto between 500 and 3300;
-- 8- Obtener la cantidad de facturas que hay en cada año.
select year(Fecha) as Anio, count(*) as CantFact from facturas group by year(Fecha);
-- 9- Obtener la cantidad de facturas y el monto promedio en cada año.
select year(Fecha) 'Año', count(*) 'Cantidad de facturas', round(avg(monto),2) 'Monto promedio' from facturas group by year(Fecha);
-- 10- Obtener la suma del monto y el promedio de las facturas según la letra.
select Letra as 'Tipo', sum(Monto) as 'Suma Total', round(avg(Monto), 2) as 'Promedio' from facturas group by Letra;

/********************************************
			LABORATORIO 4
********************************************/

-- 1- Agregar la relación(FK) entre la tabla Facturas y la tabla Clientes.
alter table Facturas add constraint fk_fact_cli foreign key(ClienteID) references Clientes(ClienteID);
-- 2- Agregar la relación(FK) entre la tabla Facturas y la tabla Articulos.
alter table Facturas add constraint fk_fact_art foreign key(ArticuloID) references Articulos(ArticuloID);
-- 3- Generar un error de FK en la tabla Facturas.
insert into Facturas(Letra	, Numero, ClienteID	, ArticuloID, Fecha			, Monto	)
values				('B'	, 16	, 22		, 1			, '2011/11/18'	, 5000	);
-- 4- Agregar la columna CPostal a la tabla Clientes.
alter table Clientes add cPostal char(8);
alter table Clientes add cPostal char(8) after Direccion;
-- 5- Eliminar la columna CPostal de la tabla Clientes.
alter table Clientes drop Column cPostal;
select * from Clientes;

/********************************************
		LABORATORIO 4 - Bonus Track
********************************************/

-- 1- Informar nombre y apellido de los clientes que han realizado compras.
select distinct nombre, apellido from Clientes c join Facturas f On c.ClienteID = f.ClienteID;
-- 2- Informar nombre y apellido de los clientes que tienen facturas con monto mayor a 2000 pesos.
select nombre, apellido from Clientes c join Facturas f  On c.ClienteID = f.ClienteID
where monto > 2000 group by nombre, apellido;
-- 3- Informar letra y número de factura, el nombre y el precio de los artículos que se han vendido.
select Letra, Numero, Nombre, Precio from Facturas f Join Articulos a On f.ArticuloID = a.ArticuloID;
select Letra, Numero, Nombre, Precio from Facturas join Articulos; -- ESTE NO
select Letra, Numero, Nombre, Precio from Facturas, Articulos; -- ESTE NO
select * from Articulos;
-- 4- Informar el precio máximo y mínimo de los artículos facturados con factura letra A.
select max(Precio) as 'PrecioMax', min(Precio) as 'PrecioMin' from Facturas f join Articulos a On f.ArticuloID = a.ArticuloID;
-- 5- Informar la cantidad de facturas, nombre y apellido de cada cliente.
select Nombre, Apellido, count(*) as 'Cantidad' from Facturas f join Clientes c on f.ClienteID = c.ClienteID group by Nombre, Apellido;
-- 6- Informar el promedio de venta para los artículos con precio > 10.
select round(avg(Monto), 2) as 'Promedio' from Facturas f join Articulos a On f.ArticuloID = a.ArticuloID
where Precio > 10;
select * from facturas;
-- 7- Informar nombre y apellido y total de monto de facturas por año para cada cliente.
select Nombre, Apellido, year(Fecha), sum(Monto) from Facturas f join Clientes c 
On f.ClienteID = c.ClienteID group by Nombre, Apellido, year(Fecha);
-- 8- Informar que facturas fueron emitidas al cliente Diaz.
select Letra, Numero from Facturas f join Clientes c On f.ClienteID = c.CLienteID
where Apellido = 'Diaz';
-- 9- Informar el total vendido por artículo.
select f.ArticuloID, sum(Monto) as 'TotalVendido' from Facturas f join Articulos a 
On f.ArticuloID = a.ArticuloID group by f.ArticuloID;
-- 10- Informar nombre y apellido del cliente que más ha comprado.
select Nombre, Apellido, sum(Monto) as 'TotalComprado' from Clientes c join Facturas f
On c.ClienteID = f.ClienteID group by Nombre, Apellido order by sum(Monto) desc Limit 1;








