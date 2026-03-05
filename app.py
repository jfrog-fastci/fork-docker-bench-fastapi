from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI(title="Docker Bench FastAPI")

class HealthResponse(BaseModel):
    status: str

@app.get("/")
def read_root():
    return {"message": "Hello from FastAPI!"}

@app.get("/health", response_model=HealthResponse)
def health():
    return HealthResponse(status="healthy")
