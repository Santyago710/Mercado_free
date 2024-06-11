
/*-----------------------------------Insercion de datos--------------------------------------------------------------------------*/

-- Paso 1: Insertar datos en la tabla 'pais'
INSERT INTO pais (codigo_pais, nombre) VALUES 
(1, 'Argentina'), (2, 'Brasil'), (3, 'Chile'), 
(4, 'México'), (5, 'Colombia'), (6, 'Perú'), 
(7, 'Uruguay'), (8, 'Paraguay'), (9, 'Bolivia'), 
(10, 'Venezuela'), (11, 'Ecuador'), (12, 'Costa Rica'), 
(13, 'Panamá'), (14, 'Guatemala');

-- Paso 2: Insertar datos en la tabla 'usuarios'
INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, email, estado, codigo_pais_fk) VALUES 
('550e8400-e29b-41d4-a716-446655440000', 'Usuario1', 'pass1', 'Dir1', '123456789', 'usuario1@example.com', 1, 1),
('550e8400-e29b-41d4-a716-446655440001', 'Usuario2', 'pass2', 'Dir2', '987654321', 'usuario2@example.com', 1, 2),
('550e8400-e29b-41d4-a716-446655440002', 'Usuario3', 'pass3', 'Dir3', '1122334455', 'usuario3@example.com', 1, 3),
('550e8400-e29b-41d4-a716-446655440003', 'Usuario4', 'pass4', 'Dir4', '5566778899', 'usuario4@example.com', 1, 4),
('550e8400-e29b-41d4-a716-446655440004', 'Usuario5', 'pass5', 'Dir5', '6677889900', 'usuario5@example.com', 1, 5),
('550e8400-e29b-41d4-a716-446655440005', 'Usuario6', 'pass6', 'Dir6', '7788990011', 'usuario6@example.com', 1, 6),
('550e8400-e29b-41d4-a716-446655440006', 'Usuario7', 'pass7', 'Dir7', '8899001122', 'usuario7@example.com', 1, 7),
('550e8400-e29b-41d4-a716-446655440007', 'Usuario8', 'pass8', 'Dir8', '9900112233', 'usuario8@example.com', 1, 8),
('550e8400-e29b-41d4-a716-446655440008', 'Usuario9', 'pass9', 'Dir9', '0011223344', 'usuario9@example.com', 1, 9),
('550e8400-e29b-41d4-a716-446655440009', 'Usuario10', 'pass10', 'Dir10', '1122334466', 'usuario10@example.com', 1, 10),
('550e8400-e29b-41d4-a716-446655440010', 'Usuario11', 'pass11', 'Dir11', '2233445566', 'usuario11@example.com', 1, 11),
('550e8400-e29b-41d4-a716-446655440011', 'Usuario12', 'pass12', 'Dir12', '3344556677', 'usuario12@example.com', 1, 12),
('550e8400-e29b-41d4-a716-446655440012', 'Usuario13', 'pass13', 'Dir13', '4455667788', 'usuario13@example.com', 1, 13),
('550e8400-e29b-41d4-a716-446655440013', 'Usuario14', 'pass14', 'Dir14', '5566778899', 'usuario14@example.com', 1, 14);

-- Paso 3: Insertar datos en la tabla 'productos'
INSERT INTO productos (nombre, descripcion, precio, fabricante, stock) VALUES 
('Producto1', 'Desc1', 100, 'Fab1', 10), ('Producto2', 'Desc2', 200, 'Fab2', 20),
('Producto3', 'Desc3', 300, 'Fab3', 30), ('Producto4', 'Desc4', 400, 'Fab4', 40),
('Producto5', 'Desc5', 500, 'Fab5', 50), ('Producto6', 'Desc6', 600, 'Fab6', 60),
('Producto7', 'Desc7', 700, 'Fab7', 70), ('Producto8', 'Desc8', 800, 'Fab8', 80),
('Producto9', 'Desc9', 900, 'Fab9', 90), ('Producto10', 'Desc10', 1000, 'Fab10', 100),
('Producto11', 'Desc11', 1100, 'Fab11', 110), ('Producto12', 'Desc12', 1200, 'Fab12', 120),
('Producto13', 'Desc13', 1300, 'Fab13', 130), ('Producto14', 'Desc14', 1400, 'Fab14', 140);

-- Paso 4: Insertar datos en la tabla 'calificaciones'
INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk) VALUES 
(5, 1, '550e8400-e29b-41d4-a716-446655440000'), (4, 2, '550e8400-e29b-41d4-a716-446655440001'), 
(3, 3, '550e8400-e29b-41d4-a716-446655440002'), (2, 4, '550e8400-e29b-41d4-a716-446655440003'), 
(1, 5, '550e8400-e29b-41d4-a716-446655440004'), (5, 6, '550e8400-e29b-41d4-a716-446655440005'), 
(4, 7, '550e8400-e29b-41d4-a716-446655440006'), (3, 8, '550e8400-e29b-41d4-a716-446655440007'), 
(2, 9, '550e8400-e29b-41d4-a716-446655440008'), (1, 10, '550e8400-e29b-41d4-a716-446655440009'), 
(5, 11, '550e8400-e29b-41d4-a716-446655440010'), (4, 12, '550e8400-e29b-41d4-a716-446655440011'), 
(3, 13, '550e8400-e29b-41d4-a716-446655440012'), (2, 14, '550e8400-e29b-41d4-a716-446655440013');


INSERT INTO carrito (estado, id_usuario_fk) VALUES 
(false, '550e8400-e29b-41d4-a716-446655440000'), (false, '550e8400-e29b-41d4-a716-446655440001'), 
(false, '550e8400-e29b-41d4-a716-446655440002'), (false, '550e8400-e29b-41d4-a716-446655440003'), 
(false, '550e8400-e29b-41d4-a716-446655440004'), (false, '550e8400-e29b-41d4-a716-446655440005'), 
(false, '550e8400-e29b-41d4-a716-446655440006'), (false, '550e8400-e29b-41d4-a716-446655440007'), 
(false, '550e8400-e29b-41d4-a716-446655440008'), (false, '550e8400-e29b-41d4-a716-446655440009'), 
(false, '550e8400-e29b-41d4-a716-446655440010'), (false, '550e8400-e29b-41d4-a716-446655440011'), 
(false, '550e8400-e29b-41d4-a716-446655440012'), (false, '550e8400-e29b-41d4-a716-446655440013');

INSERT INTO categoria (nombre, descripcion) VALUES 
('Categoria1', 'Descripcion1'), ('Categoria2', 'Descripcion2'), ('Categoria3', 'Descripcion3'), 
('Categoria4', 'Descripcion4'), ('Categoria5', 'Descripcion5'), ('Categoria6', 'Descripcion6'), 
('Categoria7', 'Descripcion7'), ('Categoria8', 'Descripcion8'), ('Categoria9', 'Descripcion9'), 
('Categoria10', 'Descripcion10'), ('Categoria11', 'Descripcion11'), ('Categoria12', 'Descripcion12'), 
('Categoria13', 'Descripcion13'), ('Categoria14', 'Descripcion14');

INSERT INTO categorias_productos (id_productos_fk, id_categoria_fk) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), 
(9, 9), (10, 10), (11, 11), (12, 12), (13, 13), (14, 14);

INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES 
('Comentario1', 1, '550e8400-e29b-41d4-a716-446655440000'), 
('Comentario2', 2, '550e8400-e29b-41d4-a716-446655440001'), 
('Comentario3', 3, '550e8400-e29b-41d4-a716-446655440002'), 
('Comentario4', 4, '550e8400-e29b-41d4-a716-446655440003'), 
('Comentario5', 5, '550e8400-e29b-41d4-a716-446655440004'), 
('Comentario6', 6, '550e8400-e29b-41d4-a716-446655440005'), 
('Comentario7', 7, '550e8400-e29b-41d4-a716-446655440006'), 
('Comentario8', 8, '550e8400-e29b-41d4-a716-446655440007'), 
('Comentario9', 9, '550e8400-e29b-41d4-a716-446655440008'), 
('Comentario10', 10, '550e8400-e29b-41d4-a716-446655440009'), 
('Comentario11', 11, '550e8400-e29b-41d4-a716-446655440010'), 
('Comentario12', 12, '550e8400-e29b-41d4-a716-446655440011'), 
('Comentario13', 13, '550e8400-e29b-41d4-a716-446655440012'), 
('Comentario14', 14, '550e8400-e29b-41d4-a716-446655440013');

INSERT INTO historial (estado, id_usuario_fk) VALUES 
('Estado1', '550e8400-e29b-41d4-a716-446655440000'), 
('Estado2', '550e8400-e29b-41d4-a716-446655440001'), 
('Estado3', '550e8400-e29b-41d4-a716-446655440002'), 
('Estado4', '550e8400-e29b-41d4-a716-446655440003'), 
('Estado5', '550e8400-e29b-41d4-a716-446655440004'), 
('Estado6', '550e8400-e29b-41d4-a716-446655440005'), 
('Estado7', '550e8400-e29b-41d4-a716-446655440006'), 
('Estado8', '550e8400-e29b-41d4-a716-446655440007'), 
('Estado9', '550e8400-e29b-41d4-a716-446655440008'), 
('Estado10', '550e8400-e29b-41d4-a716-446655440009'), 
('Estado11', '550e8400-e29b-41d4-a716-446655440010'), 
('Estado12', '550e8400-e29b-41d4-a716-446655440011'), 
('Estado13', '550e8400-e29b-41d4-a716-446655440012'), 
('Estado14', '550e8400-e29b-41d4-a716-446655440013');

INSERT INTO pedidos (estado, metodo_pago, id_historial_fk, id_usuario_fk) VALUES 
('Pendiente', 'Tarjeta', 1, '550e8400-e29b-41d4-a716-446655440000'), 
('Completado', 'PayPal', 2, '550e8400-e29b-41d4-a716-446655440001'), 
('Cancelado', 'Efectivo', 3, '550e8400-e29b-41d4-a716-446655440002'), 
('Pendiente', 'Tarjeta', 4, '550e8400-e29b-41d4-a716-446655440003'), 
('Completado', 'PayPal', 5, '550e8400-e29b-41d4-a716-446655440004'), 
('Cancelado', 'Efectivo', 6, '550e8400-e29b-41d4-a716-446655440005'), 
('Pendiente', 'Tarjeta', 7, '550e8400-e29b-41d4-a716-446655440006'), 
('Completado', 'PayPal', 8, '550e8400-e29b-41d4-a716-446655440007'), 
('Cancelado', 'Efectivo', 9, '550e8400-e29b-41d4-a716-446655440008'), 
('Pendiente', 'Tarjeta', 10, '550e8400-e29b-41d4-a716-446655440009'), 
('Completado', 'PayPal', 11, '550e8400-e29b-41d4-a716-446655440010'), 
('Cancelado', 'Efectivo', 12, '550e8400-e29b-41d4-a716-446655440011'), 
('Pendiente', 'Tarjeta', 13, '550e8400-e29b-41d4-a716-446655440012'), 
('Completado', 'PayPal', 14, '550e8400-e29b-41d4-a716-446655440013');

INSERT INTO lista_productos (id_productos_fk, id_pedidos_fk, id_carrito_fk, cantidad) VALUES 
(1, 1, 1, 2), (2, 2, 2, 3), (3, 3, 3, 4), (4, 4, 4, 5), (5, 5, 5, 6), 
(6, 6, 6, 7), (7, 7, 7, 8), (8, 8, 8, 9), (9, 9, 9, 10), (10, 10, 10, 11), 
(11, 11, 11, 12), (12, 12, 12, 13), (13, 13, 13, 14), (14, 14, 14, 1);

INSERT INTO cuenta_bancaria (id_cuenta, nombre_banco, Numero_cuenta, codigo_pais_fk, id_usuario_fk) VALUES 
('650e8400-e29b-41d4-a716-446655440000', 'Banco1', '1234567890', 1, '550e8400-e29b-41d4-a716-446655440000'), 
('650e8400-e29b-41d4-a716-446655440001', 'Banco2', '0987654321', 2, '550e8400-e29b-41d4-a716-446655440001'), 
('650e8400-e29b-41d4-a716-446655440002', 'Banco3', '1122334455', 3, '550e8400-e29b-41d4-a716-446655440002'), 
('650e8400-e29b-41d4-a716-446655440003', 'Banco4', '5566778899', 4, '550e8400-e29b-41d4-a716-446655440003'), 
('650e8400-e29b-41d4-a716-446655440004', 'Banco5', '6677889900', 5, '550e8400-e29b-41d4-a716-446655440004'), 
('650e8400-e29b-41d4-a716-446655440005', 'Banco6', '7788990011', 6, '550e8400-e29b-41d4-a716-446655440005'), 
('650e8400-e29b-41d4-a716-446655440006', 'Banco7', '8899001122', 7, '550e8400-e29b-41d4-a716-446655440006'), 
('650e8400-e29b-41d4-a716-446655440007', 'Banco8', '9900112233', 8, '550e8400-e29b-41d4-a716-446655440007'), 
('650e8400-e29b-41d4-a716-446655440008', 'Banco9', '0011223344', 9, '550e8400-e29b-41d4-a716-446655440008'), 
('650e8400-e29b-41d4-a716-446655440009', 'Banco10', '1122334466', 10, '550e8400-e29b-41d4-a716-446655440009'), 
('650e8400-e29b-41d4-a716-446655440010', 'Banco11', '2233445566', 11, '550e8400-e29b-41d4-a716-446655440010'), 
('650e8400-e29b-41d4-a716-446655440011', 'Banco12', '3344556677', 12, '550e8400-e29b-41d4-a716-446655440011'), 
('650e8400-e29b-41d4-a716-446655440012', 'Banco13', '4455667788', 13, '550e8400-e29b-41d4-a716-446655440012'), 
('650e8400-e29b-41d4-a716-446655440013', 'Banco14', '55667788992', 14, '550e8400-e29b-41d4-a716-446655440013');
