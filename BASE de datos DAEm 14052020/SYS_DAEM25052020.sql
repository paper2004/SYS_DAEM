create database SYS_DAEM;

use SYS_DAEM;

create table usuario(
id_usuario int auto_increment primary key  ,
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
	in	_rut varchar(12),
		_nombre varchar(100),
        _apellido varchar(100),
        _pass varchar(100),
        _proceso varchar(100),
        _cargo varchar(100),
        _email varchar(100),
        _ult_session datetime
)BEGIN
	INSERT INTO usuario(rut,nombre,apellido,pass,proceso,cargo,email,ult_session) VALUES (_rut,_nombre,_apellido,_pass,_proceso,_cargo,_email,_ult_session);
END
// DELIMITER ;

/*insert into usuario  (rut,nombre,apellido,pass,proceso,cargo,email,ult_session) values('13.775.844-K','Carlos Eduardo','Garate Ortiz','paper','Inventario','Informatico','carlos.garate@daemgraneros.cl',now());*/
/*call newUser('13.775.844-K','Carlos','Garate','12345678','Inventario','Informatico','carlos.garate@daemgraneros.cl',now());*/


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

create table directoresEstabl(
id_director int auto_increment primary key,
est_rutDirect varchar(15) not null,
est_nomDirect varchar(100) not null,
fecha_ingreso datetime not null
)engine=InnoDB,charset=utf8mb4;

create table estado(
id_estado int auto_increment primary key,
est_daem varchar(100),
est_establecimiento varchar(50),
est_fecha_ingreso datetime not null
);

create table convenio(
id_convenio int auto_increment primary key,
conv_daem varchar(100),
conv_fecha_ingreso datetime not null
);

create table tipoArticulo(
id_tipoArticulo int auto_increment primary key,
tipo_articulo varchar(100) not null,
fecha_ingreso datetime
)engine=InnoDB,charset=utf8mb4;

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

create table establecimiento(
id_establecimiento int auto_increment primary key,
id_director int not null, FOREIGN KEY (id_director) REFERENCES directoresEstabl (id_director),
id_usuario int not null, FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
est_direccion varchar(100),
est_rbd varchar(10),
est_logo blob,
est_fechIngreso datetime
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


