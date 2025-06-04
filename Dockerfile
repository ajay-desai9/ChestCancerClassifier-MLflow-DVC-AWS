FROM python:3.8-slim-buster

RUN apt update -y && apt install -y \
    awscli \
    git \
    gcc \
    build-essential \
    libpq-dev \
    python3-dev

WORKDIR /app

COPY . /app

# Ensure pip exists and is up to date
RUN python3 -m ensurepip --upgrade
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["dvc", "repro"]
