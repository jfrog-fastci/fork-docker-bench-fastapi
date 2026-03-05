FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends curl libffi-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --no-cache-dir fastapi "uvicorn[standard]" sqlalchemy alembic httpx pydantic redis celery boto3 Pillow

COPY . .

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
