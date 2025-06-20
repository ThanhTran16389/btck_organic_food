#!/bin/bash

# Hành động 1: Thêm data vào cơ sở dữ liệu MySQL
# Lấy thông tin kết nối từ file .env
DB_HOST=$(grep 'DB_HOST=' .env | cut -d'=' -f2)
DB_PORT=$(grep 'DB_PORT=' .env | cut -d'=' -f2)
DB_USERNAME=$(grep 'DB_USERNAME=' .env | cut -d'=' -f2)
DB_PASSWORD=$(grep 'DB_PASSWORD=' .env | cut -d'=' -f2)
DB_NAME=$(grep 'DB_DATABASE=' .env | cut -d'=' -f2)

# Xóa database hiện hữu
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USERNAME" -p"$DB_PASSWORD" -e "DROP DATABASE IF EXISTS $DB_NAME;"

# Tạo database
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USERNAME" -p"$DB_PASSWORD" -e "CREATE DATABASE $DB_NAME;"

# Chạy lệnh MySQL để thực hiện script
mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USERNAME" -p"$DB_PASSWORD" "$DB_NAME" < database/scripts/basicdatabase.sql


php artisan migrate --path=database/migrations/2025_06_19_084907_add_payment_fields_to_orders_table.php
