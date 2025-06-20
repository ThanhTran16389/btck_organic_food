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

```shell
cài đặt các gói composer
chạy file install.sh bằng lệnh
sh install.sh
```

| Use admin in window or `sodo` in Mac

**Bước 2: Tạo cơ sở dữ liệu mẫu**
Trong file .env thiết lập kết nối dữ liệu với DB và đặt tên cơ sở dữ liệu là btck_ogranic_store
chạy file database.sh bằng dòng lệnh bên dưới

```shell
sh database.sh
```

| Dùng quyền admin trên window hoặc bổ sung `sudo` trên Mac

Trường hợp gặp lỗi `mysql command not found` thì tạo database bằng tay và import toàn bộ databasee trong thư file: `database\scripts\basicdatabase.sql`

**Bước 3: Cấu hình lại file `.env`**

-   Thay đổi cấu hình kết nối database
-   Thay đổi `APP_URL` bằng `APP_URL` trên máy tính của bạn, nếu không config chính xác chỗ này sẽ gây ra lỗi ở các link tài nguyên, đặc biệt là link image.

Ví dụ : `http://localhost/aptech-laravel-ecommerce-demo/public`.

Bạn vào link truy cập của mình như một ứng dụng PHP bình thường và sử dụng mật khẩu để truy cập

**Home** (Sử dụng đường dẫn `...public/`)

**Admin Login Details** (Sử dụng đường dẫn `...public/login`)

```shell
Email : admin@gmail.com
Password: admin@gmail.com
```

**Customer Login Details** (Sử dụng đường dẫn `...public/user/login`)

```shell
Email : customer@mail.com
Password: customer@mail.com
```

**Bước 5 Đổi lại `php.validate.executablePath` trong file `.vscode/settings.json `cho phù hợp với máy**

Ví dụ: `"php.validate.executablePath": "D:/Soft/xampp/php/php.exe", `

**Bước 6: Cấu hình cho các extension hỗ trợ**
Theo dõi: [Link](https://ourcodeworld.com/articles/read/349/how-to-install-and-enable-the-imagick-extension-in-xampp-for-windows)

Nếu dùng window thì tải các bản cài đặt dll và thêm config cho file `php.ini` như sau (sửa lại được dẫn xampp):

```ini
;;;;;;;;;;;;;;;;;;;;;;
; Dynamic Extensions ;
;;;;;;;;;;;;;;;;;;;;;;
; Add the following line where the other extensions are loaded
imagick.skip_version_check=true
extension=php_imagick.dll
upload_tmp_dir = C:\xampp\temp
```

**Bước 7: Cấu hình cho package**
Cài 2 gói : `unisharp/laravel-filemanager` và `intervention/image-laravel`vào composer.json. 2 gói này hỗ trợ quản lý file hình ảnh. Đọc tài liệu trực tiếp tại: [Laravel File Manager](https://unisharp.github.io/laravel-filemanager) và [Intervention Image](https://github.com/Intervention/image)

Trong phần này bạn chỉ cần chạy lệnh:

```shell
sh laravel-filemanager.sh
```

Sau khi cài đặt xong bạn thử vào một màn hình bất kỳ có tính năng chọn hình ảnh để upload. Ví dụ: `.../public/admin/banner/creates`

> Nếu muốn tìm hiểu thêm về cách sử dụng các gói này bạn có thể chủ động tạo các project demo và thao tác thử theo hướng dẫn của trang chủ.

> Lưu ý nếu gặp một số lỗi sau thì đây sẽ là cách xử lý dành cho bạn

> Lỗi `Failed to open stream: Permission denied` do không có quyền truy cập các file trong `storage` hoặc `public`.

```shell
// Chạy lại các lệnh phân quyền và run lại config:
chmod -R gu+w storage
chmod -R guo+w storage
php artisan cache:clear

// Nếu các lệnh trên chưa phân quyền hết thì hãy dùng tiếp các lệnh sau:
php artisan cache:clear
composer dump-autoload
sudo chmod -R 777 storage/*
sudo chmod -R 777 storage/logs/*
sudo chmod -R 775 bootstrap/cache
php artisan config:cache

// Sau khi thực hiện có thể khởi động lại Apache
```

GHI CHÚ CHO PHẦN COMMIT:
Cách đặt tên file commit: yyyy+MM+dd_Tênfile cần commit_Version1,2,3,4..nn
ví dụ:
20250518_Readme_v1
