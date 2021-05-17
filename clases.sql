				# CLASE 1
# COMENTARIO DE LINEA
/* COMENTARIO
	DE VARIAS
    LINEAS */
-- COMENTARIO DE LINEA

create database claseuno; # Creo la BBDD 
use claseuno; /* Uso de la BBDD */
show databases; /* Muestra BBDD */
select database(); /* Muestra la BBDD que estoy usando */

				-- VAMOS A CREAR UNA TABLA
# Not Null = Campo obligatorio.
create table coche (
	id int not null,
    marca varchar(50),
    modelo varchar(25),
    precio float
);

/* Borro la tabla, no es una buena practica */
drop table coche;

show tables; # Muestra las tablas
insert into coche (id    , marca , modelo, precio)
values			   (303030, 'Ford', 'Ka'  , 24000);

select * from coche; # Muestro la tabla de coche. Lo puedo reutilizar las veces que quiera.

insert into coche(id    , marca , modelo , precio)
values           (313131, 'Fiat', 'Palio', 30000);

/* Puedo No poner una variable de la tabla. Me retorna NULL 
Si la variable es "NOT NULL" no se puede crear porque es una
variable obligatoria.Se puede hacer en cualquier orden.*/
insert into coche(precio, id    , marca)
values           (400000, 323232, 'Chevrolet');

insert into coche(id, marca, modelo, precio)
values           (333333, 'Ford', 'Corsa', 3400000),
                 (343434, 'Fiat', 'Uno', 400000),
                 (353535, 'Chrysler', 'Neon', 360000);
                 
select * from coche;

			-- SE CREA OTRA TABLA DE COCHES
# unsigned = Sin signo
# auto_increment = auto incremental
# primary key = clave primaria
# unique key = para no duplicar
create table coche2 (
	id int unsigned auto_increment primary key,
    numero int  unique key,
    marca varchar(25) not null,
    modelo varchar(25) not null,
    precio double not null
);

insert into coche2(numero, marca, modelo, precio)
values            (404040, 'Fiat', 'Siena', 4000);

select * from coche2;

insert into coche2(numero, marca, modelo, precio)
values            (424242, 'Renault', 'Logan', 56000);

# No se puede hacer porque el numero es un "unique key"
insert into coche2(numero, marca, modelo, precio)
values            (424242, 'Renault', 'Koleos', 56030);

# Seteo de campos. Me dice que variables tiene la tabla de coche
describe coche;
describe coche2;


/* select * from = consultar tabla. */
# " * " = muestra todo lo que esta dentro de la tabla.
select * from coche;
select * from coche2;
show tables;

# Quiero ver la marca del coche
select marca from coche;
# Quiero mostrar marca precio del coche
select marca, precio from coche2;
# Muestro marca precio y * de coches 2
/* Te duplica marca y precio, el selector universal va 1ro */
select *, marca, precio from coche;
# Agrego un String en la tabla coche
select 'Hola mundo', marca, precio from coche2;
# Agrego suma cualquiera en coche
select 4000 + 43000 + 1234, marca from coche;
# Multiplico los precios de la tabla de coche2
select precio*1.15 from coche2;
# Sumo los precio de la tabla de coche
select sum(precio) from coche;
select precio from coche;

# Se ordena la tabla coche en orden ascendente y descendente.
select * from coche order by modelo desc;
select * from coche order by precio asc;
/* Me ordena por el primer valor, si no encuentra el primero lo ordena por el segundo 
 Si hay un auto del mismo precio lo ordena por el 2do orden que es descendente.*/
select * from coche order by precio asc, modelo desc;


					# CLASE 2

show tables; -- MUESTRA LA CANTIDAD DE TABLAS QUE TENGO
select database(); -- MUESTRA LA BBDD QUE ESTOY USANDO
describe coche; -- MUESTRA COMO ESTA CONFORMADA LA TABLA DE COCHE

select * from coche;
select * from coche limit 4; -- muestra los 4 primeros de la lista

select * from coche limit 3, 2; -- Solamente el registro 4 quiero ver. A partir del Reg 3 muestra el Reg 4 y 5
select * from coche limit 2 offset 3; -- offset setea de la posicion 3 y muestra los 2 siguientes
select * from coche limit 2 offset 10;

select * from coche where id = 303030 or id = 343434; -- Muestra coche que tienen id 303030 o id 343434

create table verduras (
	id int auto_increment primary key,
    nombre varchar(15) not null,
    precio int not null,
    fechaInicio date, -- Campo tipo fecha
    fechaVenc date
);

insert into verduras (nombre	, precio, fechaInicio	, fechaVenc		)
values				 ("Tomate"	, 50	, "2021-01-01"	, "2021-03-10"	),
					 ("Papa"	, 35	, "2021-01-05"	, "2021-04-18"	),
                     ("Cebolla"	, 60	, "2021-01-10"	, "2021-04-25"	);
                     
select * from verduras;

select concat("Hola", "A", "Todos"); -- No sirve esta todo sin espacios.
select concat_ws(" ","Hola", "A", "Todos"); -- Primero va el separador para separar todos los concatenados
select concat_ws("-", "Hola", "A", "Todos");

select lower(nombre) from verduras; -- MINUSCULA
select upper(nombre) from verduras; -- MAYUSCULA

select left(nombre, 1) from verduras; -- Trae la primera letra del nombre de la verdura
select left(nombre, 3) from verduras;
select right(fechaInicio, 2) from verduras; -- Trae los ultimos dos digitos de la fecha

select year(fechaInicio) from verduras; -- Muestra año de la fecha de inicio
select month(fechaVenc) from verduras; -- Muestra mes de vencimiento de la verdura
select nombre, day(fechaInicio) from verduras; -- Muestra nombre y dia de la fecha de inicio
select nombre, month(fechaInicio), month(fechaVenc) from verduras; -- Muestra nombre, mes de inicio y de vencimiento de la verdura
select nombre, month(fechaVenc) as fechaDeVencimiento, month(fechaInicio) as fechaDeLlegada from verduras;
select nombre, day(fechaVenc), month(fechaVenc) from verduras;

select curdate(); -- Muestra la fecha de hoy (actual)
select current_date(); -- Muestra la fecha actual
select dayname(curdate()); -- Muestra el nombre del dia hoy.
select dayofweek(curdate()); -- Muestra el numero del dia de la semana que estamos posicinados.
select dayofyear(curdate()); -- Muestra el dia del año en la que estamos parado.
select hour(); -- Hora actual, pero no me permite porque no tengo definida la hora.

select datediff(fechaVenc, current_date()) from verduras; -- Diferencia de fechas entre vencimiento y actual.
select datediff(fechaVenc, fechaInicio) from verduras; -- DIferencia entre fecha de vencimiento e inicio.

/* Operadores de comparación */
select nombre, precio from verduras where nombre = "Papa"; -- Muestra nombre y precio donde el nombre sea papa
select * from verduras where precio >= 50; -- Muestra las verduras que tienen precio mayor o igual a 50
select * from verduras where precio <> 50; -- Muestra las verduras que tienen precio diferentes a 50
select * from verduras where ID = 3; -- ES CONVENIENTE USAR CAMPOS UNICOS PARA LA BUSQUEDA

/* Operadores Logicos */
select * from verduras;
select * from verduras where id = 1;

select * from verduras where id = 1 and nombre = "Tomate"; -- Muestra los id = 1 y nombre = "Tomate"
select * from verduras where id = 2 and nombre = "Tomate"; -- No lo muestra porque no cumple una de las dos

select * from verduras where precio >= 40 and precio <= 60;
select * from verduras where precio between 40 and 60; -- Lo mismo que el anterior
select * from verduras where precio not between 40 and 60;

select * from verduras where id = 1 or nombre = "Tomate";
select * from verduras where id = 1 or nombre = "Cebolla"; -- Muestra las dos porque busca una u otra.

select * from verduras where id = 1 and nombre = "Cebolla" or nombre = "Tomate";

select * from verduras where nombre in ("Tomate", "Papa", "Cebolla"); -- Es igual al OR
select * from verduras where nombre not in ("Tomate", "Papa");

insert into verduras (nombre		, precio, fechaInicio	, fechaVenc	)
values				 ("Zanahoria"	, 55	, "2021-01-01"	, null		);

select * from verduras;
select * from verduras where fechaVenc = null; -- no funciona
select * from verduras where fechaVenc = "null"; -- no funciona
select * from verduras where fechaVenc is null; -- SI FUNCIONA. Muestra las fechas que son nulas
select * from verduras where fechaVenc is not null; -- Muestra las fechas que no son nulas

select * from verduras where nombre like '%m%'; -- Busca la m en todos lados
select * from verduras where nombre like 'T%'; -- Una que empiece con t
select * from verduras where nombre like '%a'; -- Una que termine con a
select * from verduras where precio like '%5'; -- Cualquier precio que termine con 5

				# CLASE 3
select * from verduras;
/* Modifica el nombre de la verdura en el id = 1 | conviene hacerlo con un campo unico */
update verduras set nombre = "Tomate" where id = 1; 
/* Modifica la fecha de vencimiento de la tabla de verduras en el id = 4 */
update verduras set fechaVenc = null where id = 4;

/***********************************************************
 *	updates = modificar
 *		-- Me habilita a poder modificar.
 *			set sql_safe_updates = 0;  -- TRUE
 *		-- No me deja modificar
 *			set sql_safe_updates = 1;  -- FALSE
 *	delete = eliminar
***********************************************************/

-- delet from empleados; ELIMINA TODO PERO NO ME BORRA LA TABLA, NO BORRA LOS ID POR EJEMPLO.
-- truncate table empleados; ELIMINA TODA LA TABLA DE EMPLEADOS, ME RESETEA TODO A CERO.

drop table if exists Empleados;
create table Empleados (
	id int auto_increment primary key,
    dni int unsigned not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    sueldo int
);

insert into Empleados (dni		, nombre	, apellido	, sueldo)
values				  (303030	, "Juan"	, "Gomez"	, 40000	),
					  (313131	, "Maria"	, "Perez"	, 41000	),
                      (323232	, "Analia"	, "Gomez"	, 42000	),
					  (333333	, "Juan"	, "Cordoba"	, 43000	);
                      
select * from Empleados;

-- si no destrabo no anda nada
set sql_safe_updates = 0;

-- NO SE TIENE QUE HACER PORQUE NO ES UN CAMPO UNICO
update Empleados set nombre = "Joan" where nombre = "Juan";
update Empleados set sueldo = 45000 where sueldo <> 40000; -- Le cambia el suelo a todos los que no ganan 40000

-- ESTE SI CONVIENE PORQUE ES CAMBIO UNICO
update Empleados set nombre = "Juan" where id = 4;
update Empleados set sueldo = sueldo * 1.15; -- Le aumenta el sueldo un 15% a todo el mundo
update Empleados set sueldo = 48000 where id = 1; -- Solamente le cambia al campo unico

-- NO HAY QUE HACER!
delete from Empleados where nombre = "Juan";
delete from Empleados where apellido = "Gomez";

delete from Empleados where id = 2;
 
/* BORRA TODA LA TABLA PERO CUANDO VUELVO A INGRESAR VA SEGUIR CON EL ID INCREMENTAL
SI HICE HASTA EL ID = 4 CUANDO BORRO LA TABLA VA AGREGAR CON EL ID = 5 */
delete from Empleados;

/* BORRA TODA LA TABLE Y CUANDO VUELVO A CARGAR EMPLEADOS EN LA TABLA ARRANCA CON EL ID = 0
EL TRUNCATE NO TIENE PROTECCION NO HACE FALTA QUE ACTIVE EL set_safe_updates */
truncate table Empleados;
select * from Empleados;
truncate Empleados;

-- DESPROTEJO EL SISTEMA. 
-- LO PROTEJO CONTRA DELETE Y UPDATES, NO LO PROTEJE CON TRUNCATE.
set sql_safe_updates = 1;

drop table if exists Articulos;
create table Articulos (
	id int auto_increment primary key,
    nombre varchar(20) not null,
    precio float not null,
    marca varchar(20) not null,
    categoria varchar(20) not null,
    presentacion varchar(20),
    stock int not null,
    disponible enum('SI', 'NO')
);

insert into Articulos (nombre				, precio	, marca		, categoria		, presentacion		, stock	, disponible)
values				  ('Iphone 6'			, 499.9		, 'Apple'	, 'Smartphone'	, '16 GB'			, 500	, 'SI'		),
					  ('Ipad Pro'			, 599.9		, 'Apple'	, 'Smartphone'	, '128 GB'			, 300	, 'SI'		),
					  ('Nexus 7'			, 299.9		, 'LG'		, 'Smartphone'	, '32 GB'			, 250	, 'NO'		),
					  ('Galaxy S7'			, 459.9		, 'Samsung'	, 'Smartphone'	, '64 GB'			, 200	, 'SI'		),
					  ('Impresora T23'		, 489.9		, 'Epson'	, 'Impresoras'	, 'Color'			, 180	, 'NO'		),
					  ('Impresora T33'		, 399		, 'Epson'	, 'Impresoras'	, 'Color'			, 200	, 'NO'		),
					  ('Lavarropa 700'		, 1679		, 'LG'		, 'Lavarropas'	, 'Automatico'		, 100	, 'SI'		),
					  ('Camara Digital 760'	, 649		, 'Kodak'	, 'Fotografia'	, null				, 150	, 'NO'		),
					  ('Notebook CQ40-300'	, 2999		, 'HP'		, 'Notebooks'	, 'Intel Core I3'	, 100	, 'SI'		);

select * from Articulos;

-- BUSCO LA PRESENTACION NULA PARA PODER MODIFICARLA
select * from Articulos where presentacion is null;
-- SACO LA PROTECCION PARA PODER MODIFICAR LA TABLA
set sql_safe_updates = 0;
-- MODIFICO LA PRESENTACION NULA Y LE PONGO AUTOMATICO
update Articulos set presentacion = 'Automatico' where presentacion is null; -- Es valido pero tengo que hacerlo con un campo unico
update Articulos set presentacion = 'Automatico' where id = 8; -- Esta es la mas convenientes porque es campo unico

			# FUNCIONES
-- Cuenta toda la tabla articulos
select count(*) as Conteo from Articulos;  
select count (*) as Conteo from Articulos; -- No se puede separar el conteo del (*)

select count(disponible) as Conteo from Articulos;
select count(*) as Conteo from Articulos where disponible = 'NO';
select count(nombre) as Conteo from articulos where nombre like "%Impresora%";
select count(*) as 'Nombre con T' from Articulos where nombre like "%t%" or nombre like "%T%";

						
                        # CLASE 5
                        
select count(*) from Articulos;
select count(stock) from Articulos;
select sum(precio) from Articulos;
select round(sum(precio*stock), 2) as 'Plata Total' from Articulos; -- suma los (precio * stock)
select sum(precio) from Articulos where precio > 600; -- Suma los precios mayores a los $600
select round(sum(precio*stock), 2) from Articulos where disponible = 'SI'; -- suma (precio * stock) que estan disponible
select min(stock) from Articulos; -- Minima cantidad de stock 
select max(precio) from Articulos; -- Muestra el precio maximo
select nombre, min(precio) from Articulos; -- Nombro el precio mas bajo
/* nombre y precio de articulo ordenado por precio con limite 1
   Muestra los primeros 2 (limite = 2) */
select nombre, precio from Articulos order by precio limit 3; 
/* Muestra el primero mas caro (limit = 1) */
select nombre, precio from Articulos order by precio desc limit 1;

select round(avg(precio), 2) as 'Promedio' from Articulos;

-- Agrupa todo por categoria.
select precio, categoria from Articulos group by categoria;
-- Cantidad de Stock que tengo por departamento
select categoria, sum(stock) as 'CantProd' from Articulos group by categoria;
-- Cantidad de plata que tengo por departamento
select categoria, round(sum(precio), 2) as 'CantPlata' from Articulos group by categoria;

select nombre, precio, round((precio*1.15), 2) as 'NewPrecio' from Articulos;
select nombre, precio, round((precio*1.15), 2) as NewPrecio from Articulos where NewPrecio >= 600; -- NO ANDA
select nombre, precio, round((precio*1.15), 2) as NewPrecio from Articulos where (precio*1.15) >= 600; -- SII
-- EL HAVING ACTUA COMO UN WHERE Y TRABAJA CON ALIAS Y LITERALES
select nombre, precio, round((precio*1.15), 2) as NewPrecio from Articulos having NewPrecio >= 600; -- ANDA
select nombre, precio, round((precio*1.15), 2) as 'NewPrecio' from Articulos having 'NewPrecio' >= 600; -- NO ANDA
select nombre, precio, round((precio*1.15), 2) as NewPrecio from Articulos having (precio*1.15) >= 600;

/** 
	where  --> Sirve para (precio*1.15) pero no para el AS 'NewPrecio'
    having --> Sirve para los alias y para (precio*1.15)
**/

drop table if exists Mecanicos;
create table Mecanicos (
	id 			int auto_increment primary key,
    dni 		int unsigned unique key not null,
    nombre 		varchar(15) not null,
    apellido 	varchar(15) not null
);

insert into Mecanicos 	(dni	, nombre	, apellido		)
values 					(303030	, "Carlitos", "Figueroa"	),
						(313131	, "Fernando", "Robles"		),
                        (323232	, "Daiana"	, "Bilhere"		),
                        (333333	, "Vicky"	, "Genga"		);
				
select * from Mecanicos;
describe Mecanicos;

-- Si necesito agregar columna Telefono a la tabla tengo que hacer.....
/* Antes tenia que borrar la tabla y volver agregar la tabla y agregar los insert 
ahora podemos usar el AlterTable */
alter table Mecanicos add column Telefono varchar(25) not null;	

/* PARA AGREGAR LOS TELEFONOS EN LA TABLA */
update Mecanicos set Telefono = '505050' where id = 1;
update Mecanicos set Telefono = '515151' where id = 2;
update Mecanicos set Telefono = '525252' where id = 3;
update Mecanicos set Telefono = '535353' where id = 4;

alter table Mecanicos add email varchar(30) not null;
update Mecanicos set email = 'Carlitos@gmail.com' where id = 1;
update Mecanicos set email = 'Fernando@gmail.com' where id = 2;
update Mecanicos set email = 'Daiana@gmail.com' where id = 3;
update Mecanicos set email = 'Vicky@gmail.com' where id = 4;

-- PARA CONCATENAR
select concat(nombre, '@gmail.com') as 'email' from Mecanicos;
	

-- Si quiero borrar la columna de correo.
alter table Mecanicos drop column email;
-- Para modificar la columna
alter table Mecanicos modify column Telefono varchar(10);
alter table Mecanicos modify column Telefono varchar(15) not null;

-- Modifico Telefono a TELEFONOS (Change = Corrige la palabra)
alter table Mecanicos change column Telefono TELEFONO varchar(15) not null;

-- Agrego columna de email pero despues de dni
alter table Mecanicos add column email varchar(15) not null after dni;

alter table Mecanicos add sueldo int;

-- Quiero borrar varias columnas en un solo golpe
alter table Mecanicos drop email, drop sueldo;

-- Si le quiero cambiar el nombre de la tabla
alter table Mecanicos rename Proveedores;

show tables;
select * from Mecanicos; -- AHORA NO ANDA
describe Mecanicos; -- AHORA NO ANDA
describe Proveedores;

alter table Proveedores rename Mecanicos; -- LO VUELVO DE NUEVO

drop table if exists Proveedores;
create table Proveedores (
	id int auto_increment primary key,
    dni int unsigned unique key not null,
    nombre varchar(25) not null,
    apellido varchar(25) not null,
    telefono varchar(15) not null
);

insert into Proveedores (dni	, nombre	, apellido		, telefono)
values					(343434	, "Monica"	, "Corzo"		, '606060'),
						(353535	, "Jose"	, "Vizzuti"		, '616161'),
                        (363636	, "Mario"	, "Rodriguez"	, '626262'),
                        (373737	, "Melisa"	, "Genga"		, '636363');
                        
select * from proveedores;
show tables;
select database(); -- La base de datos en la que estoy trabajando en este momento.alter

-- Creo mi 2da base de dato
create database claseDos;
use claseDos;
select database();

drop table if exists Ayudantes;
create table Ayudantes (
	id int auto_increment primary key, 
    dni int unsigned not null unique key,
    nombre varchar(30) not null,
    apellido varchar(15) not null,
    telefono varchar(15) not null
);

insert into Ayudantes 	(dni	, nombre	, apellido	, telefono)
values					(383838	, "Federico", "Cazas"	, '707070'),
						(393939	, "Marta"	, "Palencia", '717171'),
                        (404040	, "Rosana"	, "Galmes"	, '727272'),
                        (414141	, "Carolina", "Martinez", '737373');
                        
select * from Ayudantes;

select * from claseuno.Mecanicos; -- Para mostrar la tabla de la base de dato uno, estando en la base de dato 2
select database();

select nombre from claseuno.Mecanicos; -- Trae los nombres de la base de datos 1 estando en la base de datos 2