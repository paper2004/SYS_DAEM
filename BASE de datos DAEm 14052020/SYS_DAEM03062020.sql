create database SYS_DAEM;

use SYS_DAEM;
/*

call newDirectorEstabl('6.152.024-4','Viviana Enoe Brito Martinez',now());
call newDirectorEstabl('7.886.787-6','Juan Bernardo Mardones Garcia',now());
call newDirectorEstabl('9.240.889-2','Maria Susana Parejas del Valle',now());
call newDirectorEstabl('7.080.770-K','Juan Alfonso Galvez Astorga',now());
call newDirectorEstabl('6.747.625-5','Isabel Margarita Garnham Carrizo',now());
call newDirectorEstabl('10.077.097-0','Filomena Del Carmen Urbina Campos',now());
call newDirectorEstabl('8.827.394-K','Marta Ernestina Galvez Astorga',now());
call newDirectorEstabl('15.124.724-5','Maria Jose Gomez Ubilla ',now());
call newDirectorEstabl('13.856.898-9','Jose Manuel Farias Gonzalez',now());
call newDirectorEstabl('13.096.070-7','Jessica del Pilar Medina Toledo',now());
call newDirectorEstabl('13.503.444-4','Pamela Constanza Madrid Miranda',now());
call newDirectorEstabl('11.888.486-8','Marcela Del Carmen Guajardo Cubillos',now());
*/


create table establecimiento(
id_establecimiento int auto_increment primary key,
est_nombre varchar(100)not null,
est_direccion varchar(100)not null,
est_ciudad varchar(100)not null,
est_rbd varchar(10)not null,
est_logo blob,
fecha_ingreso datetime not null
)engine=InnoDB,charset=utf8mb4;

DELIMITER //
CREATE PROCEDURE newEstablecimiento(
	in	_est_nombre varchar(100),
		_est_direccion varchar(100),
        _est_ciudad varchar(100),
		_est_rbd varchar(100),
        _est_logo blob,
        _fecha_ingreso datetime
)BEGIN
	INSERT INTO establecimiento(est_nombre,est_direccion,est_ciudad,est_rbd,est_logo,fecha_ingreso) VALUES (_est_nombre,_est_direccion,_est_ciudad,_est_rbd,_est_logo,_fecha_ingreso);
END
// DELIMITER ;

DELIMITER //
CREATE PROCEDURE cboEstablecimiento(
in 	_id_establecimiento int,
	_est_nombre varchar(100)
)BEGIN
	select id_establecimiento,est_nombre from establecimiento where id_establecimiento=_id_establecimiento and est_nombre=_est_nombre;
END
//DELIMITER ;

call cboEstablecimiento('1','Sixto Mendez Parada');

call newEstablecimiento('Sixto Mendez Parada','Guillermo Berrios N°236','Graneros','2206-3',null,now());
call newEstablecimiento('Colegio Tuniche','Camino Real s/n','Graneros','2212-8',null,now());
call newEstablecimiento('Liceo Integrado de Adultos','Luis Barros Borgoño Sur n°0725','Graneros','15665-5',null,now());
call newEstablecimiento('Escuela Maria Escobillana Guzmán','Villa Rafael Carvallo, pasaje los Pimientos n°0675','Graneros','15762-7',null,now());
call newEstablecimiento('Colegio Antuhue','Fundo los Romeros s/n, Recinto Carcelario COD-CERECO','Graneros','15763-5',null,now());
call newEstablecimiento('Liceo Profesor Misael Lobos Monroy','Guillermo Berrios N°130','Graneros','2205-5',null,now());
call newEstablecimiento('Colegio Hernán Olguin Maibee','Santa Lucia n°155','Graneros','2207-1',null,now());
call newEstablecimiento('R.P Antonio Trdan Arko','Pobl. Domingo Yañez, Caupolican n°240','Graneros','2209-8',null,now());
call newEstablecimiento('Villa La Compañia','Pje. Carlos Rubio n°068, La Compañia','Graneros','2210-1',null,now());
call newEstablecimiento('DAEM Graneros','Arturo Prat n°120','Graneros','2210-1',null,now());

select * from establecimiento;


create table usuario(
id_usuario int auto_increment primary key  ,
id_establecimiento int not null, FOREIGN KEY (id_establecimiento) REFERENCES establecimiento (id_establecimiento),
rut varchar(12)not null,
nombre varchar(100) not null,
apellido varchar(100) not null,
pass varchar(100) not null, 
proceso varchar (100) not null,
cargo varchar (100) not null,
email varchar (100) not null,
ult_session datetime not null,
unique(rut)
) engine=InnoDB,charset=utf8mb4;

DELIMITER //
CREATE PROCEDURE newUser(
	in	_id_establecimiento int,
		_rut varchar(12),
		_nombre varchar(100),
        _apellido varchar(100),
        _pass varchar(100),
        _proceso varchar(100),
        _cargo varchar(100),
        _email varchar(100),
        
        _ult_session datetime
)BEGIN
	INSERT INTO usuario(id_establecimiento,rut,nombre,apellido,pass,proceso,cargo,email,ult_session) VALUES (_id_establecimiento,_rut,_nombre,_apellido,_pass,_proceso,_cargo,_email,_ult_session);
END
// DELIMITER ;

/*insert into usuario  (rut,nombre,apellido,pass,proceso,cargo,email,ult_session) values('13.775.844-K','Carlos Eduardo','Garate Ortiz','paper','Inventario','Informatico','carlos.garate@daemgraneros.cl',now());*/
call newUser(1,'13.775.844-K','Carlos','Garate','5c2301d78b1c720ef74ef938bbee1937b7d008d1','Inventario','Informatico','carlos.garate@daemgraneros.cl',now());

select * from usuario;

DELIMITER //
CREATE PROCEDURE autenticar(
	in	_rut varchar(12),
		_pass varchar(100)
)BEGIN
	select * from usuario where rut = _rut and pass = _pass;
END
// DELIMITER ;

call autenticar ('13.775.844-K','paper');

DELIMITER //
CREATE PROCEDURE validarRegistro(
	in	_rut varchar(12)
)BEGIN
	select rut from usuario where rut =_rut;
END
// DELIMITER ;

call validarRegistro ('13.775.844-K');

/*
DELIMITER //
CREATE PROCEDURE consultaSesion(
	in	_rut varchar(12)
)BEGIN
	select rut,nombre,apellido from usuario where rut=_rut;
END
// DELIMITER ;

call consultaSesion('13.775.844-K');
*/
select rut,nombre,apellido from usuario where rut='13.775.844-K';
select * from usuario;
delete from usuario where id_usuario='1';

create table estado(
id_estado int auto_increment primary key,
est_establecimiento varchar(100),
fecha_ingreso datetime not null
);

DELIMITER //
CREATE PROCEDURE newEstado(
	in	_est_establecimiento varchar(100),
		_fecha_ingreso datetime
)BEGIN
	INSERT INTO estado(est_establecimiento,fecha_ingreso) VALUES (_est_establecimiento,_fecha_ingreso);
END
// DELIMITER ;

call newEstado('Entregado',now());
call newEstado('Pendiente',now());
call newEstado('Devolucion',now());

select * from estado;

create table convenio(
id_convenio int auto_increment primary key,
conv_daem varchar(100),
fecha_ingreso datetime not null
);

DELIMITER //
CREATE PROCEDURE newConvenio(
	in	_conv_daem varchar(100),
		_fecha_ingreso datetime
)BEGIN
	INSERT INTO convenio(conv_daem,fecha_ingreso) VALUES (_conv_daem,_fecha_ingreso);
END
// DELIMITER ;

call newConvenio('Suvencion Escolar Preferencial',now());
call newConvenio('Fondo de apoyo a la educacion publica',now());
call newConvenio('Subvencion Regular',now());
call newConvenio('Junji',now());

select * from convenio;

create table tipoArticulo(
id_tipoArticulo int auto_increment primary key,
tipo_articulo varchar(100) not null,
fecha_ingreso datetime
)engine=InnoDB,charset=utf8mb4;

DELIMITER //
CREATE PROCEDURE newTipoArticulo(
	in	_tipo_articulo varchar(100),
		_fecha_ingreso datetime
)BEGIN
	INSERT INTO tipoArticulo(tipo_articulo,fecha_ingreso) VALUES (_tipo_articulo,_fecha_ingreso);
END
// DELIMITER ;

call newTipoArticulo('Fungible',now());
call newTipoArticulo('Mueble',now());

select * from tipoArticulo;

create table proveedor(
id_proveedor int auto_increment primary key,
prov_nombre varchar(100)not null,
prov_rut varchar(15) not null,
prov_giro varchar (50) not null,
prov_direccion varchar(200) not null,
prov_convMarco boolean,
fech_ingreso datetime
)engine=InnoDB,charset=utf8mb4;

create table articulo(
id_articulo int auto_increment primary key,
id_tipoArticulo int not null, FOREIGN KEY (id_tipoArticulo) REFERENCES tipoArticulo (id_tipoArticulo),
id_convenio int not null, foreign key(id_convenio) references convenio(id_convenio),
art_idConvM numeric,
art_marca varchar(100) not null,
art_cantidad numeric not null,
art_detCantidad varchar(10) not null,
art_valorUn numeric,
art_artCantSaldo numeric,
art_artValorSaldo numeric,
art_observaciones varchar(500),
fecha_ingreso datetime
)engine=InnoDB,charset=utf8mb4;


create table bodega(
id_bodega int auto_increment primary key,
id_articulo int not null, FOREIGN KEY (id_articulo) REFERENCES articulo (id_articulo),
id_establecimiento int not null, FOREIGN KEY (id_establecimiento) REFERENCES establecimiento (id_establecimiento),
id_proveedor int not null, FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor),
bod_fechIngreso datetime,
bod_observaciones varchar(500)
)engine=InnoDB,charset=utf8mb4;

create table if not exists notaCredito(
id_nCredito int auto_increment primary key,
id_proveedor int not null, FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor),
id_articulo int not null, FOREIGN KEY (id_articulo) REFERENCES articulo (id_articulo),
id_establecimiento int not null, FOREIGN KEY (id_establecimiento) REFERENCES establecimiento (id_establecimiento),
noc_cantidad numeric not null,
noc_valor numeric not null,
noc_total numeric not null,
noc_iva float not null,
noc_totalNcredito numeric not null,
noc_fechaIngreso datetime 
)engine=InnoDB,charset=utf8mb4;

create table recepcion(
id_recepcion int auto_increment primary key,
id_proveedor int, FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor),
id_nCredito int, FOREIGN KEY (id_nCredito) REFERENCES notaCredito (id_nCredito),
id_estado int, foreign key (id_estado) references estado(id_estado),
rec_ordProveedor varchar(20) not null,
rec_factProveedor varchar(20) not null,
rec_fechFactura datetime,
rec_respRecepcion varchar(100),
rec_financiamiento varchar(100),
rec_pdfFact blob,
rec_pdfGuia blob,
rec_fechEntrega datetime
)engine=InnoDB,charset=utf8mb4;

create table inventario(
id_inventario int auto_increment primary key,
id_articulo int not null, FOREIGN KEY (id_articulo) REFERENCES articulo (id_articulo),
id_usuario int not null, FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
id_establecimiento int not null, FOREIGN KEY (id_establecimiento) REFERENCES establecimiento (id_establecimiento),
id_proveedor int not null, FOREIGN KEY (id_proveedor) REFERENCES proveedor (id_proveedor),
id_bodega int not null, FOREIGN KEY (id_bodega) REFERENCES bodega (id_bodega),
id_recepcion int not null, FOREIGN KEY (id_recepcion) REFERENCES recepcion (id_recepcion),
inv_cantidad numeric,
inv_valor numeric,
inv_iva float,
inv_totalValor numeric,
observaciones varchar(500),
inv_fechaIngreso datetime
)engine=InnoDB,charset=utf8mb4;


