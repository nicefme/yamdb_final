# создать образ на основе базового слоя python (там будет ОС и интерпретатор Python)
FROM python:3.8.5

# создать директорию /code
#RUN mkdir /code
WORKDIR /code

# скопировать файл requirements.txt из директории, в которой лежит докерфайл, в директорию /code
COPY requirements.txt .

# выполнить команду (как в терминале, с тем же синтаксисом) для установки пакетов из requirements.txt
RUN pip3 install -r requirements.txt

# скопировать всё содержимое директории, в которой лежит докерфайл, в директорию /code
COPY . .

# при старте контейнера выполнить runserver 
#CMD python /code/manage.py runserver 0:8000
#WORKDIR /code
CMD gunicorn api_yamdb.wsgi:application --bind 0.0.0.0:8000 