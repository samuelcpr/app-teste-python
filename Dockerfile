FROM python:3.9

WORKDIR /app

COPY requirements.txt .

RUN apt-get update \
    && apt-get install -y git curl build-essential gcc make default-libmysqlclient-dev libssh-dev

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && pip install flask

COPY . .

CMD [ "python", "main.py" ]
