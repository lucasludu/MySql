show databases;
use claseuno;
show tables;

select * from Mecanicos;
select * from Proveedores;

use claseDos;
show tables;
select * from Ayudantes;

select * from claseuno.mecanicos;

/* MUESTRO LAS DOS TABLAS DE LA CLASE UNO */
select * from claseuno.mecanicos, claseuno.proveedores;
/** ESTOY MOSTRANDO TRES TABLAS DIFERENTES Y DIFERENTES BASES DE DATOS */
select * from claseuno.mecanicos, claseuno.proveedores, clasedos.ayudantes;

use claseuno;

select database();
select * from mecanicos, proveedores;
select * from mecanicos inner join proveedores; -- Ocurre lo mismo que en la linea anterior

/* TELEFONO DE MECANICO Y PROVEEDORES */
select mecanicos.telefono, proveedores.telefono from Mecanicos, Proveedores;

select mecanicos.nombre, mecanicos.telefono, proveedores.nombre, proveedores.telefono from Mecanicos, Proveedores;
select mecanicos.nombre, mecanicos.telefono, proveedores.nombre, proveedores.telefono from Mecanicos inner join Proveedores;

/** NO DUPLICA LOS DATOS **/
select * from mecanicos, proveedores where mecanicos.id = proveedores.id;
select * from mecanicos inner join proveedores where mecanicos.id = proveedores.id;
select mecanicos.telefono, proveedores.telefono from mecanicos, proveedores where mecanicos.id = proveedores.id;

