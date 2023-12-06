FROM php:8.2-fpm 


RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev

#installer logiciel composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#installer pdo_mysql mbstring et zib
RUN docker-php-ext-install pdo_mysql mbstring zip

#définir répertoire de trvail, toutes commande après sera exécuté dans ce répertoire
WORKDIR /app

#copy composer.json dans /app
COPY composer.json .

#lance la commande composer install
RUN composer install --no-scripts

#copie tout mon projet laravel dans /app de l'image docker
COPY . .

# Exécuter la commande artisan key:generate
CMD php artisan key:generate

#à modifier
#CMD php artisan migrate && php artisan serve --host=0.0.0.0 --port=80

#host 0.0.0.0 = le serveur laravel est accessible en dehors du conteneur et depuis Windows également
CMD php artisan migrate:fresh --seed && php artisan serve --host=0.0.0.0 --port=8069
EXPOSE 8069
#docker run -p 5000:8069 -t app
