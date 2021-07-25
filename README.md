# REST API YaMDb  

![Workflow status](https://github.com/nicefme/yamdb_final/actions/workflows/yamdb_workflow.yml/badge.svg)  

## База отзывов пользователей


### Что это за проект

REST API YaMDb - база отзывов пользователей о фильмах, книгах и музыке. Здесь можно оставить отзыв о произведении и подискутировать о нем в комментариях.  
Стек технологий: Python 3 // Django // Django REST Framework // Simple-JWT // Docker // Nginx // PostgreSQL


### Развертывание проекта на боевом сервере

Для запуска приложения на сервере с ОС Ubuntu 20.04 необходимо:

- Запустите сервер и зайдите на него ``` ssh username@ip_address ```;
- Установите обновления apt:  
``` sudo apt update ```;  
``` sudo apt upgrade -y ```;  
- Установите nginx ``` sudo apt install nginx -y ```;
- Остановите службу nginx ``` sudo systemctl stop nginx ``;
- Установите docker ``` sudo apt install docker.io ```;
- Установите docker-compose:  
Выполните эту команду, чтобы загрузить текущую стабильную версию Docker Compose:  
``` sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose ```;  
Примените к файлу права доступа:  
``` sudo chmod +x /usr/local/bin/docker-compose	```;  
Проверьте установку (должна вернуться версия docker-compose):  
``` docker-compose --version ```;
- Создайте на сервере два файла из проекта на GitHub:  
> docker-compose.yaml в home/<username>/docker-compose.yaml  
> nginx/default.conf из вашего проекта на сервер  и home/<username>/nginx/default.conf  



- Клонировать репозиторий: ``` git clone ... ```;
- Файл ``` empty.env ``` переименовать в ``` .env ``` и в файле указать значение для поля ``` POSTGRES_PASSWORD ```;
- В командной строке linux выполнить команду ``` docker-compose up -d --build ``` для развертывания проекта через docker;
- Сделать миграции:  
``` sudo docker-compose exec web python manage.py makemigrations users ```  
``` sudo docker-compose exec web python manage.py makemigrations reviews ```  
``` sudo docker-compose exec web python manage.py makemigrations titles ```  
``` docker-compose exec web python manage.py migrate --noinput ```
- Собрать статику:  
``` docker-compose exec web python manage.py collectstatic --no-input ```

Готово! Сайт доступен по адресу http://127.0.0.1/


### Создание суперпользователя

Для создания суперпользователя необходимо ввести команду:  
``` docker-compose exec web python manage.py createsuperuser ```  
и далее следовать инструкциям на экране.


### Заполнение базы данных

Для того, чтобы заполнить БД начальными данными по фильмам, книгам, музыкальным произведениям, а также переченем жанров и категорий необходимо выполнить следующую команду:  
``` docker-compose exec web python manage.py loaddata fixtures.json ```