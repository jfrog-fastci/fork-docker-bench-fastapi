FROM python:3.12

RUN apt-get update
RUN apt-get install -y vim less man-db wget telnet curl net-tools iputils-ping htop dnsutils strace libffi-dev

WORKDIR /app

COPY . .

RUN pip install fastapi uvicorn[standard] sqlalchemy alembic httpx pydantic redis celery boto3 Pillow

EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
