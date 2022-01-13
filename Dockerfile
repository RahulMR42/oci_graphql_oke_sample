FROM python:3.9

WORKDIR /code
COPY . .

WORKDIR /code/fastapi-sqlalchemy

RUN pip install --no-cache-dir poetry && \
    poetry install && \
    poetry run alembic upgrade head 

CMD ["poetry","run","uvicorn","main:app","--host", "0.0.0.0", "--port", "80" ]