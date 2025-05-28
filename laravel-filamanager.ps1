# Di chuyển đến thư mục dự án
cd C:\xampp\htdocs\btck_organic_food

# Chỉnh sửa quyền truy cập
icacls "storage\*" /grant Everyone:F /T
icacls "storage\logs\*" /grant Everyone:F /T
icacls "bootstrap\cache" /grant Users:F /T
icacls "bootstrap\cache" /grant Everyone:RX /T

# Xóa thư mục public/storage
Remove-Item -Path "public\storage" -Recurse -Force

# Publish provider và assets
php artisan vendor:publish --provider="Intervention\Image\Laravel\ServiceProvider"
php artisan vendor:publish --tag=lfm_config
php artisan vendor:publish --tag=lfm_public

# Quản lý cache
php artisan config:clear; php artisan config:cache
php artisan route:clear
php artisan config:clear; php artisan config:cache

# Tạo symbolic link
php artisan storage:link