

create database rapidoacceso;
use rapidoacceso;

#------------------tabla tipodocumento---------------------------------
CREATE TABLE tipodocumento (
	idtipodocumento int(3) not null auto_increment,
	descripciondocumento varchar(40) not null,
		PRIMARY KEY ( idtipodocumento )
)ENGINE=MyISAM DEFAULT CHARSET=utf8;
 
INSERT INTO tipodocumento( descripciondocumento) VALUES

('Cédula de Ciudadanía'),
('tarjeta de identidad'),
('Cédula Extranjería'),
('Numero ciego SENA'),
('Pasaporte'),
('Documento nacional de identificacion'),
('NIT');


#------------------Usuario-----------------------

CREATE TABLE usuario(

  idusuario int(10) not null auto_increment,
  nombre varchar(100) NOT NULL,
  idcargo int (2) not null,
  apellido varchar(100) NOT NULL,
  idtipodocumento int (3) NOT NULL,
  numerodocumento bigint(15) NOT NULL,
  dirección varchar(40) NOT NULL,
  telefonocel bigint(15) NOT NULL,
  telefonofijo bigint(10),
  numerodeficha int(10) ,
  iniciodeformacion date ,
  findeformacion date ,
  correo varchar(45) not null,
  genero int (5) NOT NULL,
  contraseña varchar(100) NOT NULL,
  tipovehiculo int (2) not null,
  estado int(3) null,
	primary key (idusuario),
	foreign key (idtipodocumento)references tipodocumento(idtipodocumento)
	
	
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

#----------------------tablaMoto---------------------------

create table moto (
	marca varchar(15) not null,
	cilindraje int(10) not null,
	modelo varchar(20) not null,
	color varchar(10) not null,
	placa varchar(10)  not null,
	dueño bigint(15) NOT NULL,
		primary key (placa),
		foreign key (dueño)references usuario(numerodocumento)
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

#------------------tablaBicicleta-------------------------------

create table bicicleta (
 
	marca varchar(15) not null,
	marco int(6) not null,
	color varchar(15) not null,
	clase varchar(15) not null,
	dueño bigint(15) NOT NULL,
		primary key (marco),
		foreign key (dueño)references usuario(numerodocumento)
   
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

#------------------------administrador-----------------------------------

create table administrador (

	nombre varchar(100) not null,
	apellido varchar (100) not null,
	idtipodocumento int (3) not null, 
	numerodocumento bigint (15) not null, 
	contraseña varchar  (100) not  null,
    fechainicio date not null,
		primary key (numerodocumento),
		foreign key (idtipodocumento)references tipodocumento(idtipodocumento) 

)ENGINE=MyISAM DEFAULT CHARSET=utf8; 

insert into administrador (nombre,apellido,idtipodocumento,numerodocumento,contraseña,fechainicio) values 
('Administrador', 'Administrador', 1, 12345,"$2y$12$E0qSVARj1ocd1ejsZhF5l.MNnclIF1BpPx6pOj7ropvy8BOoTlowO","0211-02-11"); 

#-----------------------guarda------------------------------------------

create table guarda (
	
	idguarda int(10) not null auto_increment,
	nombre varchar(100) NOT NULL,
	apellido varchar(100) NOT NULL,
	idtipodocumento int(3) NOT NULL,
	numerodocumento bigint(15) NOT NULL,
	telefonocel bigint(15) NOT NULL,
	horario varchar(30) NOT NULL,
	genero int(5) NOT NULL,
	contraseña varchar(100) NOT NULL,
    estado int(3) not null,
		primary key (idguarda),
		foreign key (idtipodocumento)references tipodocumento(idtipodocumento)
  
)ENGINE=MyISAM DEFAULT CHARSET=utf8;


#-----------------------guarda------------------------------------------

create table registro (
	
	idregistro int(100) not null auto_increment,
	idusuario bigint(15) NOT NULL,
	idvehiculo varchar(100) NOT NULL,
	idguarda bigint(10) NOT NULL,
    fechaEntrada  TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
    fechaSalida TIMESTAMP,
	
		primary key (idregistro),
		foreign key (idusuario)references usuario(idusuario),
        foreign key (idguarda)references guarda(idguarda),
        foreign key (idvehiculo)references bicicleta(marco),
        foreign key (idvehiculo)references moto(placa)
  
)ENGINE=MyISAM DEFAULT CHARSET=utf8; 










drop database rapidoacceso;
/*select usuario.numerodocumento,tipodocumento.descripciondocumento as idtipodocumento,usuario.nombre,usuario.apellido,
usuario.telefonofijo,usuario.telefonocel,usuario.dirección,usuario.genero,cargo.descripcioncargo as idcargo,usuario.correo,
usuario.tipovehiculo,usuario.numerodeficha,usuario.iniciodeformacion,
usuario.findeformacion,usuario.estado 
from usuario
inner join cargo 
on usuario.idcargo=cargo.idcargo
inner join tipodocumento
on usuario.idtipodocumento=tipodocumento.idtipodocumento
where usuario.numerodocumento=6757;

*/ 
#--------------------cargo--------------------------------------------
/*create table cargo (
idcargo int (2) not null auto_increment,
descripcioncargo varchar(40) not null,
primary key(idcargo)
)ENGINE=MyISAM DEFAULT CHARSET=utf8;

insert into cargo( descripcioncargo) values
('Aprendiz'),
('Instrictor');*/
use rapidoacceso;
INSERT INTO `guarda` 
(`idguarda`, `nombre`, `apellido`, `idtipodocumento`, `numerodocumento`, `telefonocel`, `horario`, `genero`, `contraseña`, `estado`) VALUES
(NULL, 'santiago', 'pulido', '1', '12345678', '123443', '2:00 PM-10:00 PM', '1', '$2y$12$VFu0zzQtZmwnjlVpHCPU2.tIvHrqtAWbiBacktJ4FsbfkEtTiZFrm', '1');
 
 
 INSERT INTO `usuario` (`idusuario`, `nombre`, `idcargo`, `apellido`, `idtipodocumento`, 
`numerodocumento`, `dirección`, `telefonocel`, `telefonofijo`, `numerodeficha`, `iniciodeformacion`, `findeformacion`, `correo`, `genero`, 
`contraseña`, `tipovehiculo`, `estado`) VALUES 
(NULL, 'sdfdsgfdg', '2', 'dfvgfdbfg', '1', 
'5', '23423', '2324', '232424', NULL, NULL, NULL, 'sdfdfgfg@dfdfgf', '1', '$2y$12$BIpgH9iby7K.5tJlIuHuVO6qxk73Lko.xjqj8CdL9Ir7Xne.0nRoa', '1', '2');



INSERT INTO `bicicleta` (`marca`, `marco`, `color`, `clase`, `dueño`) VALUES ('saddss', '181', 'cddds', '1', '1');

INSERT INTO `moto` (`marca`, `cilindraje`, `modelo`, `color`, `placa`, `dueño`) VALUES ('sdsgdfgf', '122321', '12a', 'wdws', '1qwqa21', '12');





select idregistro, usuario.numerodocumento,guarda.numerodocumento as idguarda,bicicleta.marco as vehiculo,fechaEntrada,fechaSalida,

usuario.nombre,usuario.apellido,usuario.telefonofijo,usuario.telefonocel,usuario.dirección,usuario.genero,usuario.correo,
usuario.tipovehiculo,usuario.numerodeficha,usuario.iniciodeformacion,usuario.findeformacion,usuario.estado,usuario.idcargo,
tipodocumento.descripciondocumento as tipodocumento,

guarda.nombre as nombreguarda,guarda.apellido as apellidoguarda,guarda.genero as generoguarda,guarda.horario,
guarda.idtipodocumento as tipodocguarda,guarda.telefonocel as telefonoguarda,

bicicleta.marca,bicicleta.color,bicicleta.clase

 from registro
 inner join usuario
 on registro.idusuario=usuario.idusuario
 inner join bicicleta
 on registro.idvehiculo=bicicleta.marco
 inner join tipodocumento
 on usuario.idtipodocumento=tipodocumento.idtipodocumento
 inner join guarda
 on registro.idguarda=guarda.idguarda
 where usuario.numerodocumento=1 and guarda.numerodocumento=12345678 and bicicleta.marco=121 and registro.fechaEntrada between "2018-04-23"and "2018-04-24";
 
 
 
 
 
 
 select idregistro, usuario.numerodocumento,guarda.numerodocumento as idguarda, moto.placa as vehiculo,fechaEntrada,fechaSalida,

usuario.nombre,usuario.apellido,usuario.telefonofijo,usuario.telefonocel,usuario.dirección,usuario.genero,usuario.correo,
usuario.tipovehiculo,usuario.numerodeficha,usuario.iniciodeformacion,usuario.findeformacion,usuario.estado,usuario.idcargo,
tipodocumento.descripciondocumento as tipodocumento,

guarda.nombre as nombreguarda,guarda.apellido as apellidoguarda,guarda.genero as generoguarda,guarda.horario,
guarda.idtipodocumento as tipodocguarda,guarda.telefonocel as telefonoguarda,



moto.cilindraje,moto.color,moto.marca,moto.modelo,moto.placa

 from registro
 inner join usuario
 on registro.idusuario=usuario.idusuario
 
 inner join moto
 on registro.idvehiculo=moto.placa
 
 inner join tipodocumento
 on usuario.idtipodocumento=tipodocumento.idtipodocumento
 inner join guarda
 on registro.idguarda=guarda.idguarda
 where moto.placa=1
;
 
 
 
 
 
 