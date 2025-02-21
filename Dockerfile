FROM python:3.10-slim-bullseye

ENV PYTHONUNBUFFERED 1

RUN dos2unix /app/entrypoint.sh && chmod +x /app/entrypoint.sh

WORKDIR /app/

COPY . .

RUN chmod +x /app/entrypoint.sh

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["python3", "manage.py", "runserver"]
