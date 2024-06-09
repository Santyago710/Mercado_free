/*Creacion Base de datos*/

Create database mercado_free;


 foreign key (id_usuario_fk) REFERENCES usuarios(id_usuarios));
CREATE TABLE calificaciones (
  id_calificaciones int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
 puntuacion INT DEFAULT 0 CHECK (puntuacion >= 0 AND puntuacion <= 5),
  id_producto_fk int,
  id_usuario_fk CHAR(36),
 FOREIGN KEY (id_producto_fk) references productos(id_productos),
FOREIGN KEY (id_usuario_fk) references usuarios(id_usuarios));

CREATE TABLE carrito (
  Fecha_carrito TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  estado bool default false,
  id_carrito int NOT NULL AUTO_INCREMENT primary key,
  id_usuario_fk char(36),
  foreign key (id_usuario_fk) references usuarios(id_usuarios)
  );


CREATE TABLE categoria (
  nombre varchar(50) NOT NULL,
  descripcion varchar(100) NOT NULL,
  id_categoria int NOT NULL AUTO_INCREMENT Primary key);


CREATE TABLE categorias_productos (
  id_categorias_productos int AUTO_INCREMENT not null primary key,
  id_productos_fk int ,
  id_categoria_fk int ,
  foreign key (id_productos_fk) references productos(id_productos),
  foreign key (id_categoria_fk) references categoria(id_categoria)
);




CREATE TABLE comentarios (
  id_comentarios int(11) NOT NULL AUTO_INCREMENT primary key,
  texto varchar(300) not null,
  fecha_creacion_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  id_producto_fk int ,
  id_usuario_fk char(36),
  foreign KEY (id_usuario_fk) references usuarios (id_usuarios),
  foreign KEY (id_producto_fk) references productos (id_productos));


CREATE TABLE historial (
  id_historial int NOT NULL AUTO_INCREMENT primary key,
  fecha_historial TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  estado varchar(50) ,
  id_usuario_fk char(36),
  foreign KEY (id_usuario_fk) references usuarios(id_usuarios));






CREATE TABLE lista_productos (
 id_lista_productos int not null primary key,
 id_productos int,
 id_pedidos int,
 foreign KEY (id_productos) references productos(id_productos),
 foreign KEY (id_pedidos) references pedidos (id_pedidos));
  Alter table lista_productos  add column cantidad int default 0;




CREATE TABLE pedidos (
  id_pedidos int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  estado varchar(50) ,
  metodo_pago varchar(50),
  id_historial_fk int,
  id_usuario_fk char(36),
  FOREIGN KEY (id_usuario_fk) REFERENCES usuarios(id_usuarios),
   FOREIGN KEY (id_historial_fk) REFERENCES historial (id_historial)
);



CREATE TABLE productos (
  id_productos int NOT NULL AUTO_INCREMENT primary key,
  nombre varchar(50) NOT NULL,
  descripcion varchar(100) NOT NULL,
  precio int NOT NULL DEFAULT 0,
  fabricante varchar(60) ,
  stock int  NOT NULL DEFAULT 0,
  fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP);


CREATE TABLE pais (
    codigo_pais INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE usuarios (
    id_usuarios CHAR(36) NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    contrasena VARCHAR(50) NOT NULL,
    direccion VARCHAR(30) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(50) NOT NULL,
    estado TINYINT(1) DEFAULT 0,
    codigo_pais_fk INT,
    FOREIGN KEY (codigo_pais_fk) REFERENCES pais(codigo_pais)
);

create table cuenta_bancaria(
 id_cuenta CHAR(36) NOT NULL PRIMARY KEY,
 nombre_banco varchar(50) not null,
 Numero_cuenta varchar(50) not null unique,
 codigo_pais_fk int, 
 id_usuario_fk char(36),
 FOREIGN KEY (codigo_pais_fk) REFERENCES pais(codigo_pais));