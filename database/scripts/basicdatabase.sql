-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: ecommerceadvlara
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;

/*!40103 SET TIME_ZONE='+00:00' */
;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

-- ====================================================================================
-- ====================================================================================
-- Table structure for table `banners`
--
DROP TABLE IF EXISTS `banners`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `banners` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(191) NOT NULL,
    `slug` varchar(191) NOT NULL,
    `photo` varchar(191) DEFAULT NULL,
    `description` text DEFAULT NULL,
    -- chú ý chổ này có thêm trạng thái pending
    `status` enum('active', 'inactive', 'pending') NOT NULL DEFAULT 'inactive',
    `created_at` timestamp NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    -- thời gian cập nhật hiện tại
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `banners_slug_unique` (`slug`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `banners`
--
LOCK TABLES `banners` WRITE;

-- câu lệnh tắt dữ liệu kết nối tạm thời để quá trình nhập liệu nhanh hơn
/*!40000 ALTER TABLE `banners` DISABLE KEYS */
;

INSERT INTO
    `banners` (
        `title`,
        `slug`,
        `photo`,
        `description`,
        `status`
    )
VALUES
    (
        'Upgrade Your Wardrobe: Fashion Finds Await!',
        'fashion-finds-await',
        '/storage/photos/1/banner/banner-01.jpg',
        '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Get Up to 10% on your every purchase!</span></h2>',
        'active'
    ),
    (
        'Staycation Essentials: Create Your Haven!',
        'create-your-haven',
        '/storage/photos/1/banner/banner-07.jpg',
        '<p>Get Up to 35% OFF</p>',
        'active'
    ),
    (
        'Exclusive Online Offers',
        'exclusive-online-offers',
        '/storage/photos/1/banner/banner-06.jpg',
        '<span style=\"color: rgb(15, 15, 15); font-family: Söhne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; white-space-collapse: preserve;\">Online Offers: Yours to Discover!</span><br>',
        'active'
    ),
    (
        'T-SHIRT POLO THỂ THAO',
        't-shirt-polo-the-thao',
        '/storage/photos/1/banner/banner-01a.jpg',
        '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">SIP ÊM MỀM MẶC LÀ HMMM</span></h2>',
        'active'
    ),
    (
        'HIGH COZINESS',
        'high-coziness',
        '/storage/photos/1/banner/banner-01b.jpg',
        '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">SIP ÊM MỀM MẶC LÀ HMMM</span></h2>',
        'active'
    ),
    (
        'BREEZY SUMMER STYLE',
        'breezy-summer-style',
        '/storage/photos/1/banner/banner-01c.jpg',
        '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">SIP ÊM MỀM MẶC LÀ HMMM</span></h2>',
        'active'
    );

/*!40000 ALTER TABLE `banners` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
--
-- Table structure for table `settings`
--
DROP TABLE IF EXISTS `settings`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `settings` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `description` longtext NOT NULL,
    `short_des` text NOT NULL,
    `logo` varchar(191) NOT NULL,
    `photo` varchar(191) NOT NULL,
    `address` varchar(191) NOT NULL,
    `phone` varchar(191) NOT NULL,
    `email` varchar(191) NOT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    -- thời gian cập nhật hiện tại
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `settings`
--
LOCK TABLES `settings` WRITE;

/*!40000 ALTER TABLE `settings` DISABLE KEYS */
;

INSERT INTO
    `settings` (
        `description`,
        `short_des`,
        `logo`,
        `photo`,
        `address`,
        `phone`,
        `email`
    )
VALUES
    (
        'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n',
        'Welcome to Ecommerce Laravel Website, your premier destination for products. Discover a curated collection of product types designed to elevate your needs or lifestyle. Dive into a world of quality, style, innovation where every purchase guarantees satisfaction.',
        '/storage/photos/1/logo.png',
        '/storage/photos/1/setting/blog3.jpg',
        '115B/88 Test Address, Test',
        '0971248450',
        'test_setting@gmail.com'
    );

/*!40000 ALTER TABLE `settings` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- Table structure for table `coupons`
--
DROP TABLE IF EXISTS `coupons`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `coupons` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `code` varchar(191) NOT NULL,
    `type` enum('fixed', 'percent') NOT NULL DEFAULT 'fixed',
    `value` decimal(20, 2) NOT NULL,
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'inactive',
    `created_at` timestamp NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    -- thời gian cập nhật hiện tại
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `coupons`
--
LOCK TABLES `coupons` WRITE;

/*!40000 ALTER TABLE `coupons` DISABLE KEYS */
;

INSERT INTO
    `coupons` (`code`, `type`, `value`, `status`)
VALUES
    (
        'LKPL690',
        'fixed',
        30.00,
        'inactive'
    ),
    (
        'CODEASTRO10',
        'percent',
        10.00,
        'active'
    ),
    (
        'TTLP480',
        'percent',
        10.00,
        'active'
    ),
    (
        'THLP530',
        'fixed',
        20.00,
        'active'
    ),
    (
        'AGBH358',
        'fixed',
        30.00,
        'active'
    );

/*!40000 ALTER TABLE `coupons` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- ====================================================================================
-- ====================================================================================
-- Table structure for table `messages`
--
DROP TABLE IF EXISTS `messages`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `messages` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(191) NOT NULL,
    `subject` text NOT NULL,
    `email` varchar(191) NOT NULL,
    `photo` varchar(191) DEFAULT NULL,
    `phone` varchar(191) DEFAULT NULL,
    `message` longtext NOT NULL,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    -- `sender_id` bigint(20) unsigned DEFAULT NULL,
    -- `receiver_id` bigint(20) unsigned DEFAULT NULL,
    `status` TINYINT DEFAULT 0,
    -- ví dụ trạng thái 1 đã đọc và 0 là chưa đọc
    `read_at` timestamp NULL DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    -- thời gian cập nhật hiện tại
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `messages_user_id_fk` (`user_id`),
    CONSTRAINT `messages_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE
    SET
        NULL -- Các ràng buộc khoá ngoại liên kết đến bảng users
        --  chú ý nếu là khách vãng lai thì sender_id và receiver_id sẽ bằng null
        -- KEY `messages_sender_id_fk` (`sender_id`),
        -- KEY `messages_receiver_id_fk` (`receiver_id`),
        -- CONSTRAINT `messages_sender_id_fk`
        --     FOREIGN KEY (`sender_id`) REFERENCES `users`(`id`)
        --     ON DELETE SET NULL,
        -- -- ON DELETE CASCADE Được dùng khi muốn đồng bộ toàn bộ dữ liệu, nghĩa là khi xóa 1 người dùng thì toàn bộ dữ liệu tin nhắn liên quan đến người dùng này trong bảng sẽ bị xóa theo
        -- CONSTRAINT `messages_receiver_id_fk`
        --     FOREIGN KEY (`receiver_id`) REFERENCES `users`(`id`)
        --     ON DELETE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `messages`
--
LOCK TABLES `messages` WRITE;

/*!40000 ALTER TABLE `messages` DISABLE KEYS */
;

INSERT INTO
    `messages` (`name`, `email`, `phone`, `message`, `status`)
VALUES
    (
        'GuestOutside',
        'guestoutside@gmail.com',
        '0973547582',
        'Hello chủ shop',
        1
    );

INSERT INTO
    `messages` (`user_id`, `message`, `status`)
VALUES
    (2, 'dịch vụ mua thêm', 0);

/*!40000 ALTER TABLE `messages` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- Table structure for table `notifications`
--
DROP TABLE IF EXISTS `notifications`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `notifications` (
    `id` char(36) NOT NULL,
    `type` varchar(191) NOT NULL,
    `notifiable_type` varchar(191) NOT NULL,
    `notifiable_id` bigint(20) unsigned NOT NULL,
    `data` text NOT NULL,
    `read_at` timestamp NULL DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`, `notifiable_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `notifications`
--
LOCK TABLES `notifications` WRITE;

/*!40000 ALTER TABLE `notifications` DISABLE KEYS */
;

INSERT INTO
    `notifications` (
        `id`,
        `type`,
        `notifiable_type`,
        `notifiable_id`,
        `data`
    )
VALUES
    (
        '04a9b33a-7b70-42ae-9ea7-45918ed200c3',
        'App\\Notifications\\StatusNotification',
        'App\\User',
        1,
        '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}'
    ),
    (
        '15fbc0e9-44e4-403f-8fbf-aa45667bee46',
        'App\\Notifications\\StatusNotification',
        'App\\User',
        1,
        '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-carnaby-evo-tri1-sma-trainers\",\"fas\":\"fa-star\"}'
    ),
    (
        '18365bcb-3478-43f4-8f86-d3b84bf06557',
        'App\\Notifications\\StatusNotification',
        'App\\User',
        1,
        '{\"title\":\"New Order Received\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}'
    ),
    (
        '1a8549ef-109a-4e2d-8c2b-7b55baa7287a',
        'App\\Notifications\\StatusNotification',
        'App\\User',
        1,
        '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/womens-breton-stripes-sleeveless-v-neck-stretch-cotton-polo-dress\",\"fas\":\"fa-star\"}'
    ),
    (
        '2145a8e3-687d-444a-8873-b3b2fb77a342',
        'App\\Notifications\\StatusNotification',
        'App\\User',
        1,
        '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}'
    ),
    (
        '2689e352-a41a-4d13-989c-0e48aa2cf15c',
        'App\\Notifications\\StatusNotification',
        'App\\User',
        1,
        '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/mens-relaxed-fit\",\"fas\":\"fa-star\"}'
    );

/*!40000 ALTER TABLE `notifications` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
--
-- Table structure for table `post_categories`
--
DROP TABLE IF EXISTS `post_categories`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `post_categories` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(191) NOT NULL,
    `slug` varchar(191) NOT NULL,
    `status` enum('active', 'inactive', 'pendding') NOT NULL DEFAULT 'active',
    `created_at` timestamp NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `post_categories`
--
LOCK TABLES `post_categories` WRITE;

/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */
;

INSERT INTO
    `post_categories` (`title`, `slug`, `status`)
VALUES
    (
        'Travel',
        'travel',
        'active'
    ),
    (
        'Electronics',
        'electronics',
        'active'
    ),
    (
        'Cloths',
        'cloths',
        'active'
    ),
    (
        'Enjoy',
        'enjoy',
        'active'
    ),
    (
        'Sports',
        'sports',
        'active'
    ),
    (
        'Go peach',
        'go-peach',
        'active'
    );

/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- Table structure for table `post_tags`
--
DROP TABLE IF EXISTS `post_tags`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `post_tags` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(191) NOT NULL,
    `slug` varchar(191) NOT NULL,
    `status` enum('active', 'inactive', 'pendding') NOT NULL DEFAULT 'active',
    `created_at` timestamp NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    -- `created_at` timestamp NULL DEFAULT NULL,
    -- `updated_at` timestamp NULL DEFAULT NULL,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `post_tags_slug_unique` (`slug`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `post_tags`
--
LOCK TABLES `post_tags` WRITE;

/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */
;

INSERT INTO
    `post_tags` (`title`, `slug`, `status`)
VALUES
    (
        'Test Post 1',
        'test-post-1',
        'active'
    ),
    (
        'Test Post 2',
        'test-post-2',
        'active'
    ),
    (
        'Test Post 3',
        'test-post-3',
        'active'
    ),
    (
        'Test Post 4',
        'test-post-4',
        'active'
    ),
    (
        'Test Post 5',
        'test-post-5',
        'active'
    ),
    (
        'Test Post 6',
        'test-post-6',
        'active'
    );

/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `users` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(191) NOT NULL,
    `gender` enum ('Male', 'Female') DEFAULT NULL,
    -- XEM LẠI CHỔ NÀY
    `photo` varchar(191) DEFAULT NULL,
    `role` enum('admin', 'user') NOT NULL DEFAULT 'user',
    `provider` varchar(191) DEFAULT NULL,
    `provider_id` varchar(191) DEFAULT NULL,
    `status` enum('active', 'inactive', 'Pendding') NOT NULL DEFAULT 'active',
    `address` varchar(191) DEFAULT NULL,
    `email` varchar(191) DEFAULT NULL,
    `password` varchar(191) DEFAULT NULL,
    `phone` varchar(191) DEFAULT NULL,
    `remember_token` varchar(100) DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `email_verified_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `users_email_unique` (`email`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `users`
--
LOCK TABLES `users` WRITE;

/*!40000 ALTER TABLE `users` DISABLE KEYS */
;

INSERT INTO
    `users` (
        `name`,
        `gender`,
        `photo`,
        `role`,
        `status`,
        `email`,
        `password`,
        `phone`
    )
VALUES
    (
        'Admin',
        NULL,
        '/storage/photos/1/admin-icn.png',
        'admin',
        'active',
        'admin@gmail.com',
        '$2a$12$3BvqlDbmdf.FeYbIw2ky.ehQdADGe8ohsKrU.mXvdHev7ODXIgf4i',
        NULL
    ),
    (
        'Mai Đình Tới',
        'Male',
        NULL,
        'user',
        'active',
        'toi@gmail.com',
        'cv1256599',
        '0978118449'
    ),
    (
        'User_test',
        'Female',
        NULL,
        'user',
        'active',
        'customer@mail.com',
        '$2y$12$uF.RZ23AyA.w7jIwSaBi1e5U0dJYDd0TjlnDhXfQ2.e8y2nxuQHCe',
        NULL
    ),
    (
        'Trịnh Văn',
        'Male',
        NULL,
        'user',
        'active',
        'trinhvan@gmail.com',
        '3465dgn34',
        '0978238451'
    ),
    (
        'Hồ Văn Minh',
        'Male',
        NULL,
        'user',
        'pendding',
        'vanminh@gmail.com',
        'e43764265',
        '0443764546'
    ),
    (
        'Nguyễn Thị Dầu',
        'Female',
        NULL,
        'user',
        'active',
        'nguyendau@gmail.com',
        'e43764456',
        '0978528453'
    );

/*!40000 ALTER TABLE `users` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- COPY DỮ LIỆU TỪ BẢNG SHIPPINGS TRỞ XUỐNG
-- COPY DỮ LIỆU TỪ BẢNG SHIPPINGS TRỞ XUỐNG
-- ====================================================================================
-- ====================================================================================
-- Table structure for table `brands`
--
DROP TABLE IF EXISTS `brands`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `brands` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(191) NOT NULL,
    `slug` varchar(191) NOT NULL,
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'active',
    `created_at` timestamp NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `brands`
--
LOCK TABLES `brands` WRITE;

/*!40000 ALTER TABLE `brands` DISABLE KEYS */
;

INSERT INTO
    `brands` (`title`, `slug`, `status`)
VALUES
    (
        'Adidas',
        'adidas',
        'active'
    ),
    (
        'Nike',
        'nike',
        'active'
    ),
    (
        'Kappa',
        'kappa',
        'active'
    ),
    (
        'Prada',
        'prada',
        'active'
    ),
    (
        'Polo',
        'brand',
        'active'
    ),
    (
        'Other',
        'other',
        'active'
    );

/*!40000 ALTER TABLE `brands` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- Table structure for table `shippings`
--
DROP TABLE IF EXISTS `shippings`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `shippings` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `type` varchar(191) NOT NULL,
    `price` decimal(8, 2) NOT NULL,
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'active',
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `shippings`
--
LOCK TABLES `shippings` WRITE;

/*!40000 ALTER TABLE `shippings` DISABLE KEYS */
;

INSERT INTO
    `shippings` (`type`, `price`, `status`, `created_at`)
VALUES
    (
        'Address A',
        20.00,
        'active',
        '2025-08-14 04:22:17'
    ),
    (
        'T-ShirtA1',
        30.00,
        'active',
        '2025-08-14 04:22:41'
    ),
    (
        'T-ShirtA2',
        30.00,
        'active',
        '2025-08-15 06:54:04'
    ),
    (
        'Address B',
        45.00,
        'active',
        '2025-08-17 20:50:48'
    ),
    (
        'Address C',
        50.00,
        'active',
        '2025-11-22 16:55:50'
    );

/*!40000 ALTER TABLE `shippings` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
--
-- Table structure for table `orders`
--
DROP TABLE IF EXISTS `orders`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `orders` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `order_number` varchar(191) NOT NULL,
    `sub_total` double(8, 2) NOT NULL,
    `coupon` double(8, 2) DEFAULT NULL,
    `total_amount` double(8, 2) NOT NULL,
    `quantity` int(11) NOT NULL,
    `pay_method` enum('cod', 'paypal', 'cardpay') NOT NULL DEFAULT 'cod',
    `pay_status` enum('paid', 'unpaid') NOT NULL DEFAULT 'unpaid',
    `status` enum('new', 'process', 'delivered', 'cancel') NOT NULL DEFAULT 'new',
    `name` varchar(191) NOT NULL,
    `email` varchar(191) NOT NULL,
    `phone` varchar(191) NOT NULL,
    `country` varchar(191) NOT NULL,
    `post_code` varchar(191) DEFAULT NULL,
    `address1` text NOT NULL,
    `address2` text DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `shipping_id` bigint(20) unsigned DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `orders_order_number_unique` (`order_number`),
    KEY `orders_user_id_foreign` (`user_id`),
    KEY `orders_shipping_id_foreign` (`shipping_id`),
    CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE
    SET
        NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `orders`
--
LOCK TABLES `orders` WRITE;

/*!40000 ALTER TABLE `orders` DISABLE KEYS */
;

/*!40000 ALTER TABLE `orders` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
--
-- Table structure for table `categories`
--
DROP TABLE IF EXISTS `categories`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `categories` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(191) NOT NULL,
    `slug` varchar(191) NOT NULL,
    `summary` text DEFAULT NULL,
    `photo` varchar(191) DEFAULT NULL,
    `is_parent` tinyint(1) NOT NULL DEFAULT 1,
    `parent_id` bigint(20) unsigned DEFAULT NULL,
    `added_by` bigint(20) unsigned DEFAULT NULL,
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'inactive',
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `categories_slug_unique` (`slug`),
    KEY `categories_parent_id_foreign` (`parent_id`),
    KEY `categories_added_by_foreign` (`added_by`),
    CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE
    SET
        NULL
) ENGINE = InnoDB AUTO_INCREMENT = 14 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `categories`
--
LOCK TABLES `categories` WRITE;

/*!40000 ALTER TABLE `categories` DISABLE KEYS */
;

INSERT INTO
    `categories` (
        `title`,
        `slug`,
        `photo`,
        `is_parent`,
        `parent_id`,
        `added_by`,
        `status`
    )
VALUES
    (
        'Men\'s Fashion',
        'mens-fashion',
        '/storage/photos/1/categories/mini-banner1.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Women\'s Fashion',
        'womens-fashion',
        '/storage/photos/1/categories/mini-banner2.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Kid\'s',
        'kids',
        '/storage/photos/1/mini-banner3.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Combo\'s',
        'combos',
        '/storage/photos/1/mini-banner4.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Jogger\'s',
        'joggers',
        '/storage/photos/1/mini-banner5.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'T-shirt\'s',
        't-shirts',
        NULL,
        0,
        1,
        1,
        'active'
    ),
    (
        'Jeans pants',
        'jeans-pants',
        NULL,
        0,
        1,
        1,
        'active'
    ),
    (
        'Sweater & Jackets',
        'sweater-jackets',
        NULL,
        0,
        1,
        1,
        'active'
    ),
    (
        'Rain Coats & Trenches',
        'rain-coats-trenches',
        NULL,
        0,
        1,
        1,
        'active'
    ),
    (
        'Dress',
        'dress',
        NULL,
        0,
        2,
        1,
        'active'
    ),
    (
        'Hoodies and Sweatshirts',
        'hoodies-and-sweatshirts',
        NULL,
        0,
        2,
        1,
        'active'
    ),
    (
        'Tops and Tshirt',
        'tops-and-tshirt',
        NULL,
        0,
        2,
        1,
        'active'
    ),
    (
        'Pants',
        'pants',
        NULL,
        0,
        2,
        1,
        'active'
    ),
    (
        'Shoes',
        'shoes',
        NULL,
        0,
        1,
        1,
        'active'
    ),
    (
        'Cardigans',
        'cardigans',
        NULL,
        0,
        2,
        1,
        'active'
    );

/*!40000 ALTER TABLE `categories` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- Table structure for table `products`
--
DROP TABLE IF EXISTS `products`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `products` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(191) NOT NULL,
    `slug` varchar(191) NOT NULL,
    `color` varchar(191) DEFAULT NULL,
    `summary` text NOT NULL,
    `description` longtext DEFAULT NULL,
    -- `photo` text NOT NULL,
    `photo` text DEFAULT NULL,
    `stock` int(11) NOT NULL DEFAULT 1,
    `size` varchar(191) DEFAULT 'M',
    `condition` enum('default', 'new', 'hot') NOT NULL DEFAULT 'default',
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'inactive',
    `price` double(8, 2) NOT NULL,
    `discount` double(8, 2) NOT NULL,
    `is_featured` tinyint(1) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    `cat_id` bigint(20) unsigned DEFAULT NULL,
    `child_cat_id` bigint(20) unsigned DEFAULT NULL,
    `brand_id` bigint(20) unsigned DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `products_slug_unique` (`slug`),
    KEY `products_brand_id_foreign` (`brand_id`),
    KEY `products_cat_id_foreign` (`cat_id`),
    KEY `products_child_cat_id_foreign` (`child_cat_id`),
    CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE
    SET
        NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `products`
--
LOCK TABLES `products` WRITE;

/*!40000 ALTER TABLE `products` DISABLE KEYS */
;

INSERT INTO
    `products` (
        `title`,
        `slug`,
        `summary`,
        `description`,
        `photo`,
        `stock`,
        `size`,
        `condition`,
        `status`,
        `price`,
        `discount`,
        `is_featured`,
        `cat_id`,
        `child_cat_id`,
        `brand_id`
    )
VALUES
    (
        'Men\'s Retro Slim Fit Straight Jean',
        'mens-retro-slim-fit-straight-jean',
        '<p><span style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">RETRO STYLING. Designed with Retro style in mind, this slim straight jean provides a vintage look for the modern man.</span><br></p>',
        '<ul class=\"a-unordered-list a-vertical a-spacing-small\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item a-size-base a-color-base\" style=\"line-height: 20px !important;\">SLIM FIT. This slim fit straight leg jean is designed with fashion-forward style. Built with a slim fit through the seat and thigh, our Retro jean sits lower on the waist and leaves enough room to fit over your favorite pair of boots.</span></li></ul><ul class=\"a-unordered-list a-vertical a-spacing-small\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item a-size-base a-color-base\" style=\"line-height: 20px !important;\">RETRO STYLING. Designed with Retro style in mind, this slim straight jean provides a vintage look for the modern man. Complete with our signature Retro finishes and slim fit, this jean will keep you looking good for any occasion.</span></li></ul><ul class=\"a-unordered-list a-vertical a-spacing-small\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item a-size-base a-color-base\" style=\"line-height: 20px !important;\">QUALITY MATERIALS. Made from high-quality material, this slim fit straight jean is constructed for comfort, function, and style. Finished with a unique wash technique - whiskering, handsanding, distressing - each style varies in finishing.</span></li></ul><ul class=\"a-unordered-list a-vertical a-spacing-small\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item a-size-base a-color-base\" style=\"line-height: 20px !important;\">ICONIC EMBELLISHMENTS. This premium slim jean is finished with our iconic Wrangler W stitching, leather Wrangler patch on the back pocket, and 1947 rivet on the front pocket. Maintain that effortless classic style with a touch of Retro.</span></li></ul><ul class=\"a-unordered-list a-vertical a-spacing-small\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 18px; color: rgb(15, 17, 17); padding: 0px; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><li style=\"list-style: disc; overflow-wrap: break-word; margin: 0px;\"><span class=\"a-list-item a-size-base a-color-base\" style=\"line-height: 20px !important;\">FIVE POCKET STYLING. Constructed with our classic five-pocket jean styling, these straight leg jean\' s are made with (2) embroidered hip pockets,
        (1) watch pocket,
        and (2) front pockets.< / span > < / li > < / ul > ',
        ' / storage / photos / 1 / mjns.jpg ',
        18,
        ' S,
        M,
        L,
        XL ',
        ' hot ',
        ' active ',
        70.00,
        10.00,
        1,
        1,
        5,
        5
    );

/*!40000 ALTER TABLE `products` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
--
-- Table structure for table `posts`
--
DROP TABLE IF EXISTS `posts`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `posts` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `title` varchar(191) NOT NULL,
    `slug` varchar(191) NOT NULL,
    `description` longtext DEFAULT NULL,
    `summary` text NOT NULL,
    `quote` text DEFAULT NULL,
    `photo` varchar(191) DEFAULT NULL,
    `tags` varchar(191) DEFAULT NULL,
    `status` enum(' active ', ' inactive ') NOT NULL DEFAULT ' active ',
    `added_by` bigint(20) unsigned DEFAULT NULL,
    `post_cat_id` bigint(20) unsigned DEFAULT NULL,
    `post_tag_id` bigint(20) unsigned DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `posts_slug_unique` (`slug`),
    KEY `posts_post_cat_id_foreign` (`post_cat_id`),
    KEY `posts_post_tag_id_foreign` (`post_tag_id`),
    KEY `posts_added_by_foreign` (`added_by`),
    CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE
    SET
        NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `posts`
--
LOCK TABLES `posts` WRITE;

/*!40000 ALTER TABLE `posts` DISABLE KEYS */
;

INSERT INTO
    `posts` (
        `title`,
        `slug`,
        `description`,
        `summary`,
        `photo`,
        `tags`,
        `status`,
        `added_by`,
        `post_cat_id`,
        `post_tag_id`
    )
VALUES
    (
        '
        Where
            can I get some ? ',
        '
        where
            - can - i - get - some ',
        ' < h2 style = \ "margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>',
        '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">It is a long established fact that a reader</span><br></h2>',
        '/storage/photos/1/Blog/blog2.jpg',
        'Enjoy',
        'active',
        2,
        1,
        1
    ),
    (
        'The standard Lorem Ipsum passage, used since the 1500s',
        'the-standard-lorem-ipsum-passage-used-since-the-1500s',
        '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>',
        '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit,</span><br></p>',
        '/storage/photos/1/Blog/blog3.jpg',
        'Like',
        'active',
        3,
        3,
        1
    ),
    (
        'The standard Lorem Ipsum passage,',
        'the-standard-lorem-ipsum-passage',
        '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>',
        '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>',
        '/storage/photos/1/Blog/blog2.jpg',
        'Enjoy',
        'active',
        2,
        4,
        1
    ),
    (
        'Lorem Ipsum is simply',
        'lorem-ipsum-is-simply',
        '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>',
        '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>',
        '/storage/photos/1/Blog/blog3.jpg',
        'Enjoy,2020',
        'active',
        2,
        5,
        1
    );

/*!40000 ALTER TABLE `posts` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- Table structure for table `post_comments`
--
DROP TABLE IF EXISTS `post_comments`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `post_comments` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `comment` text NOT NULL,
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'active',
    `replied_comment` text DEFAULT NULL,
    `parent_id` bigint(20) unsigned DEFAULT NULL,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `post_id` bigint(20) unsigned DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `post_comments_user_id_foreign` (`user_id`),
    KEY `post_comments_post_id_foreign` (`post_id`),
    CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE
    SET
        NULL
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `post_comments`
--
LOCK TABLES `post_comments` WRITE;

/*!40000 ALTER TABLE `post_comments` DISABLE KEYS */
;

INSERT INTO
    `post_comments` (
        `comment`,
        `status`,
        `replied_comment`,
        `parent_id`,
        `user_id`,
        `post_id`
    )
VALUES
    (
        'Testing comment edited',
        'active',
        NULL,
        1,
        1,
        2
    ),
    (
        'testing 2',
        'active',
        NULL,
        1,
        2,
        3
    ),
    (
        'That\' cool',
        'active',
        NULL,
        3,
        1,
        2
    ),
    (
        'nice',
        'active',
        NULL,
        4,
        1,
        2
    ),
    (
        'nice blog',
        'active',
        NULL,
        5,
        6,
        2
    ),
    (
        'nice',
        'active',
        NULL,
        4,
        1,
        3
    ),
    (
        'really',
        'active',
        NULL,
        6,
        2,
        3
    );

/*!40000 ALTER TABLE `post_comments` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- Table structure for table `cache`
--
DROP TABLE IF EXISTS `cache`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `cache` (
    `key` varchar(191) NOT NULL,
    `value` mediumtext NOT NULL,
    `expiration` int(11) NOT NULL,
    PRIMARY KEY (`key`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `cache`
--
LOCK TABLES `cache` WRITE;

/*!40000 ALTER TABLE `cache` DISABLE KEYS */
;

INSERT INTO
    `cache`
VALUES
    ('customer@mail.com|::1', 'i:2;', 1723964839),
    (
        'customer@mail.com|::1:timer',
        'i:1723964839;',
        1723964839
    ),
    ('ong5@gmail.com|::1', 'i:1;', 1723964424),
    (
        'ong5@gmail.com|::1:timer',
        'i:1723964424;',
        1723964424
    );

/*!40000 ALTER TABLE `cache` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--
DROP TABLE IF EXISTS `cache_locks`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `cache_locks` (
    `key` varchar(191) NOT NULL,
    `owner` varchar(191) NOT NULL,
    `expiration` int(11) NOT NULL,
    PRIMARY KEY (`key`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `cache_locks`
--
LOCK TABLES `cache_locks` WRITE;

/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */
;

/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `carts`
--
DROP TABLE IF EXISTS `carts`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `carts` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint(20) unsigned NOT NULL,
    `order_id` bigint(20) unsigned DEFAULT NULL,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `price` double(8, 2) NOT NULL,
    `status` enum('new', 'progress', 'delivered', 'cancel') NOT NULL DEFAULT 'new',
    `quantity` int(11) NOT NULL,
    `amount` double(8, 2) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `carts_product_id_foreign` (`product_id`),
    KEY `carts_user_id_foreign` (`user_id`),
    KEY `carts_order_id_foreign` (`order_id`),
    CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
        CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `carts`
--
LOCK TABLES `carts` WRITE;

/*!40000 ALTER TABLE `carts` DISABLE KEYS */
;

INSERT INTO
    `carts`
VALUES
    (
        6,
        14,
        NULL,
        2,
        63.00,
        'new',
        1,
        63.00,
        '2023-11-28 14:51:26',
        '2023-11-28 15:01:35'
    );

/*!40000 ALTER TABLE `carts` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--
DROP TABLE IF EXISTS `failed_jobs`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `failed_jobs` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `connection` text NOT NULL,
    `queue` text NOT NULL,
    `payload` longtext NOT NULL,
    `exception` longtext NOT NULL,
    `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `failed_jobs`
--
LOCK TABLES `failed_jobs` WRITE;

/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */
;

/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `migrations`
--
DROP TABLE IF EXISTS `migrations`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `migrations` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `migration` varchar(191) NOT NULL,
    `batch` int(11) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 23 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `migrations`
--
LOCK TABLES `migrations` WRITE;

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */
;

INSERT INTO
    `migrations`
VALUES
    (1, '2014_10_12_000000_create_users_table', 1),
    (
        2,
        '2014_10_12_100000_create_password_resets_table',
        1
    ),
    (
        3,
        '2019_08_19_000000_create_failed_jobs_table',
        1
    ),
    (4, '2020_07_10_021010_create_brands_table', 1),
    (5, '2020_07_10_025334_create_banners_table', 1),
    (
        6,
        '2020_07_10_112147_create_categories_table',
        1
    ),
    (7, '2020_07_11_063857_create_products_table', 1),
    (
        8,
        '2020_07_12_073132_create_post_categories_table',
        1
    ),
    (9, '2020_07_12_073701_create_post_tags_table', 1),
    (10, '2020_07_12_083638_create_posts_table', 1),
    (11, '2020_07_13_151329_create_messages_table', 1),
    (
        12,
        '2020_07_14_023748_create_shippings_table',
        1
    ),
    (13, '2020_07_15_054356_create_orders_table', 1),
    (14, '2020_07_15_102626_create_carts_table', 1),
    (
        15,
        '2020_07_16_041623_create_notifications_table',
        1
    ),
    (16, '2020_07_16_053240_create_coupons_table', 1),
    (
        17,
        '2020_07_23_143757_create_wishlists_table',
        1
    ),
    (
        18,
        '2020_07_24_074930_create_product_reviews_table',
        1
    ),
    (
        19,
        '2020_07_24_131727_create_post_comments_table',
        1
    ),
    (20, '2020_08_01_143408_create_settings_table', 1),
    (21, '2024_08_07_074407_create_sessions_table', 2),
    (22, '2024_08_07_084359_create_cache_table', 3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--
DROP TABLE IF EXISTS `password_resets`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `password_resets` (
    `email` varchar(191) NOT NULL,
    `token` varchar(191) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    KEY `password_resets_email_index` (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `password_resets`
--
LOCK TABLES `password_resets` WRITE;

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */
;

/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `product_reviews`
--
DROP TABLE IF EXISTS `product_reviews`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `product_reviews` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `product_id` bigint(20) unsigned DEFAULT NULL,
    `rate` tinyint(4) NOT NULL DEFAULT 0,
    `review` text DEFAULT NULL,
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'active',
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `product_reviews_user_id_foreign` (`user_id`),
    KEY `product_reviews_product_id_foreign` (`product_id`),
    CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE
    SET
        NULL
) ENGINE = InnoDB AUTO_INCREMENT = 21 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `product_reviews`
--
LOCK TABLES `product_reviews` WRITE;

/*!40000 ALTER TABLE `product_reviews` DISABLE KEYS */
;

/*!40000 ALTER TABLE `product_reviews` ENABLE KEYS */
;

UNLOCK TABLES;

--
--
-- Table structure for table `sessions`
--
DROP TABLE IF EXISTS `sessions`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `sessions` (
    `id` varchar(191) NOT NULL,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `ip_address` varchar(45) DEFAULT NULL,
    `user_agent` text DEFAULT NULL,
    `payload` longtext NOT NULL,
    `last_activity` int(11) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `sessions_user_id_index` (`user_id`),
    KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `sessions`
--
LOCK TABLES `sessions` WRITE;

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */
;

INSERT INTO
    `sessions`
VALUES
    (
        'XpGqYwcpOxhu1ugGY2WgdbGtRNE0gLTsI4nFWMX3',
        1,
        '::1',
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36 Edg/127.0.0.0',
        'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiV3habkJIR21yajZKbUJVVUVjSmlxSktmc24zeFRyYm4zeEx1NUM3diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHA6Ly9sb2NhbGhvc3QvYXB0ZWNoLWxhcmF2ZWwtZWNvbW1lcmNlLWRlbW8vcHVibGljL2FkbWluL2Jhbm5lci9jcmVhdGUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjQ6ImF1dGgiO2E6MTp7czoyMToicGFzc3dvcmRfY29uZmlybWVkX2F0IjtpOjE3MjM5NjY5NjM7fX0=',
        1723967143
    );

/*!40000 ALTER TABLE `sessions` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `wishlists`
--
DROP TABLE IF EXISTS `wishlists`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `wishlists` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint(20) unsigned NOT NULL,
    `cart_id` bigint(20) unsigned DEFAULT NULL,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `price` double(8, 2) NOT NULL,
    `quantity` int(11) NOT NULL,
    `amount` double(8, 2) NOT NULL,
    `created_at` timestamp NULL DEFAULT NULL,
    `updated_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `wishlists_product_id_foreign` (`product_id`),
    KEY `wishlists_user_id_foreign` (`user_id`),
    KEY `wishlists_cart_id_foreign` (`cart_id`),
    CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
        CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE
    SET
        NULL
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `wishlists`
--
LOCK TABLES `wishlists` WRITE;

/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */
;

/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Dumping routines for database 'ecommerceadvlara'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;

-- Dump completed on 2024-08-18 17:12:04