from fastapi import FastAPI, Depends, HTTPException, status
from pydantic import BaseModel
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker, Session
import os
from typing import List, Optional

DATABASE_URL = os.getenv("DATABASE_URL", "mysql://developer:santiagob0710@mariadb:3306/mercado_free")

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

app = FastAPI(title="Mercado Free DB API", description="API para la base de datos de Mercado Free", version="1.0")

class PaisModel(BaseModel):
    codigo_pais: int
    nombre: str

class UserLoginModel(BaseModel):
    email: str
    contrasena: str

class UserRegisterModel(BaseModel):
    nombre: str
    contrasena: str
    direccion: str
    telefono: str
    email: str
    codigo_pais_fk: int

class ProductFilterModel(BaseModel):
    keyword: Optional[str] = None
    categoria_id: Optional[int] = None
    fabricante: Optional[str] = None

class RatingFilterModel(BaseModel):
    min_rating: float

class ProductModel(BaseModel):
    nombre: str
    descripcion: str
    precio: float
    fabricante: str
    stock: int

class ProductUpdateModel(ProductModel):
    pass

class RatingModel(BaseModel):
    puntuacion: int
    id_producto: int
    id_usuario: str

class CommentModel(BaseModel):
    texto: str
    id_producto: int
    id_usuario: str

class CartModel(BaseModel):
    id_producto: int
    id_usuario: str

class CheckoutModel(BaseModel):
    id_carrito: int

class AdminApproveUserModel(BaseModel):
    id_usuarios: str

class AdminResetPasswordModel(BaseModel):
    email: str
    new_password: str

class CommentFilterModel(BaseModel):
    keyword: str




def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/")
def healthcheck():
    return {"status": "ok"}

@app.post("/login")
def login(user: UserLoginModel, db: Session = Depends(get_db)):
    result = db.execute(
        text("SELECT * FROM usuarios WHERE email = :email AND contrasena = :contrasena"),
        {"email": user.email, "contrasena": user.contrasena}
    ).fetchone()
    if not result:
        raise HTTPException(status_code=400, detail="Credenciales incorrectas")
    return {"message": "Inicio de sesión exitoso"}

@app.post("/register")
def register(user: UserRegisterModel, db: Session = Depends(get_db)):
    db.execute(
        text("INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, fecha_registro, email, estado, codigo_pais_fk) VALUES (UUID(), :nombre, :contrasena, :direccion, :telefono, CURRENT_TIMESTAMP, :email, 0, :codigo_pais_fk)"),
        {
            "nombre": user.nombre,
            "contrasena": user.contrasena,
            "direccion": user.direccion,
            "telefono": user.telefono,
            "email": user.email,
            "codigo_pais_fk": user.codigo_pais_fk
        }
    )
    db.commit()
    return {"message": "Usuario registrado exitosamente"}

@app.post("/productos/search")
def search_products(filter: ProductFilterModel, db: Session = Depends(get_db)):
    print(f"Received filter: {filter}")

    query = "SELECT * FROM productos WHERE 1=1"
    params = {}

    if filter.categoria_id is not None:
        query += " AND id_categoria_fk = :categoria_id"
        params["categoria_id"] = filter.categoria_id

    if filter.keyword:
        query += " AND (nombre LIKE :keyword OR descripcion LIKE :keyword)"
        params["keyword"] = f"%{filter.keyword}%"

    if filter.fabricante:
        query += " AND fabricante = :fabricante"
        params["fabricante"] = filter.fabricante

    try:
        print(f"Executing query: {query} with params: {params}")
        result = db.execute(text(query), params).fetchall()
        products = [dict(row._mapping) for row in result]
        return products

    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/productos/detalles")
def product_details(db: Session = Depends(get_db)):
    try:
        result = db.execute(
            text("SELECT p.*, AVG(c.puntuacion) AS rating FROM productos p LEFT JOIN calificaciones c ON p.id_productos = c.id_producto_fk GROUP BY p.id_productos")
        ).fetchall()
        products = [dict(row._mapping) for row in result]
        return products

    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/carrito/add")
def add_to_cart(cart: CartModel, db: Session = Depends(get_db)):
    try:
        existing_cart = db.execute(
            text("SELECT id_carrito FROM carrito WHERE id_usuario_fk = :id_usuario AND estado = false"),
            {"id_usuario": cart.id_usuario}
        ).fetchone()

        if existing_cart:
            carrito_id = existing_cart['id_carrito']
        else:
            db.execute(
                text("INSERT INTO carrito (estado, id_usuario_fk) VALUES (false, :id_usuario)"),
                {"id_usuario": cart.id_usuario}
            )
            db.commit()

            carrito_id = db.execute(text("SELECT LAST_INSERT_ID()")).fetchone()[0]

        db.execute(
            text("INSERT INTO lista_productos (id_productos, id_pedidos, cantidad) VALUES (:id_producto, :id_pedidos, 1)"),
            {"id_producto": cart.id_producto, "id_pedidos": carrito_id}
        )
        db.commit()

        return {"message": "Producto agregado al carrito"}
    except Exception as e:
        db.rollback()
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/carrito/checkout")
def checkout_cart(checkout: CheckoutModel, db: Session = Depends(get_db)):
    try:
        db.execute(
            text("UPDATE carrito SET estado = 1 WHERE id_carrito = :id_carrito"),
            {"id_carrito": checkout.id_carrito}
        )
        db.commit()
        return {"message": "Compra realizada"}
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/productos/admin/add")
def admin_add_product(product: ProductModel, db: Session = Depends(get_db)):
    try:
        db.execute(
            text("INSERT INTO productos (nombre, descripcion, precio, fabricante, stock, fecha_creacion) VALUES (:nombre, :descripcion, :precio, :fabricante, :stock, CURRENT_TIMESTAMP)"),
            {
                "nombre": product.nombre,
                "descripcion": product.descripcion,
                "precio": product.precio,
                "fabricante": product.fabricante,
                "stock": product.stock
            }
        )
        db.commit()
        return {"message": "Producto agregado"}
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.put("/productos/admin/update/{id_productos}")
def admin_update_product(id_productos: int, product: ProductUpdateModel, db: Session = Depends(get_db)):
    try:
        db.execute(
            text("UPDATE productos SET nombre = :nombre, descripcion = :descripcion, precio = :precio, fabricante = :fabricante, stock = :stock WHERE id_productos = :id_productos"),
            {
                "id_productos": id_productos,
                "nombre": product.nombre,
                "descripcion": product.descripcion,
                "precio": product.precio,
                "fabricante": product.fabricante,
                "stock": product.stock
            }
        )
        db.commit()
        return {"message": "Producto actualizado"}
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.delete("/productos/admin/delete/{id_productos}")
def admin_delete_product(id_productos: int, db: Session = Depends(get_db)):
    try:
        db.execute(
            text("DELETE FROM productos WHERE id_productos = :id_productos"),
            {"id_productos": id_productos}
        )
        db.commit()
        return {"message": "Producto eliminado"}
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.put("/usuarios/admin/approve")
def admin_approve_user(user: AdminApproveUserModel, db: Session = Depends(get_db)):
    try:
        db.execute(
            text("UPDATE usuarios SET estado = 1 WHERE id_usuarios = :id_usuarios"),
            {"id_usuarios": user.id_usuarios}
        )
        db.commit()
        return {"message": "Usuario aprobado"}
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.put("/usuarios/admin/reset-password")
def admin_reset_password(user: AdminResetPasswordModel, db: Session = Depends(get_db)):
    try:
        user_exists = db.execute(
            text("SELECT * FROM usuarios WHERE email = :email"),
            {"email": user.email}
        ).fetchone()
        
        if not user_exists:
            raise HTTPException(status_code=404, detail="Usuario no encontrado")

        db.execute(
            text("UPDATE usuarios SET contrasena = :new_password WHERE email = :email"),
            {"email": user.email, "new_password": user.new_password}
        )
        db.commit()
        return {"message": "Contraseña actualizada"}
    except Exception as e:
        db.rollback()
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/informes/ventas")
def sales_report(db: Session = Depends(get_db)):
    try:
        result = db.execute(
            text("SELECT p.nombre, SUM(lp.cantidad) AS cantidad_vendida, SUM(p.precio * lp.cantidad) AS total_vendido FROM pedidos pe JOIN lista_productos lp ON pe.id_pedidos = lp.id_pedidos JOIN productos p ON lp.id_productos = p.id_productos WHERE pe.estado = 1 GROUP BY p.nombre")
        ).fetchall()
        sales_data = [dict(row._mapping) for row in result]
        return sales_data
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor")


@app.get("/informes/rendimiento")
def performance_metrics(db: Session = Depends(get_db)):
    try:
        result = db.execute(
            text("SELECT estado, COUNT(*) AS cantidad FROM pedidos GROUP BY estado")
        ).fetchall()
        performance_data = [dict(row._mapping) for row in result]
        return performance_data
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor")


@app.get("/informes/inventario")
def inventory_data(db: Session = Depends(get_db)):
    try:
        result = db.execute(
            text("SELECT nombre, stock FROM productos")
        ).fetchall()
        inventory_data = [dict(row._mapping) for row in result]
        return inventory_data
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor")


@app.post("/productos/calificaciones")
def add_rating(rating: RatingModel, db: Session = Depends(get_db)):
    db.execute(
        text("INSERT INTO calificaciones (puntuacion, id_producto_fk, id_usuario_fk) VALUES (:puntuacion, :id_producto, :id_usuario)"),
        {
            "puntuacion": rating.puntuacion,
            "id_producto": rating.id_producto,
            "id_usuario": rating.id_usuario
        }
    )
    db.commit()
    return {"message": "Calificación agregada"}

@app.post("/productos/comentarios")
def add_comment(comment: CommentModel, db: Session = Depends(get_db)):
    db.execute(
        text("INSERT INTO comentarios (texto, id_producto_fk, id_usuario_fk) VALUES (:texto, :id_producto, :id_usuario)"),
        {
            "texto": comment.texto,
            "id_producto": comment.id_producto,
            "id_usuario": comment.id_usuario
        }
    )
    db.commit()
    return {"message": "Comentario agregado"}

@app.post("/productos/calificaciones/filter")
def filter_by_rating(filter: RatingFilterModel, db: Session = Depends(get_db)):
    try:
        result = db.execute(
            text("""
                SELECT p.id_productos, p.nombre, p.precio, p.fabricante, AVG(cal.puntuacion) AS promedio_puntuacion
                FROM productos AS p
                JOIN calificaciones AS cal
                    ON cal.id_producto_fk = p.id_productos
                GROUP BY p.id_productos, p.nombre, p.precio, p.fabricante
                HAVING AVG(cal.puntuacion) >= :min_rating
            """),
            {"min_rating": filter.min_rating}
        ).fetchall()
        
        filtered_products = [dict(row._mapping) for row in result]
        return filtered_products
    except Exception as e:
        db.rollback()
        print(f"Error en filtro de calificaciones: {str(e)}")
        raise HTTPException(status_code=500, detail=f"Error interno del servidor: {str(e)}")
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/productos/comentarios/filter")
def filter_comments(filter: CommentFilterModel, db: Session = Depends(get_db)):
    try:
        result = db.execute(
            text("""
                SELECT p.id_productos, p.nombre, p.descripcion, p.fabricante, c.texto, c.fecha_creacion_comentario, u.id_usuarios, u.email as email_usuario
                FROM productos p
                JOIN comentarios c ON p.id_productos = c.id_producto_fk
                JOIN usuarios u ON u.id_usuarios = c.id_usuario_fk
                WHERE c.texto LIKE :keyword
            """),
            {"keyword": f"%{filter.keyword}%"}
        ).fetchall()
        
        filtered_comments = [dict(row._mapping) for row in result]
        return filtered_comments
    except Exception as e:
        db.rollback()
        print(f"Error en filtro de comentarios: {str(e)}")
        raise HTTPException(status_code=500, detail=f"Error interno del servidor: {str(e)}")

@app.get("/informes/ventas/fabricantes")
def sales_manufacturers_data(db: Session = Depends(get_db)):
    try:
        result = db.execute(
            text("""
                SELECT DATE(p.fecha_pedido) AS fecha, 
                       prod.fabricante,
                       COUNT(*) AS total_ventas, 
                       SUM(prod.precio * lp.cantidad) AS total_ingresos
                FROM pedidos p
                JOIN lista_productos lp ON p.id_pedidos = lp.id_pedidos
                JOIN productos prod ON lp.id_productos = prod.id_productos
                GROUP BY DATE(p.fecha_pedido), prod.fabricante
                ORDER BY fecha, prod.fabricante
            """)
        ).fetchall()
        sales_data = [dict(row._mapping) for row in result]
        return sales_data
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor")