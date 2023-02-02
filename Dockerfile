FROM python:3.9.7

ENV APP_HOME /fastapi-app
WORKDIR $APP_HOME

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install with --no-cache-dir -r requirements.txt
RUN ls -la $APP_HOME

COPY ./app ./app
WORKDIR  ./app
RUN ls -la

CMD ["gunicorn", "--bind", ":5000", "--workers", "2", "--threads", "4", "Gunicorn:app"]
