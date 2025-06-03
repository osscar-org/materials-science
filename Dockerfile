FROM python:3.9-slim

RUN apt-get update && apt-get install -y nodejs npm && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install lxml_html_clean


COPY . .

RUN jupyter nbextension enable --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable --py pythreejs --sys-prefix
RUN jupyter nbextension enable --py bqplot --sys-prefix

EXPOSE 80

# Run via Procfile equivalent
CMD ["voila", "--Voila.ip=0.0.0.0", "--port=8080", "--no-browser", "--Voila.config_file_paths=['./']", "--Voila.log_level=10", "--Voila.show_tracebacks=True", "notebook/"]
