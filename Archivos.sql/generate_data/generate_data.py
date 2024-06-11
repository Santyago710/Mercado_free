from faker import Faker
import uuid
import random
import os

fake = Faker()

# Generación de datos para las tablas
paises = [{"codigo_pais": i, "nombre": fake.country()} for i in range(1, 13)]

usuarios = [
    {
        "id_usuarios": str(uuid.uuid4()),
        "nombre": fake.name(),
        "contrasena": fake.password(),
        "direccion": fake.address().replace('\n', ', '),
        "telefono": fake.phone_number(),
        "email": fake.email(),
        "estado": random.choice([0, 1]),
        "codigo_pais_fk": random.choice(paises)["codigo_pais"]
    } for _ in range(12)
]

productos = [
    {
        "id_productos": i + 1,
        "nombre": fake.word(),
        "descripcion": fake.text(max_nb_chars=100).replace('\n', ' '),
        "precio": random.randint(1, 1000),
        "fabricante": fake.company(),
        "stock": random.randint(0, 100)
    } for i in range(12)
]

calificaciones = [
    {
        "id_calificaciones": i + 1,
        "puntuacion": random.randint(0, 5),
        "id_producto_fk": random.choice(productos)["id_productos"],
        "id_usuario_fk": random.choice(usuarios)["id_usuarios"]
    } for i in range(12)
]

carrito = []
for i in range(12):
    carrito.append(
        {
            "id_carrito": i + 1,
            "estado": random.choice([True, False]),
            "id_usuario_fk": random.choice(usuarios)["id_usuarios"]
        }
    )

categorias = [
    {
        "id_categoria": i + 1,
        "nombre": fake.word(),
        "descripcion": fake.text(max_nb_chars=100).replace('\n', ' ')
    } for i in range(12)
]

categorias_productos = [
    {
        "id_categorias_productos": i + 1,
        "id_productos_fk": random.choice(productos)["id_productos"],
        "id_categoria_fk": random.choice(categorias)["id_categoria"]
    } for i in range(12)
]

comentarios = [
    {
        "id_comentarios": i + 1,
        "texto": fake.text(max_nb_chars=300).replace('\n', ' '),
        "id_producto_fk": random.choice(productos)["id_productos"],
        "id_usuario_fk": random.choice(usuarios)["id_usuarios"]
    } for i in range(12)
]

historial = [
    {
        "id_historial": i + 1,
        "estado": random.choice(["Pendiente", "Enviado", "Entregado"]),
        "id_usuario_fk": random.choice(usuarios)["id_usuarios"]
    } for i in range(12)
]

pedidos = [
    {
        "id_pedidos": i + 1,
        "estado": random.choice(["Pendiente", "Enviado", "Entregado"]),
        "metodo_pago": random.choice(["Tarjeta de Crédito", "PayPal", "Transferencia Bancaria"]),
        "id_historial_fk": random.choice(historial)["id_historial"],
        "id_usuario_fk": random.choice(usuarios)["id_usuarios"]
    } for i in range(12)
]

lista_productos = [
    {
        "id_lista_productos": i + 1,
        "id_productos_fk": random.choice(productos)["id_productos"],
        "id_pedidos_fk": random.choice(pedidos)["id_pedidos"],
        "id_carrito_fk": random.choice(carrito)["id_carrito"],
        "cantidad": random.randint(1, 10)
    } for i in range(12)
]

cuentas_bancarias = [
    {
        "id_cuenta": str(uuid.uuid4()),
        "nombre_banco": fake.company(),
        "numero_cuenta": fake.iban(),
        "codigo_pais_fk": random.choice(paises)["codigo_pais"],
        "id_usuario_fk": random.choice(usuarios)["id_usuarios"]
    } for _ in range(12)
]

# Generar las instrucciones SQL para insertar estos datos
def generate_insert(table_name, data):
    if not data:
        return ''
    keys = data[0].keys()
    columns = ', '.join(keys)
    values_list = []

    for row in data:
        values = ', '.join(f"'{v}'" if isinstance(v, str) else str(v) for v in row.values())
        values_list.append(f"({values})")

    values_str = ',\n'.join(values_list)
    return f"INSERT INTO {table_name} ({columns}) VALUES\n{values_str};\n"

# Generar las consultas SQL para cada tabla
sql_statements = []
sql_statements.append(generate_insert('pais', paises))
sql_statements.append(generate_insert('usuarios', usuarios))
sql_statements.append(generate_insert('productos', productos))
sql_statements.append(generate_insert('calificaciones', calificaciones))
sql_statements.append(generate_insert('carrito', carrito))
sql_statements.append(generate_insert('categoria', categorias))
sql_statements.append(generate_insert('categorias_productos', categorias_productos))
sql_statements.append(generate_insert('comentarios', comentarios))
sql_statements.append(generate_insert('historial', historial))
sql_statements.append(generate_insert('pedidos', pedidos))
sql_statements.append(generate_insert('lista_productos', lista_productos))
sql_statements.append(generate_insert('cuenta_bancaria', cuentas_bancarias))

# Ruta del archivo
script_dir = os.path.dirname(os.path.abspath(__file__))
output_file = os.path.join(script_dir, 'insert_data.sql')

# Asegurarse de que el directorio existe
os.makedirs(script_dir, exist_ok=True)

# Escribir a un archivo SQL
try:
    with open(output_file, 'w') as f:
        for statement in sql_statements:
            if statement:  # Verifica que la consulta no esté vacía
                f.write(statement)
    print("Datos generados y escritos en insert_data.sql")
except Exception as e:
    print(f"Error al escribir el archivo: {e}")
