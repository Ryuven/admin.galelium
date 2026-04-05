FROM php:8.2-apache

# Включаем модуль rewrite для ЧПУ
RUN a2enmod rewrite

# Устанавливаем расширения PHP для MySQL/PostgreSQL
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Копируем весь твой сайт в папку, которую отдаёт Apache
COPY . /var/www/html/

# Даём права на запись (если нужно для сессий или загрузки файлов)
RUN chmod -R 777 /var/www/html/
