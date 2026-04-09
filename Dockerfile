FROM php:8.4-apache
# Cambiamos fpm por apache para que el contenedor sea un servidor web completo

# Instalamos dependencias del sistema
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev

# Instalamos extensiones de PHP necesarias para Laravel
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Habilitamos el módulo rewrite de Apache (vital para las rutas de Laravel/APIs)
RUN a2enmod rewrite

# Copiamos Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Configuramos el directorio de trabajo
WORKDIR /var/www/html

# Copiamos los archivos del proyecto
COPY . .

# Ajustamos los permisos para que Apache pueda escribir en storage y cache
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Cambiamos el DocumentRoot de Apache a la carpeta /public de Laravel
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Render asigna el puerto automáticamente, Apache por defecto usa el 80.
# Render hará el mapeo interno, así que no necesitas exponer un puerto específico aquí.
EXPOSE 80

# Comando para iniciar Apache en primer plano
CMD ["apache2-foreground"]
