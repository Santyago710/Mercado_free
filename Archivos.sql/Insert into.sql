   /*Insert into*/
   
   /*Insert into Usuarios*/
INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p', 'Juan Pérez', 'clave_segura_123', 'Calle 123', '+5491234567890', 'juan@example.com', 54);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q', 'María García', 'segura123', 'Avenida 456', '+55119876543210', 'maria@example.com', 55);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r', 'Pedro López', '123456', 'Carrera 789', '+571122334455', 'pedro@example.com', 57);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('d1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s', 'Ana Martínez', 'password', 'Calle Principal 1', '+3491122334455', 'ana@example.com', 34);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t', 'Luisa Rodríguez', 'luisa123', 'Avenida Secundaria 2', '+14155552671', 'luisa@example.com', 1);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u', 'Carlos Gómez', 'carlos', 'Calle de la Paz', '+33123456789', 'carlos@example.com', 33);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v', 'Laura Hernández', 'laura123', 'Avenida del Sol', '+391234567890', 'laura@example.com', 39);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w', 'Miguel González', 'miguel123', 'Calle 789', '+521122334455', 'miguel@example.com', 52);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x', 'Sofía Sánchez', 'sofia123', 'Avenida 123', '+441234567890', 'sofia@example.com', 44);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('j1k2l3m4-n5o6-p7q8-r9s0-t1u2v3w4x5y', 'Diego Ramírez', 'diego123', 'Carrera 456', '+14155552671', 'diego@example.com', 1);

/*Insert into Pais*/
INSERT INTO pais (codigo_pais, nombre) VALUES (54, 'Argentina');
INSERT INTO pais (codigo_pais, nombre) VALUES (55, 'Brasil');
INSERT INTO pais (codigo_pais, nombre) VALUES (57, 'Colombia');
INSERT INTO pais (codigo_pais, nombre) VALUES (34, 'España');
INSERT INTO pais (codigo_pais, nombre) VALUES (1, 'Estados Unidos');
INSERT INTO pais (codigo_pais, nombre) VALUES (33, 'Francia');
INSERT INTO pais (codigo_pais, nombre) VALUES (39, 'Italia');
INSERT INTO pais (codigo_pais, nombre) VALUES (52, 'México');
INSERT INTO pais (codigo_pais, nombre) VALUES (44, 'Reino Unido');
INSERT INTO pais (codigo_pais, nombre) VALUES (49, 'Alemania');


/*Insert Cuenta bancaria*/
INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6', 'Banco X', '123456789', 54, 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('2b3c4d5e-6f7g-8h9i-0j1k-2l3m4n5o6p7', 'Banco Y', '987654321', 55, 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('3c4d5e6f-7g8h-9i0j-1k2l-3m4n5o6p7q8', 'Banco Z', '1122334455', 57, 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('4d5e6f7g-8h9i-0j1k-2l3m-4n5o6p7q8r9', 'Banco A', '9988776655', 34, 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('5e6f7g8h-9i0j-1k2l-3m4n-5o6p7q8r9s0', 'Banco B', '1122334459', 1, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('6f7g8h9i-0j1k-2l3m-4n5o-6p7q8r9s0t1', 'Banco C', '9988776605', 33, 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('7g8h9i0j-1k2l-3m4n-5o6p-7q8r9s0t1u2', 'Banco D', '9988706655', 39, 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('8h9i0j1k-2l3m-4n5o-6p7q-8r9s0t1u2v3', 'Banco E', '122334455', 52, 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('9i0j1k2l-3m4n-5o6p-7q8r-9s0t1u2v3w4', 'Banco F', '9988776695', 44, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

/* Inser into Productos*/
INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Teléfono móvil', 'Teléfono inteligente con pantalla táctil', 500, 'Samsung', 100);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Portátil', 'Ordenador portátil de última generación', 1200, 'Apple', 50);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Tableta', 'Tableta con pantalla HD y lápiz óptico', 300, 'Microsoft', 80);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Smartwatch', 'Reloj inteligente con seguimiento de actividad', 150, 'Fitbit', 200);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Auriculares inalámbricos', 'Auriculares con cancelación de ruido', 100, 'Sony', 150);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Televisor 4K', 'Televisor LED con resolución Ultra HD', 800, 'LG', 30);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Cámara digital', 'Cámara réflex digital con lente intercambiable', 700, 'Canon', 40);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Altavoz Bluetooth', 'Altavoz portátil con conectividad Bluetooth', 80, 'JBL', 120);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Consola de videojuegos', 'Consola de última generación con capacidad para juegos en línea', 400, 'Sony', 60);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Impresora multifunción', 'Impresora láser con escáner y copiadora', 250, 'HP', 90);

/*Insert into Historial*/

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Completado', 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Pendiente', 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Cancelado', 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('En tránsito', 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Entregado', 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Completado', 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Pendiente', 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Cancelado', 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('En tránsito', 'i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Entregado', 'j1k2l3m4-n5o6-p7q8-r9s0-t1u2v3w4x5y');

/*Insert into Pedidos*/
INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'efectivo', 1, 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('activo', 'Tarjeta', 2, 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('cancelado', 'efectivo', 3, 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'Tarjeta', 4, 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('activo', 'efectivo', 5, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'Tarjeta', 6, 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('cancelado', 'efectivo', 7, 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'Tarjeta', 8, 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('activo', 'efectivo', 9, 'i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'Tarjeta', 10, 'j1k2l3m4-n5o6-p7q8-r9s0-t1u2v3w4x5y');

/*Insert into calificaciones*/
INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (4, 1, 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (5, 2, 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (3, 3, 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (4, 4, 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (5, 5, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (4, 6, 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (3, 7, 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (5, 8, 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (4, 9, 'i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x');

/*Insert into Carrito*/
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'j1k2l3m4-n5o6-p7q8-r9s0-t1u2v3w4x5y');

/*Insert into Categoria*/
INSERT INTO categoria (nombre, descripcion) VALUES ('Electrónicos', 'Productos electrónicos de última generación.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Ropa', 'Ropa de moda para todas las edades y estilos.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Hogar y Jardín', 'Artículos para el hogar y decoración de jardines.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Belleza', 'Productos de belleza y cuidado personal.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Deportes y Aire Libre', 'Equipamiento deportivo y actividades al aire libre.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Libros', 'Libros de diversos géneros y autores.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Juguetes y Juegos', 'Juguetes y juegos para todas las edades.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Alimentación', 'Productos alimenticios y bebidas.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Electrodomésticos', 'Electrodomésticos para el hogar.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Automotriz', 'Productos y accesorios para automóviles y motocicletas.');

/*Insert into Categorias productos*/

INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (1, 1);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (2, 2);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (3, 3);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (4, 4);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (5, 5);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (6, 6);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (7, 7);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (8, 8);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (9, 9);

   /*Insert into*/
   
   /*Insert into Usuarios*/
INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p', 'Juan Pérez', 'clave_segura_123', 'Calle 123', '+5491234567890', 'juan@example.com', 54);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q', 'María García', 'segura123', 'Avenida 456', '+55119876543210', 'maria@example.com', 55);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r', 'Pedro López', '123456', 'Carrera 789', '+571122334455', 'pedro@example.com', 57);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('d1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s', 'Ana Martínez', 'password', 'Calle Principal 1', '+3491122334455', 'ana@example.com', 34);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t', 'Luisa Rodríguez', 'luisa123', 'Avenida Secundaria 2', '+14155552671', 'luisa@example.com', 1);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u', 'Carlos Gómez', 'carlos', 'Calle de la Paz', '+33123456789', 'carlos@example.com', 33);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v', 'Laura Hernández', 'laura123', 'Avenida del Sol', '+391234567890', 'laura@example.com', 39);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w', 'Miguel González', 'miguel123', 'Calle 789', '+521122334455', 'miguel@example.com', 52);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x', 'Sofía Sánchez', 'sofia123', 'Avenida 123', '+441234567890', 'sofia@example.com', 44);

INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, codigo_pais_fk)
VALUES ('j1k2l3m4-n5o6-p7q8-r9s0-t1u2v3w4x5y', 'Diego Ramírez', 'diego123', 'Carrera 456', '+14155552671', 'diego@example.com', 1);

/*Insert into Pais*/
INSERT INTO pais (codigo_pais, nombre) VALUES (54, 'Argentina');
INSERT INTO pais (codigo_pais, nombre) VALUES (55, 'Brasil');
INSERT INTO pais (codigo_pais, nombre) VALUES (57, 'Colombia');
INSERT INTO pais (codigo_pais, nombre) VALUES (34, 'España');
INSERT INTO pais (codigo_pais, nombre) VALUES (1, 'Estados Unidos');
INSERT INTO pais (codigo_pais, nombre) VALUES (33, 'Francia');
INSERT INTO pais (codigo_pais, nombre) VALUES (39, 'Italia');
INSERT INTO pais (codigo_pais, nombre) VALUES (52, 'México');
INSERT INTO pais (codigo_pais, nombre) VALUES (44, 'Reino Unido');
INSERT INTO pais (codigo_pais, nombre) VALUES (49, 'Alemania');


/*Insert Cuenta bancaria*/
INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('1a2b3c4d-5e6f-7g8h-9i0j-1k2l3m4n5o6', 'Banco X', '123456789', 54, 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('2b3c4d5e-6f7g-8h9i-0j1k-2l3m4n5o6p7', 'Banco Y', '987654321', 55, 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('3c4d5e6f-7g8h-9i0j-1k2l-3m4n5o6p7q8', 'Banco Z', '1122334455', 57, 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('4d5e6f7g-8h9i-0j1k-2l3m-4n5o6p7q8r9', 'Banco A', '9988776655', 34, 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('5e6f7g8h-9i0j-1k2l-3m4n-5o6p7q8r9s0', 'Banco B', '1122334459', 1, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('6f7g8h9i-0j1k-2l3m-4n5o-6p7q8r9s0t1', 'Banco C', '9988776605', 33, 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('7g8h9i0j-1k2l-3m4n-5o6p-7q8r9s0t1u2', 'Banco D', '9988706655', 39, 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('8h9i0j1k-2l3m-4n5o-6p7q-8r9s0t1u2v3', 'Banco E', '122334455', 52, 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk)
VALUES ('9i0j1k2l-3m4n-5o6p-7q8r-9s0t1u2v3w4', 'Banco F', '9988776695', 44, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

/* Inser into Productos*/
INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Teléfono móvil', 'Teléfono inteligente con pantalla táctil', 500, 'Samsung', 100);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Portátil', 'Ordenador portátil de última generación', 1200, 'Apple', 50);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Tableta', 'Tableta con pantalla HD y lápiz óptico', 300, 'Microsoft', 80);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Smartwatch', 'Reloj inteligente con seguimiento de actividad', 150, 'Fitbit', 200);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Auriculares inalámbricos', 'Auriculares con cancelación de ruido', 100, 'Sony', 150);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Televisor 4K', 'Televisor LED con resolución Ultra HD', 800, 'LG', 30);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Cámara digital', 'Cámara réflex digital con lente intercambiable', 700, 'Canon', 40);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Altavoz Bluetooth', 'Altavoz portátil con conectividad Bluetooth', 80, 'JBL', 120);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Consola de videojuegos', 'Consola de última generación con capacidad para juegos en línea', 400, 'Sony', 60);

INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) 
VALUES ('Impresora multifunción', 'Impresora láser con escáner y copiadora', 250, 'HP', 90);

/*Insert into Historial*/

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Completado', 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Pendiente', 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Cancelado', 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('En tránsito', 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Entregado', 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Completado', 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Pendiente', 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Cancelado', 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('En tránsito', 'i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x');

INSERT INTO historial (estado, id_usuario_fk) 
VALUES ('Entregado', 'j1k2l3m4-n5o6-p7q8-r9s0-t1u2v3w4x5y');

/*Insert into Pedidos*/
INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'efectivo', 1, 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('activo', 'Tarjeta', 2, 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('cancelado', 'efectivo', 3, 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'Tarjeta', 4, 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('activo', 'efectivo', 5, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'Tarjeta', 6, 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('cancelado', 'efectivo', 7, 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'Tarjeta', 8, 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('activo', 'efectivo', 9, 'i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) 
VALUES ('entregado', 'Tarjeta', 10, 'j1k2l3m4-n5o6-p7q8-r9s0-t1u2v3w4x5y');

/*Insert into calificaciones*/
INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (4, 1, 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (5, 2, 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (3, 3, 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (4, 4, 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (5, 5, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (4, 6, 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (3, 7, 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (5, 8, 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');

INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (4, 9, 'i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x');

/*Insert into Carrito*/
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (true, 'i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x');
INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, 'j1k2l3m4-n5o6-p7q8-r9s0-t1u2v3w4x5y');

/*Insert into Categoria*/
INSERT INTO categoria (nombre, descripcion) VALUES ('Electrónicos', 'Productos electrónicos de última generación.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Ropa', 'Ropa de moda para todas las edades y estilos.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Hogar y Jardín', 'Artículos para el hogar y decoración de jardines.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Belleza', 'Productos de belleza y cuidado personal.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Deportes y Aire Libre', 'Equipamiento deportivo y actividades al aire libre.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Libros', 'Libros de diversos géneros y autores.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Juguetes y Juegos', 'Juguetes y juegos para todas las edades.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Alimentación', 'Productos alimenticios y bebidas.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Electrodomésticos', 'Electrodomésticos para el hogar.');
INSERT INTO categoria (nombre, descripcion) VALUES ('Automotriz', 'Productos y accesorios para automóviles y motocicletas.');

/*Insert into Categorias productos*/

INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (1, 1);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (2, 2);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (3, 3);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (4, 4);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (5, 5);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (6, 6);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (7, 7);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (8, 8);
INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES (9, 9);

/* Insert into 	Comentarios */

INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES ('Excelente producto', 1, 'a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p');
INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES ('Muy satisfecho con la compra', 2, 'b1c2d3e4-f5g6-h7i8-j9k0-l1m2n3o4p5q');
INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES ('Buen producto, recomendado', 3, 'c1d2e3f4-g5h6-i7j8-k9l0-m1n2o3p4q5r');
INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES ('Cumple con las expectativas', 4, 'd1e2f3g4-h5i6-j7k8-l9m0-n1o2p3q4r5s');
INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES ('Me encanta este producto', 5, 'e1f2g3h4-i5j6-k7l8-m9n0-o1p2q3r4s5t');
INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES ('Producto de alta calidad', 6, 'f1g2h3i4-j5k6-l7m8-n9o0-p1q2r3s4t5u');
INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES ('Entrega rápida y eficiente', 7, 'g1h2i3j4-k5l6-m7n8-o9p0-q1r2s3t4u5v');
INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES ('Muy contento con la compra', 8, 'h1i2j3k4-l5m6-n7o8-p9q0-r1s2t3u4v5w');
INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES ('Recomendado al 100%', 9, 'i1j2k3l4-m5n6-o7p8-q9r0-s1t2u3v4w5x');

/*Insert into Lista_Productos*/
INSERT INTO lista_productos (id_productos_fk, id_pedidos_fk, id_carrito_fk, cantidad) VALUES (8, 3, 10, 5);
INSERT INTO lista_productos (id_productos_fk, id_pedidos_fk, id_carrito_fk, cantidad) VALUES (5, 7, 2, 4);
INSERT INTO lista_productos (id_productos_fk, id_pedidos_fk, id_carrito_fk, cantidad) VALUES (1, 8, 5, 2);
INSERT INTO lista_productos (id_productos_fk, id_pedidos_fk, id_carrito_fk, cantidad) VALUES (9, 2, 6, 1);
INSERT INTO lista_productos (id_productos_fk, id_pedidos_fk, id_carrito_fk, cantidad) VALUES (6, 5, 3, 3);
INSERT INTO lista_productos (id_productos_fk, id_pedidos_fk, id_carrito_fk, cantidad) VALUES (2, 4, 7, 1);
INSERT INTO lista_productos (id_productos_fk, id_pedidos_fk, id_carrito_fk, cantidad) VALUES (4, 6, 4, 4);
INSERT INTO lista_productos (id_productos_fk, id_pedidos_fk, id_carrito_fk, cantidad) VALUES (7, 10, 1, 3);