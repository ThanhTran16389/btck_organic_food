#!/bin/bash

# Kiểm tra xem file .env đã tồn tại chưa
if [ ! -f .env ]; then
    # Nếu chưa tồn tại, copy .env.example
    cp .env.example .env
fi

# Xóa file composer.lock nếu có
if [ -f composer.lock ]; then
    rm composer.lock
fi

# Cài đặt các dependency
composer i

# Xóa file composer.lock nếu có
if [ -f composer.lock ]; then
    rm package-lock.json
fi

chmod -R 777 public/build

npm i && npm run build

# Generate application key
php artisan key:generate

# Clear cache
php artisan cache:clear

# Dump autoloader
composer dump-autoload

# Chỉnh sửa quyền truy cập cho thư mục storage
chmod -R 777 storage/*
chmod -R 777 storage/logs/*

# Chỉnh sửa quyền truy cập cho thư mục bootstrap/cache
chmod -R 775 bootstrap/cache


