# btck_organic_food

<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

### Guideline Install | Hướng dẫn cài đặt

**Step 1: install sub-package and config source**
install composer package, install all files in install.sh by command line

```shell
sh install.sh
```

| Use admin in window or `sodo` in Mac

**Step 2: Create basic database | Bước 2: Tạo cơ sở dữ liệu mẫu**
setting in .env connect with DB with the database name:btck_organic_food
run file database.sh by command as bellow:

```shell
sh database.sh
```

| Use admin in window or `sodo` in Mac

Incase database can't run, the program return with title `mysql command not found` then create the database by manual: import alls database in file: `database\scripts\basicdatabase.sql`

**Step 3: setting file `.env`**

-   Change the setting connect to database
-   review and Change `APP_URL` by `APP_URL` this will effect to link and resource.

Example image link: `http://localhost/btck_organic_food/public`.

**Step4: Home** (use the link: `...public/`)

**Admin Login Details** (use the link: `...public/login`)

```shell
the curent basic database testing with Email and Password is the same.
Email : admin@gmail.com
Password: admin@gmail.com
or acount2:
Email : admin1@gmail.com
Password: admin2@gmail.com
```

**Customer Login Details** (use the link: `...public/user/login`)

```shell
the curent basic database testing with Email and Password is the same.
Email : customer@mail.com
Password: customer@mail.com
or acount2:
Email : customer1@mail.com
Password: customer1@mail.com
```

**Step 5: Change `php.validate.executablePath` in file `.vscode/settings.json `to suitable with your computer**

Example: `"php.validate.executablePath": "D:/Soft/xampp/php/php.exe",`

**Step 6: Setting support package and extension**
Follow: [Link](https://ourcodeworld.com/articles/read/349/how-to-install-and-enable-the-imagick-extension-in-xampp-for-windows)

With window then use: dll and add config for file `php.ini` as below (revise the link to xampp):

```ini
;;;;;;;;;;;;;;;;;;;;;;
; Dynamic Extensions ;
;;;;;;;;;;;;;;;;;;;;;;
; Add the following line where the other extensions are loaded
imagick.skip_version_check=true
extension=php_imagick.dll
upload_tmp_dir = C:\xampp\temp
```

**Step 7: install file manager package**
Two package: `unisharp/laravel-filemanager` and `intervention/image-laravel`install in composer.json. This package will support to manage image and resource: [Laravel File Manager](https://unisharp.github.io/laravel-filemanager) và [Intervention Image](https://github.com/Intervention/image)

install command line as bellow:

```shell
sh laravel-filemanager.sh
```

After installation is complete, try going to any screen that has the feature to select images to upload. Example: `.../public/admin/banner/creates`

```shell
// Rerun the authorization commands and rerun the config:
chmod -R gu+w storage
chmod -R guo+w storage
php artisan cache:clear

// If the above commands have not been fully authorized, please continue using the following commands:
php artisan cache:clear
composer dump-autoload
sudo chmod -R 777 storage/*
sudo chmod -R 777 storage/logs/*
sudo chmod -R 775 bootstrap/cache
php artisan config:cache

// After doing this you can restart Apache:
```

**Step 8: install fix-storage-link.sh**

```shell
sh fix-storage-link.sh
```

<!-- GHI CHÚ CHO PHẦN COMMIT:
Cách đặt tên file commit: yyyy+MM+dd_Tênfile cần commit_Version1,2,3,4..nn
ví dụ:
20250518_Readme_v1 -->
