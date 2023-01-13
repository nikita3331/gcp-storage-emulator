FROM python:3.10.6-slim
ARG CACHEBUST=1

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True
ENV APP_HOME /app
ENV PORT 8080
ENV HOST 0.0.0.0
ENV STORAGE_BASE /
ENV STORAGE_DIR storage

# Python app installation
WORKDIR $APP_HOME
COPY README.md pyproject.toml setup.py ./
COPY src src/
RUN pip install .

CMD ["python","src/gcp_storage_emulator/__main__.py","start","--host","127.0.0.1","--port","9023","--default-bucket","image-service-esp"]
