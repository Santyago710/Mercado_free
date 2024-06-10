from fastapi import FastAPI
from pydantic import BaseModel
from typing import List
from sqlalchemy import create_engine

app = FastAPI(title="Mercado free DB", description="This is a database based on the app of Mercado Libre and using FastAPI")

# Configura la cadena de conexión con los parámetros proporcionados
db_connection = create_engine("mysql+pymysql://root:1qaw3edr5*@localhost:3307/mercado_free")
db_client = db_connection.connect()

@app.get("/")
def healthcheck():
    """This is a service to validate the web API is up and running."""
    return {"status": "ok"}
