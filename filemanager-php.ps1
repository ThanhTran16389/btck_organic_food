icacls "storage\*" /grant Everyone:F /T
icacls "storage\logs\*" /grant Everyone:F /T
icacls "bootstrap\cache" /grant Users:F /T
icacls "bootstrap\cache" /grant Everyone:RX /T
Remove-Item -Path "public\storage" -Recurse -Force
php artisan vendor:publish --provider="Intervention\Image\Laravel\ServiceProvider"
php artisan vendor:publish --tag=lfm_config
php artisan vendor:publish --tag=lfm_public
php artisan config:clear; php artisan config:cache
php artisan route:clear
php artisan config:clear; php artisan config:cache
php artisan storage:link