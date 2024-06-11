from fastapi import FastAPI, Depends, HTTPException
from pydantic import BaseModel
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker, Session
from typing import Optional
from sqlalchemy.exc import SQLAlchemyError
# Configuración de la base de datos
SQLALCHEMY_DATABASE_URL = "mysql://root:1qaw3edr5*@localhost:3307/mercado_free"
engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Dependencia para obtener la sesión de la base de datos
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Definición de la clase Pydantic para los datos de la solicitud
class LoginRequest(BaseModel):
    email: str
    contrasena: str


class PaisModel(BaseModel):
    codigo_pais: int
    nombre: str


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

class ProductModel(BaseModel):
    nombre: str
    descripcion: str
    precio: float
    fabricante: str
    stock: int

class RatingFilterModel(BaseModel):
    min_rating: float

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

class DeleteRequestModel(BaseModel):
    keyword: str
    category: str

class CommentDelete(BaseModel):
    product_id: int
    user_id: str

app = FastAPI(title="Mercado free DB", description="This is a Database of mercado libre app using a Api", version="0.2")

@app.get("/")
async def healthcheck():
    """This is a service to validate web API is up and running."""
    return {"status": "ok"}

@app.post("/login")
def login(login_request: LoginRequest):
    # Consulta SQL para buscar el usuario por su correo electrónico y contraseña
    query = text(
        "SELECT * FROM usuarios "
        "WHERE email = :email AND contrasena = :contrasena"
    )

    # Crear una conexión a la base de datos
    with engine.connect() as connection:
        # Ejecutar la consulta y obtener los resultados
        results = connection.execute(
            query,
            {"email": login_request.email, "contrasena": login_request.contrasena}
        ).fetchall()

    # Verificar si se encontraron resultados
    if len(results) == 0:
        # Si no se encontraron resultados, devolver un error 404
        raise HTTPException(status_code=404, detail="Usuario no encontrado")
    
    # Crear un diccionario con los datos del primer usuario encontrado
    user_data = {
        "id_usuarios": results[0][0],
        "nombre": results[0][1],
        "contrasena": results[0][2],
        "direccion": results[0][3],
        "telefono": results[0][4],
        "fecha_registro": results[0][5],
        "email": results[0][6],
        "estado": results[0][7],
        "codigo_pais_fk": results[0][8]
    }

    # Devolver los datos del usuario
    return {"usuario": user_data}

@app.post("/register/")
def register(user: UserRegisterModel):
    # Consulta SQL para insertar un nuevo usuario
    query = text(
        "INSERT INTO usuarios (id_usuarios, nombre, contrasena, direccion, telefono, fecha_registro, email, estado, codigo_pais_fk) "
        "VALUES (UUID(), :nombre, :contrasena, :direccion, :telefono, CURRENT_TIMESTAMP, :email, 0, :codigo_pais_fk)"
    )

    # Crear una conexión a la base de datos
    with engine.connect() as connection:
        # Ejecutar la consulta
        connection.execute(
            query,
            {
                "nombre": user.nombre,
                "contrasena": user.contrasena,
                "direccion": user.direccion,
                "telefono": user.telefono,
                "email": user.email,
                "codigo_pais_fk": user.codigo_pais_fk
            }
        )
        connection.commit()

    # Devolver un mensaje de éxito
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
    # Consulta SQL para obtener los detalles de los productos con el rating promedio
    query = text(
        "SELECT p.*, AVG(c.puntuacion) AS rating FROM productos p LEFT JOIN calificaciones c ON p.id_productos = c.id_producto_fk GROUP BY p.id_productos"
    )

    # Crear una conexión a la base de datos
    with engine.connect() as connection:
        try:
            # Ejecutar la consulta y obtener los resultados
            result = connection.execute(query).fetchall()
            products = [dict(row._mapping) for row in result]

        except Exception as e:
            print(f"An error occurred: {str(e)}")
            # Si ocurre un error, devolver un error 500
            raise HTTPException(status_code=500, detail=str(e))

    # Devolver los detalles de los productos
    return products


@app.post("/carrito/checkout")
def checkout_cart(checkout: CheckoutModel, db: Session = Depends(get_db)):
    try:
        query = text("UPDATE carrito SET estado = 1 WHERE id_carrito = :id_carrito")
        db.execute(query, {"id_carrito": checkout.id_carrito})
        db.commit()
        return {"message": "Compra realizada"}
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/productos/admin/add")
def admin_add_product(product: ProductModel, db: Session = Depends(get_db)):
    try:
        with engine.connect() as connection:
            # Insertar un nuevo producto en la tabla productos
            connection.execute(
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
        # Construir la consulta de actualización
        update_query = (
            "UPDATE productos SET "
            "nombre = :nombre, descripcion = :descripcion, "
            "precio = :precio, fabricante = :fabricante, "
            "stock = :stock WHERE id_productos = :id_productos"
        )

        # Ejecutar la consulta de actualización
        db.execute(
            text(update_query),
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
        delete_query = "DELETE FROM productos WHERE id_productos = :id_productos"
        db.execute(text(delete_query), {"id_productos": id_productos})
        db.commit()
        return {"message": "Producto eliminado"}
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))

@app.put("/usuarios/admin/approve")
def admin_approve_user(user: AdminApproveUserModel, db: Session = Depends(get_db)):
    try:
        update_query = "UPDATE usuarios SET estado = 1 WHERE id_usuarios = :id_usuarios"
        db.execute(text(update_query), {"id_usuarios": user.id_usuarios})
        db.commit()
        return {"message": "Usuario aprobado"}
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))


@app.put("/usuarios/admin/reset-password")
def admin_reset_password(user: AdminResetPasswordModel, db: Session = Depends(get_db)):
    try:
        update_query = "UPDATE usuarios SET contrasena = :new_password WHERE email = :email"
        update_data = {"email": user.email, "new_password": user.new_password}

        # Ejecutar la consulta de actualización utilizando la conexión de la sesión
        db.execute(text(update_query), update_data)
        db.commit()

        return {"message": "Contraseña actualizada"}

    except SQLAlchemyError as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error al actualizar la contraseña")

@app.get("/informes/rendimiento")
def performance_metrics(db: Session = Depends(get_db)):
    try:
        query = "SELECT estado, COUNT(*) AS cantidad FROM pedidos GROUP BY estado"
        result = db.execute(text(query)).fetchall()
        performance_data = [dict(row._mapping) for row in result]
        return performance_data
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor")

@app.get("/informes/inventario")
def inventory_data(db: Session = Depends(get_db)):
    try:
        query = "SELECT nombre, stock FROM productos"
        result = db.execute(text(query)).fetchall()
        inventory_data = [dict(row._mapping) for row in result]
        return inventory_data
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor")

@app.get("/informes/ventas/fabricantes")
def sales_manufacturers_data(db: Session = Depends(get_db)):
    try:
        query = """
            SELECT DATE(p.fecha_pedido) AS fecha, 
                   prod.fabricante,
                   COUNT(*) AS total_ventas, 
                   SUM(prod.precio * lp.cantidad) AS total_ingresos
            FROM pedidos p
            JOIN lista_productos lp ON p.id_pedidos = lp.id_pedidos_fk
            JOIN productos prod ON lp.id_productos_fk = prod.id_productos
            GROUP BY DATE(p.fecha_pedido), prod.fabricante
            ORDER BY fecha, prod.fabricante
        """
        result = db.execute(text(query)).fetchall()
        sales_data = [dict(row._mapping) for row in result]
        return sales_data
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor")

@app.delete("/productos/eliminarCalificacion")
def delete_product_ratings(delete_request: DeleteRequestModel, db: Session = Depends(get_db)):
    try:
        query = """
            DELETE c
            FROM calificaciones c
            JOIN productos p ON p.id_productos = c.id_producto_fk
            JOIN categorias_productos cp ON p.id_productos = cp.id_productos_fk
            JOIN categoria cat ON cp.id_categoria_fk = cat.id_categoria
            WHERE p.nombre LIKE :keyword OR p.descripcion LIKE :keyword OR cat.nombre = :category
        """
        result = db.execute(text(query), {"keyword": f"%{delete_request.keyword}%", "category": delete_request.category})
        db.commit()
        return {"message": "Calificaciones eliminadas correctamente"}
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor")


@app.delete("/eliminar/comentarios")
def delete_comments(comment_info: CommentDelete, db: Session = Depends(get_db)):
    try:
        # Consulta para eliminar comentarios basados en el id del producto y el id del usuario
        query = text("""
            DELETE FROM comentarios 
            WHERE id_producto_fk = :product_id
            AND id_usuario_fk = :user_id
        """)

        # Ejecutar la consulta
        db.execute(query, {"product_id": comment_info.product_id, "user_id": comment_info.user_id})
        db.commit()

        return {"message": "Comentarios eliminados correctamente"}
    
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        raise HTTPException(status_code=500, detail="Error interno del servidor")
