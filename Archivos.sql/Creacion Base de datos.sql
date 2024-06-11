/*-----------------------------------Creacion Base de datos--------------------------------------------------------------------------*/

CREATE DATABASE IF NOT EXISTS mercado_free;
USE mercado_free;

/*-----------------------------------Eliminación de tablas existentes (si existen)--------------------------------------------------------------------------*/

DROP TABLE IF EXISTS lista_productos;
DROP TABLE IF EXISTS calificaciones;
DROP TABLE IF EXISTS carrito;
DROP TABLE IF EXISTS categorias_productos;
DROP TABLE IF EXISTS comentarios;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS cuenta_bancaria;
DROP TABLE IF EXISTS categoria;
DROP TABLE IF EXISTS historial;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS pais;

/*-----------------------------------Creacion de tablas--------------------------------------------------------------------------*/

CREATE TABLE IF NOT EXISTS pais (
    codigo_pais INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS usuarios (
    id_usuarios CHAR(36) NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    contrasena VARCHAR(50) NOT NULL,
    direccion VARCHAR(300) NOT NULL,
    telefono VARCHAR(50) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(50) NOT NULL,
    estado TINYINT(1) DEFAULT 0,
    codigo_pais_fk INT,
    FOREIGN KEY (codigo_pais_fk) REFERENCES pais(codigo_pais)
);

CREATE TABLE IF NOT EXISTS productos (
    id_productos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    precio INT NOT NULL DEFAULT 0,
    fabricante VARCHAR(60),
    stock INT NOT NULL DEFAULT 0,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS calificaciones (
    id_calificaciones INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    puntuacion INT DEFAULT 0 CHECK (puntuacion >= 0 AND puntuacion <= 5),
    id_producto_fk INT,
    id_usuario_fk CHAR(36),
    FOREIGN KEY (id_producto_fk) REFERENCES productos(id_productos),
    FOREIGN KEY (id_usuario_fk) REFERENCES usuarios(id_usuarios)
);

CREATE TABLE IF NOT EXISTS carrito (
    Fecha_carrito TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado BOOL DEFAULT false,
    id_carrito INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario_fk CHAR(36),
    FOREIGN KEY (id_usuario_fk) REFERENCES usuarios(id_usuarios)
);

CREATE TABLE IF NOT EXISTS categoria (
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS categorias_productos (
    id_categorias_productos INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_productos_fk INT,
    id_categoria_fk INT,
    FOREIGN KEY (id_productos_fk) REFERENCES productos(id_productos),
    FOREIGN KEY (id_categoria_fk) REFERENCES categoria(id_categoria)
);

CREATE TABLE IF NOT EXISTS comentarios (
    id_comentarios INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    texto VARCHAR(300) NOT NULL,
    fecha_creacion_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_producto_fk INT,
    id_usuario_fk CHAR(36),
    FOREIGN KEY (id_usuario_fk) REFERENCES usuarios(id_usuarios),
    FOREIGN KEY (id_producto_fk) REFERENCES productos(id_productos)
);

CREATE TABLE IF NOT EXISTS historial (
    id_historial INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_historial TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50),
    id_usuario_fk CHAR(36),
    FOREIGN KEY (id_usuario_fk) REFERENCES usuarios(id_usuarios)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id_pedidos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50),
    metodo_pago VARCHAR(50),
    id_historial_fk INT,
    id_usuario_fk CHAR(36),
    FOREIGN KEY (id_usuario_fk) REFERENCES usuarios(id_usuarios),
    FOREIGN KEY (id_historial_fk) REFERENCES historial(id_historial)
);

CREATE TABLE IF NOT EXISTS lista_productos (
    id_lista_productos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_productos_fk INT,
    id_pedidos_fk INT,
    id_carrito_fk INT,
    cantidad INT DEFAULT 0 NOT NULL,
    FOREIGN KEY (id_productos_fk) REFERENCES productos(id_productos),
    FOREIGN KEY (id_pedidos_fk) REFERENCES pedidos(id_pedidos),
    FOREIGN KEY (id_carrito_fk) REFERENCES carrito(id_carrito)
);

CREATE TABLE IF NOT EXISTS cuenta_bancaria (
    id_cuenta CHAR(36) NOT NULL PRIMARY KEY,
    nombre_banco VARCHAR(50) NOT NULL,
    Numero_cuenta VARCHAR(50) NOT NULL UNIQUE,
    codigo_pais_fk INT,
    id_usuario_fk CHAR(36),
    FOREIGN KEY (codigo_pais_fk) REFERENCES pais(codigo_pais),
    FOREIGN KEY (id_usuario_fk) REFERENCES usuarios(id_usuarios)
);

DELIMITER //

CREATE TRIGGER IF NOT EXISTS before_insert_usuarios
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    IF NEW.id_usuarios IS NULL OR NEW.id_usuarios = '' THEN
        SET NEW.id_usuarios = UUID();
    END IF;
END;

//

DELIMITER ;

