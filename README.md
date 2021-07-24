# REST API YaMDb
## База отзывов пользователей


### Что это за проект

REST API YaMDb - база отзывов пользователей о фильмах, книгах и музыке. Здесь можно оставить отзыв о произведении и подискутировать о нем в комментариях.  
Стек технологий: Python 3 // Django // Django REST Framework // Simple-JWT // Docker // Nginx // PostgreSQL


### Запуск приложения

Для запуска приложения необходимо:

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