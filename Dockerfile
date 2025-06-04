FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["voila", \
     "--Voila.ip=0.0.0.0", \
     "--port=8080", \
     "--no-browser", \
     "--Voila.config_file_paths=['/app']", \
     "notebook/"]