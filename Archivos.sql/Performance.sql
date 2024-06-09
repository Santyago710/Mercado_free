/*----------------------------------------------PERFORMANCE-----------------------------------------------------------------------------------*/

/*creacion index*/
Create index Nombre_producto on productos(nombre);
create index Nombre_pais on pais(nombre);
create index Nombre_fabricante on productos(fabricante);
create index Nombre_categoria on categoria(nombre);
Create index Nombre_usuario on usuarios(nombre);

/*creacion triggers*/

CREATE TRIGGER Verificar_puntuacion
BEFORE INSERT ON calificaciones
FOR EACH ROW
BEGIN
    IF NEW.puntuacion < 0 OR NEW.puntuacion > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La puntuación debe estar entre 0 y 5';
    END IF;
END;

CREATE TRIGGER after_insert_carrito
AFTER INSERT ON carrito
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha_historial, estado, id_usuario_fk)
    VALUES (CURRENT_TIMESTAMP, 'Carrito creado', NEW.id_usuario_fk);
END;

CREATE TRIGGER after_delete_categorias_productos
AFTER DELETE ON categorias_productos
FOR EACH ROW
BEGIN
    UPDATE categoria
    SET cantidad_productos = cantidad_productos - 1
    WHERE id_categoria = OLD.id_categoria_fk;
END;


CREATE TRIGGER before_update_pedidos
BEFORE UPDATE ON pedidos
FOR EACH ROW
BEGIN
    IF NEW.estado NOT IN ('pendiente', 'enviado', 'entregado', 'cancelado') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Estado del pedido no válido';
    END IF;
END;

CREATE TRIGGER after_insert_comentarios
AFTER INSERT ON comentarios
FOR EACH ROW
BEGIN
    INSERT INTO historial (fecha_historial, estado, id_usuario_fk)
    VALUES (CURRENT_TIMESTAMP, 'Comentario agregado', NEW.id_usuario_fk);
END;

/* Creacion procedures*/

/*  Procedimiento para agregar un nuevo producto */
CREATE PROCEDURE AgregarProducto(
    IN p_nombre VARCHAR(50),
    IN p_descripcion VARCHAR(100),
    IN p_precio INT,
    IN p_fabricante VARCHAR(60),
    IN p_stock INT
)
BEGIN
    INSERT INTO productos (nombre, descripcion, precio, fabricante, stock, fecha_creacion)
    VALUES (p_nombre, p_descripcion, p_precio, p_fabricante, p_stock, CURRENT_TIMESTAMP);
END;

/* Procedimiento para actualizar el estado de un pedido*/ 

CREATE PROCEDURE ActualizarEstadoPedido(
    IN p_id_pedido INT,
    IN p_nuevo_estado VARCHAR(50)
)
BEGIN
    UPDATE pedidos
    SET estado = p_nuevo_estado
    WHERE id_pedidos = p_id_pedido;
END;

/* Procedimiento para obtener productos por categoría */

CREATE PROCEDURE ObtenerProductosPorCategoria(
    IN p_id_categoria INT
)
BEGIN
    SELECT p.*
    FROM productos p
    JOIN categorias_productos cp ON p.id_productos = cp.id_productos_fk
    WHERE cp.id_categoria_fk = p_id_categoria;
END;

/* Procedimiento para obtener información de un usuario por su ID*/ 

CREATE PROCEDURE ObtenerUsuarioPorID(
    IN p_id_usuario CHAR(36)
)
BEGIN
    SELECT * FROM usuarios WHERE id_usuarios = p_id_usuario;
END;

/* Procedimiento para obtener todos los productos de un fabricante específico */

CREATE PROCEDURE ObtenerProductosPorFabricante(
    IN p_fabricante VARCHAR(60)
)
BEGIN
    SELECT * FROM productos WHERE fabricante = p_fabricante;
END;

/*   Procedimiento para actualizar el stock de un producto 	*/
CREATE PROCEDURE ActualizarStockProducto(
    IN p_id_producto INT,
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE productos
    SET stock = p_nuevo_stock
    WHERE id_productos = p_id_producto;
END;

/* Procedimiento para obtener el historial de un usuario */
CREATE PROCEDURE ObtenerHistorialPorUsuario(
    IN p_id_usuario CHAR(36)
)
BEGIN
    SELECT * FROM historial WHERE id_usuario_fk = p_id_usuario;
END;


/*Creacion de vistas*/

/* Vista de Productos con Detalles y Puntuación Promedio*/
CREATE VIEW vista_productos_detalle AS
SELECT 
    productos.id_productos,
    productos.nombre,
    productos.descripcion,
    productos.precio,
    productos.fabricante,
    productos.stock,
    productos.fecha_creacion,
    AVG(calificaciones.puntuacion) AS puntuacion_promedio,
    COUNT(comentarios.id_comentarios) AS cantidad_comentarios
FROM 
    productos 
LEFT JOIN 
    calificaciones ON productos.id_productos = calificaciones.id_producto_fk
LEFT JOIN 
    comentarios  ON productos.id_productos = comentarios.id_producto_fk
GROUP BY 
    productos.id_productos;

/* Vista de Carrito*/
CREATE VIEW vista_carrito AS
SELECT 
    c.id_carrito,
    c.Fecha_carrito,
    c.estado,
    u.nombre AS usuario,
    p.nombre AS producto,
    lp.id_lista_productos
FROM 
    carrito c
JOIN 
    usuarios u ON c.id_usuario_fk = u.id_usuarios
JOIN 
    lista_productos lp ON c.id_carrito = lp.id_carrito_fk
JOIN 
    productos p ON lp.id_productos = p.id_productos
WHERE 
    c.estado = 0;

/* Vista de Pedidos con Historial */
CREATE VIEW vista_pedidos_historial AS
SELECT 
    pe.id_pedidos,
    pe.fecha_pedido,
    pe.estado,
    pe.metodo_pago,
    u.nombre AS usuario,
    h.fecha_historial,
    h.estado AS estado_historial
FROM 
    pedidos pe
JOIN 
    usuarios u ON pe.id_usuario_fk = u.id_usuarios
JOIN 
    historial h ON pe.id_historial_fk = h.id_historial;

/*Vista de Ventas Totales por Producto*/
   
   CREATE VIEW vista_ventas_totales_por_producto AS
SELECT 
    p.id_productos,
    p.nombre,
    SUM(lp.cantidad) AS cantidad_vendida,
    SUM(p.precio * lp.cantidad) AS total_vendido
FROM 
    pedidos pe
JOIN 
    lista_productos lp ON pe.id_pedidos = lp.id_pedidos
JOIN 
    productos p ON lp.id_productos = p.id_productos
WHERE 
    pe.estado = 'entregado'
GROUP BY 
    p.id_productos;
   
   

