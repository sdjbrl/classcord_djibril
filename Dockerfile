FROM python:3.11-slim

WORKDIR /app

COPY . /app

RUN apt-get update && apt-get install -y sqlite3 && apt-get clean
RUN pip install colorama

EXPOSE 12345
EXPOSE 54321

CMD ["python3", "server_classcord.py"]
