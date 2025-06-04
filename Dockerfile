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
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["dvc", "repro"]