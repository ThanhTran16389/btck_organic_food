#!/bin/bash


# Chỉnh sửa quyền truy cập cho thư mục storage
chmod -R 777 storage/*
chmod -R 777 storage/logs/*

# Chỉnh sửa quyền truy cập cho thư mục bootstrap/cache
chmod -R 775 bootstrap/cache

# Xóa cấu hình cũ
rm -rf public/storage

# @see: https://unisharp.github.io/laravel-filemanager/installation
php artisan vendor:publish --provider="Intervention\Image\Laravel\ServiceProvider"

php artisan config:clear && php artisan config:cache

php artisan vendor:publish --tag=lfm_config
php artisan vendor:publish --tag=lfm_public

# Cache configuration
php artisan route:clear
php artisan config:clear
php artisan config:cache

php artisan storage:link

