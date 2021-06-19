#!/bin/sh
cd /var/www

composer create-project --prefer-dist laravel/laravel=6.* .
sed -i '' -e "s/\(DB_CONNECTION=\).*/\1mysql/" .env
sed -i '' -e "s/\(DB_HOST=\).*/\1db/" .env
sed -i '' -e "s/\(DB_PORT=\).*/\13306/" .env
sed -i '' -e "s/\(DB_DATABASE=\).*/\1laravel/" .env
sed -i '' -e "s/\(DB_USERNAME=\).*/\1laravel-user/" .env
sed -i '' -e "s/\(DB_PASSWORD=\).*/\1laravel-pass/" .env
php artisan migrate
composer require laravel/ui "1.x" --dev
php artisan ui bootstrap
npm install
npm run dev