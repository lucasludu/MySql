/**********************************************
		LABORATORIO BONUS TRACK CLASE 1
***********************************************/

drop database if exists bonusTrack;
create database bonusTrack;
use bonusTrack;
show databases;

/*****************************************************************************************************************************************************************/

drop table if exists Puestos;
create table Puestos (
	puestoId    smallint,
    descripcion varchar(50)
);

drop table if exists Locales;
create table Locales (
	localId   char(4),
    nombre    varchar(40),
    direccion varchar(40),
    ciudad    varchar(20),
    provincia char(2),
    cPostal   char(5)
);

drop table if exists Empleados;
create table Empleados (
	empleadoId   char(9),
    nombre       varchar(20),
    apellido     varchar(30),
    puestoId     smallint,
    editorialId  char(4),
    fechaIngreso datetime
);

drop table if exists LibroAutor;
create table LibroAutor (
	autorId varchar(11),
    libroId varchar(5)
);

drop table if exists Autores;
create table Autores (
	autorId   varchar(11),
    apellido  varchar(40),
    nombre    varchar(20),
    telefono  varchar(12),
    direccion varchar(40),
    ciudad    varchar(20),
    provincia char(2),
    cPostal   char(5),
    estado    tinyint(1)
);

drop table if exists Libros;
create table Libros (
	libroId          varchar(6),
    titulo           varchar(80),
    categoria        char(12),
    editorialId      char(4),
    precio           double,
    comentarios      varchar(200),
    fechaPublicacion datetime
);

drop table if exists Ventas;
create table Ventas (
	localId    char(4),
    facturaNro varchar(20),
    fecha      datetime,
    cantidad   smallint,
    formaPago  varchar(12),
    libroId    varchar(6)
);

drop table if exists Editoriales;
create table Editoriales (
	editorialId char(4),
    nombre      varchar(40),
    ciudad      varchar(20),
    provincia   char(2),
    pais        varchar(30)
);

/*****************************************************************************************************************************************************************/

INSERT INTO Puestos (puestoId, descripcion						   )  
VALUES              (1		 , 'Nuevo Ingreso - Puesto no definido'),
					(2		 , 'CEO'							   ),
					(3		 , 'Director de Operaciones de Negocio'),
					(4		 , 'CFO'							   ),
					(5		 , 'Editorialista'					   ),
					(6		 , 'Director de Edición'			   ),
					(7		 , 'Director de Marketing'			   ),
					(8		 , 'Director de Relaciones Públicas'   ),
					(9		 , 'Director de Compras'		   	   ),
					(10		 , 'Director de Producción'			   ),
					(11		 , 'Director de Operaciones'		   ),
					(12		 , 'Editor'							   ),
					(13		 , 'Representante de Ventas'		   ),
					(14		 , 'Diseñador'						   );

INSERT INTO Locales (localId, nombre			  , direccion				 , ciudad		 , provincia, cPostal)
VALUES              ('6380' , 'Yenny - El Ateneo' , 'Petaonal San Martin 732', 'Paraná'  	 , 'ER'		,'98056' ),
					('7066' , 'Librería Hernández', 'Diagonal 104 1436'      , 'La Plata'	 , 'BA'		,'92789' ),
					('7067' , 'Librería Santa Fe' , 'Ovidio Lagos 3253'		 , 'Rosario' 	 , 'SF'		,'96745' ),
					('7131' , 'Librería Cúspide'  , 'Av San Martin 931'		 , 'Capital' 	 , 'ME'		,'98014' ),
					('7896' , 'SBS Librerías'     , 'Av Rivadavia 4791'		 , 'Capital'	 , 'CO'		,'90019' ),
					('8042' , 'Planeta de Libros' , 'Av Independencia 1682'  , 'Buenos Aires', 'CF'		,'89076' );

INSERT INTO Empleados (empleadoId , nombre	   , apellido	, puestoId, editorialId, fechaIngreso        )  
VALUES				  ('PMA42628M', 'Paolo'	   , 'Accorti'  , 13	  , '0877'	   ,'1992-08-27 00:00:00'),
					  ('PSA89086M', 'Pedro'    , 'Afonso'   , 14	  , '1389'	   ,'1990-12-24 00:00:00'),
					  ('VPA30890F', 'Victoria' , 'Ashworth' , 6		  , '0877'	   ,'1990-09-13 00:00:00'),
					  ('H-B39728F', 'Hele'     , 'Bennett'  , 12	  , '0877'	   ,'1989-09-21 00:00:00'),
					  ('L-B31947F', 'Lesley'   , 'Brow'     , 7		  , '0877'	   ,'1991-02-13 00:00:00'),
					  ('F-C16315M', 'Francisco', 'Chang'    , 4		  , '9952'	   ,'1990-11-03 00:00:00'),
					  ('PTC11962M', 'Philip'   , 'Cramer'   , 2		  , '9952'	   ,'1989-11-11 00:00:00'),
					  ('A-C71970F', 'Aria'     , 'Cruz'     , 10	  , '1389'     ,'1991-10-26 00:00:00'),
					  ('AMD15433F', 'An'       , 'Devo'     , 3		  , '9952'     ,'1991-07-16 00:00:00'),
					  ('ARD36773F', 'Anabela'  , 'Domingues', 8		  , '0877'     ,'1993-01-27 00:00:00'),
				  	  ('PHF38899M', 'Peter'    , 'Franke'   , 10	  , '0877'     ,'1992-05-17 00:00:00'),
					  ('PXH22250M', 'Paul'     , 'Henriot'  , 5		  , '0877'     ,'1993-08-19 00:00:00'),
					  ('CFH28514M', 'Carlos'   , 'Hernandez', 5		  , '9999'     ,'1989-04-21 00:00:00'),
					  ('PDI47470M', 'Palle'    , 'Ibse'     , 7		  , '0736'     ,'1993-05-09 00:00:00'),
					  ('KJJ92907F', 'Karla'    , 'Jablonski', 9		  , '9999'     ,'1994-03-11 00:00:00'),
					  ('KFJ64308F', 'Kari'     , 'Josephs'  , 14	  , '0736'     ,'1992-10-17 00:00:00'),
					  ('MGK44605M', 'Matti'    , 'Karttune' , 6		  , '0736'     ,'1994-05-01 00:00:00'),
					  ('POK93028M', 'Pirkko'   , 'Koskitalo', 10	  , '9999'     ,'1993-11-29 00:00:00'),
					  ('JYL26161F', 'Janine'   , 'Labrune'  , 5		  , '9901'     ,'1991-05-26 00:00:00'),
					  ('M-L67958F', 'Maria'    , 'Larsso'   , 7		  , '1389'     ,'1992-03-27 00:00:00'),
					  ('Y-L77953M', 'Yoshi'    , 'Latimer'  , 12	  , '1389'     ,'1989-06-11 00:00:00'),
					  ('LAL21447M', 'Laurence' , 'Lebiha'   , 5		  , '0736'     ,'1990-06-03 00:00:00'),
					  ('ENL44273F', 'Elizabeth', 'Lincol'   , 14	  , '0877'     ,'1990-07-24 00:00:00'),
					  ('PCM98509F', 'Patricia' , 'McKenna'  , 11	  , '9999'     ,'1989-08-01 00:00:00'),
					  ('R-M53550M', 'Roland'   , 'Mendel'   , 11	  , '0736'     ,'1991-09-05 00:00:00'),
					  ('RBM23061F', 'Rita'     , 'Muller'   , 5		  , '1622'     ,'1993-10-09 00:00:00'),
					  ('HAN90777M', 'Helvetius', 'Nagy'     , 7		  , '9999'     ,'1993-03-19 00:00:00'),
					  ('TPO55093M', 'Timothy'  , 'O\'Rourke', 13 	  , '0736'     ,'1988-06-19 00:00:00'),
					  ('SKO22412M', 'Sve'      , 'Ottlieb'  , 5		  , '1389'     ,'1991-04-05 00:00:00'),
					  ('MAP77183M', 'Miguel'   , 'Paolino'  , 11	  , '1389'     ,'1992-12-07 00:00:00'),
					  ('PSP68661F', 'Paula'    , 'Parente'  , 8		  , '1389'     ,'1994-01-19 00:00:00'),
					  ('M-P91209M', 'Manuel'   , 'Pereira'  , 8		  , '9999'     ,'1989-01-09 00:00:00'),
					  ('MJP25939M', 'Maria'    , 'Pontes'   , 5		  , '1756'     ,'1989-03-01 00:00:00'),
					  ('M-R38834F', 'Martine'  , 'Rance'    , 9		  , '0877'     ,'1992-02-05 00:00:00'),
					  ('DWR65030M', 'Diego'    , 'Roel'     , 6		  , '1389'     ,'1991-12-16 00:00:00'),
					  ('A-R89858F', 'Annette'  , 'Roulet'   , 6		  , '9999'     ,'1990-02-21 00:00:00'),
					  ('MMS49649F', 'Mary'     , 'Saveley'  , 8		  , '0736'     ,'1993-06-29 00:00:00'),
					  ('CGS88322F', 'Carine'   , 'Schmitt'  , 13	  , '1389'     ,'1992-07-07 00:00:00'),
					  ('MAS70474F', 'Margaret' , 'Smith'    , 9		  , '1389'     ,'1988-09-29 00:00:00'),
					  ('HAS54740M', 'Howard'   , 'Snyder'   , 12	  , '0736'     ,'1988-11-19 00:00:00'),
					  ('MFS52347M', 'Marti'    , 'Sommer'   , 10	  , '0736'     ,'1990-04-13 00:00:00'),
					  ('GHT50241M', 'Gary'     , 'Thomas'   , 9		  , '0736'     ,'1988-08-09 00:00:00'),
					  ('DBT39435M', 'Daniel'   , 'Tonini'   , 11	  , '0877'     ,'1990-01-01 00:00:00');

INSERT INTO LibroAutor (autorId		 , libroId )  
VALUES				   ('172-32-1176', 'PS3333'),
					   ('213-46-8915', 'BU1032'),
					   ('213-46-8915', 'BU2075'),
					   ('238-95-7766', 'PC1035'),
					   ('267-41-2394', 'BU1111'),
					   ('267-41-2394', 'TC7777'),
					   ('274-80-9391', 'BU7832'),
					   ('409-56-7008', 'BU1033'),
					   ('427-17-2319', 'PC8888'),
					   ('472-27-2349', 'TC7778'),
					   ('486-29-1786', 'PC9999'),
					   ('486-29-1786', 'PS7777'),
					   ('648-92-1872', 'TC4203'),
					   ('672-71-3249', 'TC7779'),
					   ('712-45-1867', 'MC2222'),
					   ('722-51-5454', 'MC3021'),
					   ('724-80-9391', 'BU1112'),
					   ('724-80-9391', 'PS1372'),
					   ('756-30-7391', 'PS1373'),
					   ('807-91-6654', 'TC3218'),
					   ('846-92-7186', 'PC8889'),
					   ('899-46-2035', 'MC3022'),
					   ('899-46-2035', 'PS2091'),
					   ('998-72-3567', 'PS2092'),
					   ('998-72-3567', 'PS2106');


INSERT INTO Autores (autorId	  , apellido      , nombre	    , telefono  , direccion, ciudad					, provincia , cPostal, estado)  
VALUES				('172-32-1176', 'Quiroga'     , 'Horacio'   , '44967223', ''	   , 'Salto'				, 'ER'		,'4025'	 , 1	 ),
					('213-46-8915', 'Bioy Casares', 'Adolfo'    , '49867020', ''	   , 'Buenos Aires' 		, 'CF'		,'4618'	 , 1	 ),
					('238-95-7766', 'Vargas LLosa', 'Mario'     , '45487723', ''	   , 'Lima'					, 'LI'		,'4705'  , 1	 ),
					('267-41-2394', 'Giardinelli' , 'Mempo'     , '42862428', ''	   , 'Resistencia'			, 'CH'		,'5128'  , 1	 ),
					('274-80-9391', 'Ocampo'      , 'Victoria'  , '48342919', ''	   , 'Beccar'				, 'BA'		,'4609'  , 1	 ),
					('341-22-1782', 'Walsh'       , 'Rodolfo'   , '98430462', ''	   , 'Choele Choel' 		, 'R'		,'6044'  , 0	 ),
					('409-56-7008', 'Lugones'     , 'Leopoldo'  , '46589932', ''	   , 'Río Seco'				, 'CO'		,'4705'  , 1	 ),
					('427-17-2319', 'Echeverría'  , 'Esteba'    , '48367128', ''	   , ''						, ''		,''      , 1	 ),
					('472-27-2349', 'Kafka'       , 'Frank'     , '79386445', ''	   , 'Praga'				, 'AU'		,'5428'  , 1	 ),
					('486-29-1786', 'Sábato'	  , 'Ernesto'   , '45854620', ''	   , 'Rojas'				, 'BA'		,'4130'  , 1	 ),
					('527-72-3246', 'Borges'	  , 'Jorge Luis', '62972723', ''	   , 'Buenos Aires' 		, 'CF'		,'7215'  , 0	 ),
					('648-92-1872', 'Martinez'	  , 'Tomas Eloy', '57456402', ''	   , 'San Miguel'			, 'TU'		,'7330'  , 1	 ),
					('672-71-3249', 'Arlt'		  , 'Roberto'   , '49354228', ''	   , 'Flores'				, 'CF'		,'4595'  , 1	 ),
					('712-45-1867', 'Dolina'	  , 'Alejandro' , '69968275', ''	   , 'Morse'				, 'BA'		,'8105'  , 1	 ),
					('722-51-5454', 'Pigna'		  , 'Felipe'    , '25479982', ''	   , 'Mercedes'				, 'BA'		,'6403'  , 1	 ),
					('724-08-9931', 'Cortazar'	  , 'Julio'     , '48432991', ''	   , 'Ixelles'				, 'BE'		,'4609'  , 0	 ),
					('724-80-9391', 'Piglia' 	  , 'Ricardo'   , '43547128', ''	   , 'Adrogué'				, 'BA'		,'4612'  , 1	 ),
					('756-30-7391', 'Saer'		  , 'Juan José' , '45349219', ''	   , 'Serodino'				, 'SF'		,'4609'  , 1	 ),
					('807-91-6654', 'Ocampo'	  , 'Silvina'   , '39468853', ''	   , 'Microcentro'			, 'CF'		,'8853'  , 1	 ),
					('846-92-7186', 'Puig'		  , 'Manuel'    , '48367128', ''	   , 'General Villegas'		, 'BA'		,'4301'  , 1	 ),
					('893-72-1158', 'Hernández'	  , 'José'      , '74484982', ''	   , 'Chacras de Perdirel'	, 'BA'		,'5688'  , 0	 ),
					('899-46-2035', 'Di Benedetto', 'Antonio'   , '88260752', ''	   , 'Bermejo'				, 'ME'		,'4152'  , 1	 ),
					('998-72-3567', 'Fogwill'	  , 'Rodolfo'   , '49810752', ''	   , 'Quilmes'				, 'BA'		,'4152'  , 1	 );

INSERT INTO Libros 	(libroId , titulo										, categoria		, editorialId	, precio, comentarios, fechaPublicacion		)  
VALUES				('BU1032', 'La invención de Morel'						, 'Novelas'		, '1389'		, 19.99	, ''		 , '1991-06-12 00:00:00'),
					('BU1033', 'El Imperio jesuítico'						, 'Ensayos'		, '0877'		, 22.98	, NULL		 , '1904-06-12 00:00:00'),
					('BU1111', 'El castigo de Dios'							, 'Cuentos'		, '1389'		, 11.95	, ''		 , '1991-06-09 00:00:00'),
					('BU1112', 'Los casos del comisario Croce'				, 'Cuentos'		, '0736'		, 20	, NULL		 , '2018-12-01 00:00:00'),
					('BU2075', 'De las cosas maravillosas'					, 'Ensayos'		, '0736'		, 29.9	, ''		 , '1991-06-30 00:00:00'),
					('BU7832', 'La mujer y su expresió'						, 'Ensayos'		, '1389'		, 19.99	, ''		 , '1991-06-22 00:00:00'),
					('MC2222', 'Crónicas del angel gris'					, 'Relato'		, '0877'		, 19.99	, ''		 , '1991-06-09 00:00:00'),
					('MC3021', 'El mundo contemporáneo'						, 'Historia'	, '0877'		, 29.9	, ''		 , '1991-06-18 00:00:00'),
					('MC3022', 'El silenciero'								, 'Novelas'		, '9901'		, 32	, NULL		 , '1964-03-10 00:00:00'),
					('MC3026', 'The Psychology of Computer Cooking'			, 'Sin asignar'	, '0877'		, NULL	, ''		 , '2004-12-13 00:00:00'),
					('PC1035', 'Pantaleón y las visitadoras'				, 'Novelas'		, '1389'		, 22.95	, ''		 , '1991-06-30 00:00:00'),
					('PC8888', 'El matadero'								, 'Cuentos'		, '1389'		, 20	, ''		 , '1994-06-12 00:00:00'),
					('PC8889', 'Sangre de amor correspondido'				, 'Novelas'		, '1756'		, 13	, NULL		 , '1982-01-01 00:00:00'),
					('PC9999', 'La robotización del hombre y otras páginas'	, 'Antologías'	, '1389'		, NULL	, ''		 , '2004-12-13 00:00:00'),
					('PS1372', 'La ciudad ausente'							,'Novelas'		, '0877'		, 21.59	, ''		 , '1991-10-21 00:00:00'),
					('PS1373', 'Nadie nada nunca'							, 'Novelas'		, '1622'		, 20	, NULL		 , '1980-06-12 00:00:00'),
					('PS2091', 'Caballo en el salitral'						, 'Antologías'	, '0736'		, 10.95	, ''		 , '1991-06-15 00:00:00'),
					('PS2092', 'Memoria romana'								, 'Cuentos'		, '9952'		, 13.5	, NULL		 , '2018-05-29 00:00:00'),
					('PS2106', 'Vivir afuera'								, 'Novelas'		, '0736'		, 70	, ''		 , '1991-10-05 00:00:00'),
					('PS3333', 'Cuentos de Amor, de Locura y Muerte'		, 'Cuentos'		, '0736'		, 19.99 , ''		 , '1991-06-12 00:00:00'),
					('PS7777', 'Sobre héroes y tumbas'						, 'Novelas'		, '0736'		, 79.9	, ''		 , '1991-06-12 00:00:00'),
					('TC3218', 'La promesa'									, 'Novelas'		, '0877'		, 20.95	, ''		 , '1991-10-21 00:00:00'),
					('TC4203', 'La pasión según Trelew'						, 'Crónicas'	, '0877'		, 11.95	, ''		 , '1991-06-12 00:00:00'),
					('TC7777', 'La revolución en bicicleta'					, 'Novelas'		, '0877'		, 14.99	, ''		 , '1991-06-12 00:00:00'),
					('TC7778', 'La metamorfosis'							, 'Novelas'		, '9999'		, 18	, NULL		 , '1975-05-05 00:00:00'),
					('TC7779', 'El juguete rabioso'							, 'Novelas'		, '9999'		, 22	, NULL		 , '1964-01-15 00:00:00');

INSERT INTO Ventas  (localId, facturaNro, fecha				   , cantidad	, formaPago	, libroId )  
VALUES				('6380'	, '6871'	, '1994-09-14 00:00:00', 5			, 'Efectivo', 'BU1032'),
					('6380'	, '722'		, '1994-09-13 00:00:00', 3			, 'Efectivo', 'PS2091'),
					('7066'	, '2976'	, '1993-05-24 00:00:00', 50			, 'Cheque'	, 'PC8888'),
					('7066'	, '7442'	, '1994-09-13 00:00:00', 75			, 'Transf'	, 'PS2091'),
					('7067'	, '4482'	, '1994-09-14 00:00:00', 10			, 'Efectivo', 'PS2091'),
					('7067'	, '2121'	, '1992-06-15 00:00:00', 40			, 'Cheque'	, 'TC3218'),
					('7067'	, '2121'	, '1992-06-15 00:00:00', 20			, 'Cheque'	, 'TC4203'),
					('7067'	, '2121'	, '1992-06-15 00:00:00', 20			, 'Cheque'	, 'TC7777'),
					('7131'	, '914008'	, '1994-09-14 00:00:00', 20			, 'Cheque'	, 'PS2091'),
					('7131'	, '914014'	, '1994-09-14 00:00:00', 25			, 'Cheque'	, 'MC3021'),
					('7131'	, '3087'	, '1993-05-29 00:00:00', 20			, 'Efectivo', 'PS1372'),
					('7131'	, '3087'	, '1993-05-29 00:00:00', 25			, 'Efectivo', 'PS2106'),
					('7131'	, '3087'	, '1993-05-29 00:00:00', 15			, 'Efectivo', 'PS3333'),
					('7131'	, '3087'	, '1993-05-29 00:00:00', 25			, 'Efectivo', 'PS7777'),
					('7896'	, '2299'	, '1993-10-28 00:00:00', 15			, 'Efectivo', 'BU7832'),
					('7896'	, '456'		, '1993-12-12 00:00:00', 10			, 'Efectivo', 'MC2222'),
					('7896'	, '999'		, '1993-02-21 00:00:00', 35			, 'Transf'	, 'BU2075'),
					('8042'	, '423'		, '1994-09-14 00:00:00', 15			, 'Transf'	, 'MC3021'),
					('8042'	, '423'		, '1994-09-14 00:00:00', 10			, 'Transf'	, 'BU1032'),
					('8042'	, '723'		, '1993-03-11 00:00:00', 25			, 'Cheque'	, 'BU1111'),
					('8042'	, '8791'	, '1993-05-22 00:00:00', 30			, 'Cheque'	, 'PC1035');

INSERT INTO Editoriales (editorialId, nombre							, ciudad		, provincia	, pais		 )  
VALUES 					('0736'		, 'Losada'							, 'Buenos Aires', 'CF'		, 'Argentina'),
						('0877'		, 'Ediciones de la Flor'			, 'Buenos Aires', 'CF'		, 'Argentina'),
						('1389'		, 'Abeledo-Perrot'					, 'Buenos Aires', 'CF'		, 'Argentina'),
						('1622'		, 'Amorrortu Editores'				, 'Buenos Aires', 'CF'		, 'Argentina'),
						('1756'		, 'Editorial Atlántida' 			, 'Buenos Aires', 'CF'		, 'Argentina'),
						('9901'		, 'Centro Editor de América Latina'	, 'Buenos Aires', 'CF'		, 'Argentina'),
						('9952'		, 'Editorial Columba'				, 'Buenos Aires', 'CF'		, 'Argentina'),
						('9999'		, 'Editorial Emecé'					, 'Buenos Aires', 'CF'		, 'Argentina');
                        
/*****************************************************************************************************************************************************************/
                        
select * from Puestos;
select * from Locales;
select * from Empleados;
select * from LibroAutor;
select * from Autores;
select * from Libros;
select * from Ventas;
select * from Editoriales;

/*****************************************************************************************************************************************************************/

alter table Puestos 	add primary key (puestoId);
alter table Locales 	add primary key (localId);
alter table Empleados 	add primary key (empleadoId, puestoId, editorialId);
alter table LibroAutor 	add primary key (autorId, libroId);
alter table Autores 	add primary key (autorId);
alter table Libros 		add primary key (libroId, editorialId);
alter table Ventas      add primary key (localId, facturaNro, libroId);
alter table Editoriales add primary key (editorialId);

/**********************************************
		LABORATORIO BONUS TRACK CLASE 2
***********************************************/
-- 1. Listar empleados ordenados por apellido.
select * from Empleados order by apellido asc;

/* 2. Listar nombre y apellido (en una sola columna), y fecha de ingreso de empleados
ordenados por fecha de ingreso, de la más actual a la más antigua. */
select concat(nombre, ' ', apellido) as NombreApellido, fechaIngreso from Empleados order by fechaIngreso desc;

/* 3. Listar nombre y apellido (en una sola columna llamada “Empleado”), y año de
ingreso de empleados ordenados por año de ingreso, del más antiguo al más actual. */
select concat(nombre, ' ', apellido) as NombreApellido, year(fechaIngreso) as AnioIngreso from Empleados order by year(fechaIngreso) desc;

/* 4. Listar inicial del nombre y apellido (en una sola columna llamada “Empleado”), y año de
ingreso de los empleados ingresados en el segundo semestre del año 1989. */
select concat(left(nombre, 1), ' ', apellido) as NombreApellido, year(fechaIngreso) as AnioIngreso from Empleados where year(fechaIngreso) = 1989 and month(fechaIngreso) > 6;

/* 5. Listar empleados ordenados por sexo, teniendo en cuenta que el dato
correspondiente al sexo está dado por la última letra del campo empleado_id */
select * from Empleados order by right(empleadoId, 1) desc;

-- 6. Listar empleadas mujeres pertenecientes a la editorial 0736
select * from Empleados where right(empleadoId, 1) = 'F' and editorialId = 0736;

/* 7. Listar autores nacidos fuera de la provincia de Buenos Aires (BA) y de la
Ciudad de Buenos Aires. */
select * from Autores where ciudad <> 'Buenos Aires' and provincia <> 'BA';

-- 8. Listar novelas publicadas antes del año 2000.
select * from Libros where year(fechaPublicacion) < 2000;

-- 9. Listar libros sin precio asignado.
select * from Libros where precio = 0 or precio is null;

-- 10. Listar libros ordenados por categoría, sólo para categorías conocidas.
select * from Libros where categoria <> 'Sin asignar' order by categoria desc;

-- 11. Listar locales que contengan la palabra “librería” como parte de su nombre.
select * from Locales where nombre like "%Librería%";

/* 12. Listar libros agregando una columna que tenga el precio de cada libro incrementado en un 51%,
una columna con el precio con un descuento del 10% y una columna, con el valor de cuota en
caso de venderse en 6 cuotas con un recargo del 25%. Dar a cada columna calculada una misma
precisión decimal. */
select *, round((precio*1.51), 2) as PrecioIncr, round((precio*0.9),2) as PrecioDesc, round((precio/6*1.25),2) as CuotaRec from Libros;

-- 13. Listar libros que contengan las palabras “de” ó “del” en el nombre.
select * from Libros where titulo like "%de%" or titulo like "%del%";

/* 14. Listar ventas registradas en el primer semestre de cualquier año cuyo método de pago no sea
transferencia ni efectivo. */
select * from Ventas where month(fecha) < 6 and formaPago <> 'Transf' and formaPago <> 'Efectivo';

/**********************************************
		LABORATORIO BONUS TRACK CLASE 3
***********************************************/

select * from Empleados;
-- 1. Listar cantidad de empleados.
select count(*) as Cantidad from Empleados;
-- 2. Listar cantidad de empleados de sexo masculino.
select count(*) as CantMasc from Empleados where right(empleadoId, 1) = 'M';
-- 3. Listar cantidad de autores de la provincia de Buenos Aires (BA).
select * from Autores;
select count(*) as CantAutores from Autores where provincia = 'BA';
-- 4. Listar cantidad de libros por autor.
select * from LibroAutor;
select autorId, count(*) as 'Cant Libro Autor' from LibroAutor group by autorId;
-- 5. Listar cantidad de libros que no sean novelas.
select * from Libros;
select count(*) from Libros;
select count(*) as 'No Novelas' from Libros where categoria <> "Novelas";
-- 6. Listar cantidad de libros con precio mayor a 15.
select count(*) as CantLibros from Libros where  precio > 15;
-- 7. Listar cantidad de locales con código que comience con 7.
select * from Locales;
select count(*) as CantLocales from Locales where left(cPostal, 1) = 7;
-- 8. Listar cantidad de libros por factura.
select * from ventas;
select localId, facturaNro, sum(cantidad) as 'Cantidad' from ventas group by localId, facturaNro;
-- 9. Listar cantidad de unidades vendidas por libro.
select libroId, sum(cantidad) as 'CantLibros' from ventas group by libroId;
-- 10. Listar cantidad de facturas por local.
select localId, count(facturaNro) as 'CantFact' from ventas group by localId;
-- 11. Listar cantidad de unidades vendidas por forma de pago.
select formaPago, count(formaPago) as 'CantEfvo' from ventas where formaPago = "Efectivo";
-- 12. Listar cantidad de libros, precio máximo, precio mínimo, promedio de precio por categoría.
select categoria, count(*) as 'Cantidad', max(precio) as 'PrecioMax', min(precio) as 'PrecioMin', round(avg(precio), 2) as 'Promedio' from Libros group by categoria;
-- 13. Listar cantidad de libros, precio máximo, precio mínimo, promedio de precio por año de publicación.
select year(fechaPublicacion), count(*) as 'Cantidad', max(precio) as 'PrecioMax', min(precio) as 'PrecioMin', round(avg(precio), 2) as 'Promedio' from Libros group by year(fechaPublicacion);
-- 14. Listar precio máximo por editorial.
select editorialId, max(precio) as 'PrecioMax' from Libros group by editorialId;
-- 15. Listar cantidad de libros sin precio por editorial.
select editorialId, count(*) 'Libros sin precio' from Libros where precio is null or precio = 0 group by editorialId;

							# CLASE 4
use bonustrack;
show tables;                            

/* 1. Crear cada una de las restricciones NOT NULL utilizando la sentencia ALTER del subconjunto de sentencias DDL (Data
Definition Language) del lenguaje SQL. */
	-- AUTORES
select * from autores;
describe autores;
alter table autores change column autorId AutorId varchar(11) primary key;
alter table autores change column nombre Nombre varchar(20) not null;
alter table autores change column apellido Apellido varchar(20) not null;
alter table autores change column telefono Telefono varchar(20) not null;
alter table autores change column ciudad Ciudad varchar(20) not null;
alter table autores change column provincia Pcia char(2) not null;
alter table autores change column cPostal CP char(5) not null;
	-- EDITORIALES
select * from editoriales;
describe editoriales;
alter table editoriales change column editorialId EditorialId char(4) primary key;
alter table editoriales change column nombre Nombre varchar(20) not null;
alter table editoriales change column ciudad Ciudad varchar(20) not null;
alter table editoriales change column provincia Pcia char(2) not null;
alter table editoriales change column pais Pais varchar(10);
	-- EMPLEADOS
select * from empleados;
alter table empleados change column nombre Nombre varchar(20) not null;
alter table empleados change column apellido Apellido varchar(20) not null;
alter table empleados change column puestoId PuestoId smallint not null;
alter table empleados change column editorialId EditorialId char(4) not null;
alter table empleados change column fechaIngreso FechaIngreso varchar(20) not null;
    -- LIBROS
select * from libros;
describe libros;
alter table libros change column libroId libroId varchar(6) primary key;
alter table libros change column titulo Titulo varchar(20) not null;
alter table libros change column categoria Categoria varchar(20) not null;
alter table libros change column editorialId EditorialId char(4) not null;
alter table libros change column fechaPublicacion FechaPublicacion varchar(20) not null;
    -- LOCALES
select * from locales;
describe locales;
alter table locales change column nombre Nombre varchar(20) not null;
alter table locales change column direccion Direccion varchar(30) not null;
alter table locales change column ciudad Ciudad varchar(20) not null;
alter table locales change column provincia Pcia char(2) not null;
alter table locales change column cPostal CP varchar(5) not null;
    -- PUESTOS
select * from puestos;
describe puestos;
alter table puestos change column puestoId PuestoId smallint not null primary key;
alter table puestos change column descripcion Descripcion varchar(50) not null;
    -- VENTAS
select * from ventas;
describe ventas;
alter table ventas change column fecha Fecha varchar(20) not null;
alter table ventas change column cantidad Cantidad int not null;
alter table ventas change column formaPago FormaPago varchar(8) not null;

/* 2. Crear la tabla categorías y llenarla con los datos existentes en la tabla de libros en el
campo correspondiente. */
drop table if exists categoria;
create table categoria (
	CategoriaId int auto_increment primary key,
    Nombre varchar(25) not null
);

/* 3. A continuación, agregar una columna llamada categoría_id de tipo número entero en la tabla
libros utilizando la sentencia ALTER del subconjunto de sentencias DDL (Data
Definition Language) del lenguaje SQL. */
select * from libros;
describe libros;
use bonustrack;
set sql_safe_updates = 0;

alter table libros add column CategoriaId int not null after titulo;
update libros set CategoriaId = 1 where Categoria = 'Novelas';
update libros set CategoriaId = 2 where Categoria = 'Ensayos';
update libros set CategoriaId = 3 where Categoria = 'Cuentos';
update libros set CategoriaId = 4 where Categoria = 'Relato';
update libros set CategoriaId = 5 where Categoria = 'Historia';
update libros set CategoriaId = 6 where Categoria = 'Sin asignar';
update libros set CategoriaId = 7 where Categoria = 'Antologías';
update libros set CategoriaId = 8 where Categoria = 'Crónicas';

alter table libros drop column Categoria;
show tables;
/* 4. Agregar a las tablas cada una de las restricciones de integridad referencial a partir de la creación de
claves externas o foráneas (FOREIGN KEY) utilizando la sentencia ALTER del subconjunto de sentencias
DDL (Data Definition Language) del lenguaje SQL y estableciendo cuál será el comportamiento de esas
claves en caso de producirse una modificación en los valores de sus correspondientes claves primarias, a
través de la especificación ON UPDATE. */
select * from empleados;
select * from editoriales;
select * from libroautor;
select * from libros;
select * from ventas;

describe autores;
describe empleados;
describe categoria;
describe puestos;
describe editoriales;
describe libroautor;
describe libros;

alter table empleados 	add foreign key (PuestoId) 		references puestos (PuestoId) 			on update cascade;
alter table empleados 	add foreign key (EditorialId) 	references Editoriales (EditorialId) 	on update cascade; 
alter table libros 		add foreign key (EditorialId) 	references editoriales (EditorialId) 	on update cascade;
alter table ventas 		add foreign key (libroId) 		references libros(libroId) 				on update cascade;


alter table libroautor 	add foreign key (libroId) 		references autores (libroId) 			on update cascade; /**	NO ANDA **/
alter table libros 		add foreign key (CategoriaId) 	references categorias (CategoriaId) 	on update cascade;
alter table ventas		add foreign key (localId) 		references locales(localId) 			on update cascade;


