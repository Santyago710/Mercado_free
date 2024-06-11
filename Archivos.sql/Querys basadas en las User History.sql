/* Iniciar sesión (Login)*/
SELECT * FROM usuarios 
WHERE email = 'user@example.com' AND contrasena = 'hashed_password';

/* REGISTRAR NUEVO USUARIO */
INSERT INTO usuarios (
    id_usuarios, nombre, contrasena, direccion, telefono, fecha_registro, email, estado, codigo_pais_fk
) VALUES (
    UUID(), 'Nombre del Usuario', 'hashed_password', 'Dirección del Usuario', '123456789', CURRENT_TIMESTAMP, 'usuario@correo.com', 0, 1
);

/* Búsqueda de productos */ 

    /* Por categoria */
SELECT p.* FROM productos p
JOIN categorias_productos cp ON p.id_productos = cp.id_productos_fk
WHERE cp.id_categoria_fk = 1;

    /* Por palabra clave */
SELECT * FROM productos 
WHERE nombre LIKE '%keyword%' OR descripcion LIKE '%keyword%';

    /* Por características específicas (ejemplo por fabricante) */
SELECT * FROM productos 
WHERE fabricante = 'Nombre del Fabricante';

/* Lista de productos con detalles */
SELECT p.*, AVG(c.puntuacion) AS rating FROM productos p
LEFT JOIN calificaciones c ON p.id_productos = c.id_producto_fk
GROUP BY p.id_productos;

/* Agregar productos al carrito y proceder al pago */

    /* Agregar producto al carrito */
INSERT INTO carrito (estado, id_usuario_fk)
VALUES (false, 'uuid_del_usuario');

INSERT INTO lista_productos (id_productos_fk, id_carrito_fk, cantidad)
VALUES (1, LAST_INSERT_ID(), 1);

    /* Proceder al pago */
UPDATE carrito SET estado = 1 
WHERE id_carrito = 5;

/* Administrador: CRUD de productos */
INSERT INTO productos (nombre, descripcion, precio, fabricante, stock, fecha_creacion)
VALUES ('Nombre del Producto', 'Descripción del Producto', 100, 'Fabricante del Producto', 50, CURRENT_TIMESTAMP);

    /* Editar un producto */
UPDATE productos 
SET nombre = 'Nuevo Nombre', descripcion = 'Nueva Descripción', precio = 200, fabricante = 'Nuevo Fabricante', stock = 100
WHERE id_productos = 1;

    /* Borrar un producto */
DELETE FROM productos 
WHERE id_productos = 1;

/* Administrador: Gestión de cuentas de usuario */

    /* Aprobar usuario */
UPDATE usuarios 
SET estado = 1 
WHERE id_usuarios = 'uuid_del_usuario';

    /* Reestablecer contraseña */
UPDATE usuarios 
SET contrasena = 'nueva_contraseña_hash'
WHERE email = 'usuario@correo.com';

    /* Gestionar permisos */
UPDATE usuarios 
SET estado = 1 
WHERE id_usuarios = 'uuid_del_usuario';

/* Ver informes de ventas, métricas de rendimiento e inventario */

    /* Informes de ventas */
SELECT p.nombre, SUM(lp.cantidad) AS cantidad_vendida, SUM(p.precio * lp.cantidad) AS total_vendido
FROM pedidos pe
JOIN lista_productos lp ON pe.id_pedidos = lp.id_pedidos_fk
JOIN productos p ON lp.id_productos_fk = p.id_productos
WHERE pe.estado = 1
GROUP BY p.nombre;

    /* Métricas de rendimiento */
SELECT estado, COUNT(*) AS cantidad
FROM pedidos
GROUP BY estado;

    /* Datos de inventario */
SELECT nombre, stock 
FROM productos;

/* Dejar comentarios y puntuaciones en productos */
INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk)
VALUES (5, 1, 'uuid_del_usuario');

INSERT INTO comentarios (texto, fecha_creacion_comentario, id_producto_fk, id_usuario_fk)
VALUES ('Excelente producto', CURRENT_TIMESTAMP, 1, 'uuid_del_usuario');
