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
        'Organic And Heathy',
        'organic-and-heathy',
        '/storage/photos/1/banner/Banner_01.jpg',
        -- '<h2><span style=\"font-weight: bold; color: rgb(8, 87, 28);\">Organic And Heathy</span></h2>',
        'Description: Organic And Heathy',
        'active'
    ),
    (
        'Organic And Heathy Food',
        'organic-and-heathy-food',
        '/storage/photos/1/banner/Banner_02.jpg',
        -- '<h2><span style=\"font-weight: bold; color: rgb(8, 87, 28);\">Organic And Heathy Food</span></h2>',
        'Description: Organic And Heathy Food',
        'active'
    ),
    (
        'Enjoy With Healthy Food',
        'enjoy-with-heathy-food',
        '/storage/photos/1/banner/Banner_03.jpg',
        -- '<h2><span style=\"font-weight: bold; color: rgb(8, 87, 28);\">ENJOY WITH HEATHY FOOD</span></h2>',
        'Description: Enjoy With Healthy Food',
        'active'
    ),
    (
        'Pure Green Organic Vegetables, Rich In Vitamins, Good For Heath',
        'pure-green-organic-vegetables',
        '/storage/photos/1/banner/Banner_04.jpg',
        -- '<h2><span style=\"font-weight: bold; color: rgb(8, 87, 28);\">Pure Green Organic Vegetables, Rich In Vitamins, Good For Heath</span></h2>',
        'Description: Pure Green Organic Vegetables',
        'active'
    ),
    (
        'Eat Heathy, Eat Organic',
        'eat-heathy-eat-organic',
        '/storage/photos/1/banner/Banner_05.jpg',
        -- '<h2><span style=\"font-weight: bold; color: rgb(8, 87, 28);\">Eat Heathy, Eat Organic</span></h2>',
        'Description: Eat Heathy, Eat Organic',
        'active'
    ),
    (
        'Organic and Heathy Heathy',
        'organic-and-heathy-heathy',
        '/storage/photos/1/banner/Banner_07.jpg',
        -- '<h2><span style=\"font-weight: bold; color: rgb(8, 87, 28);\">Organic and Heathy Heathy</span></h2>',
        'Description: Organic and Heathy Heathy',
        'active'
    ),
    (
        'Natural Food Vegetarian',
        'natural-food-vegetarian',
        '/storage/photos/1/banner/Banner_08.jpg',
        -- '<h2><span style=\"font-weight: bold; color: rgb(8, 87, 28);\">Natural Food Vegetarian</span></h2>',
        'Description: Natural Food Vegetarian',
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
        'Star Organic farm is commenced in the year 1988. Company is involved in trading and manufacturing a wide range of Organic Products and spices to the consumers all around the global market. Company has wide variety of collection of products lies of
Nutritious cereals, Pulses, Spices and Condiments, Cooking Oils, Fruit Pulps, Agro Products, Oils, Wheat and Wheat Flour, Rice and Rice products and so on.
',
        'Organic - Natural - Safe Food.',
        '/storage/photos/1/setting/logo2.jpg',
        '/storage/photos/1/setting/trolley2.jpg',
        '99 Nguyen Thi Minh Khai, Distric 1, HCM City',
        '+84 123 666 8888',
        'star_organic_food@gmail.com'
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
    `status` enum('active', 'inactive', 'pending') NOT NULL DEFAULT 'active',
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
        'Admin1',
        NULL,
        '/storage/photos/1/admin-icn.png',
        'admin',
        'active',
        'admin1@gmail.com',
        '$2a$12$aIDQFQO/rhmV.woqfUU/pu2ZeSgNsdJFTyolo5A0FbnZe9XkEncZS',
        NULL
    ),
    (
        'Admin2',
        NULL,
        '/storage/photos/1/admin-icn.png',
        'admin',
        'active',
        'admin2@gmail.com',
        '$2a$12$dLKcknq71XebF.ZVwkNWAemR8cJ36vOgD.YOjXVm77b3RNyQeVbOq',
        NULL
    ),
    (
        'Mai Đình Tới',
        'Male',
        NULL,
        'user',
        'active',
        'toi@gmail.com',
        '$2a$12$nFKYVXHZ/658fXIMHxGjPOIJ/3BHIUZE/74Qm4PtQP0s..w8t2aby',
        '0978118449'
    ),
    (
        'User_test',
        'Male',
        NULL,
        'user',
        'active',
        'customer@mail.com',
        '$2y$12$uF.RZ23AyA.w7jIwSaBi1e5U0dJYDd0TjlnDhXfQ2.e8y2nxuQHCe',
        NULL
    ),
    (
        'User_test1',
        'Female',
        NULL,
        'user',
        'active',
        'customer1@mail.com',
        '$2a$12$Psd5sz1woleRCaHk2x/l.eu6/0egAk8WRaDXt3gorJFT.70UY6yRG',
        NULL
    ),
    (
        'User_test2',
        'Female',
        NULL,
        'user',
        'active',
        'customer2@mail.com',
        '$2a$12$UevzQ/1tN7c5WPk4quGrt.hLTliX0qHpuW/lXL8nmWgEglQWpSWNC',
        NULL
    ),
    (
        'Trịnh Văn',
        'Male',
        NULL,
        'user',
        'active',
        'trinhvan@gmail.com',
        '$2a$12$1ZVt57q/C3fKzVWNxq/On.UCw/YAuDaDHZljrssGrFUQfG30pr4/q',
        '0978238451'
    ),
    (
        'Hồ Văn Minh',
        'Male',
        NULL,
        'user',
        'pending',
        'vanminh@gmail.com',
        '$2a$12$w1FCuR0ngEJK8EZo6mPYU.2uEqW2tM3dmTgKPpBeqO0RDYDm9RGiS',
        '0443764546'
    ),
    (
        'Nguyễn Thị Dầu',
        'Female',
        NULL,
        'user',
        'active',
        'nguyendau@gmail.com',
        '$2a$12$/FHMN3Xfmkj4v8A7fHlrTOaAnKFZs7QV1LEXv6nDyzfvkOpD8GvLK',
        '0978528453'
    );

/*!40000 ALTER TABLE `users` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- -- Table structure for table `brands`
-- --
-- DROP TABLE IF EXISTS `brands`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */
-- ;
-- /*!40101 SET character_set_client = utf8 */
-- ;
-- CREATE TABLE `brands` (
--     `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--     `title` varchar(191) NOT NULL,
--     `slug` varchar(191) NOT NULL,
--     `status` enum('active', 'inactive') NOT NULL DEFAULT 'active',
--     `created_at` timestamp NULL DEFAULT current_timestamp,
--     `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
--     `delete_at` timestamp NULL DEFAULT NULL,
--     PRIMARY KEY (`id`),
--     UNIQUE KEY `brands_slug_unique` (`slug`)
-- ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */
-- ;
-- --
-- -- Dumping data for table `brands`
-- --
-- LOCK TABLES `brands` WRITE;
-- /*!40000 ALTER TABLE `brands` DISABLE KEYS */
-- ;
-- INSERT INTO
--     `brands` (`title`, `slug`, `status`)
-- VALUES
--     (
--         'Adidas',
--         'adidas',
--         'active'
--     ),
--     (
--         'Nike',
--         'nike',
--         'active'
--     ),
--     (
--         'Kappa',
--         'kappa',
--         'active'
--     ),
--     (
--         'Prada',
--         'prada',
--         'active'
--     ),
--     (
--         'Polo',
--         'brand',
--         'active'
--     ),
--     (
--         'Other',
--         'other',
--         'active'
--     );
-- /*!40000 ALTER TABLE `brands` ENABLE KEYS */
-- ;
-- UNLOCK TABLES;
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
        'Less than 5km',
        5.00,
        'active',
        '2025-08-14 04:22:17'
    ),
    (
        'Less than 20km',
        10.00,
        'active',
        '2025-08-14 04:22:41'
    ),
    (
        'Less than 50km',
        20.00,
        'active',
        '2025-08-15 06:54:04'
    ),
    (
        'Less than 200km',
        30.00,
        'active',
        '2025-08-17 20:50:48'
    ),
    (
        'Over 200km',
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

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
        'Nutritious cereals',
        'nutritious-cereals',
        '/storage/photos/1/catergories/nutritious-cereals.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Pulses',
        'pulses',
        '/storage/photos/1/catergories/pulses.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Spices and Condiments',
        'spices-and-condiments',
        '/storage/photos/1/catergories/spices-and-condiments.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Cooking Oils',
        'cooking-oils',
        '/storage/photos/1/catergories/cooking-oils.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Fruit Pulps',
        'fruit-pulps',
        '/storage/photos/1/catergories/fruit-pulps.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Agro Products',
        'agro-products',
        '/storage/photos/1/catergories/agro-products.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Oils',
        'oils',
        '/storage/photos/1/catergories/oils.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Wheat and Wheat Flour',
        'wheat-and-wheat-flour',
        '/storage/photos/1/catergories/wheat-and-wheat-flour.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Rice and Rice Products',
        'rice-and-rice-products',
        '/storage/photos/1/catergories/rice-and-rice-products.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Meats',
        'meats',
        '/storage/photos/1/catergories/meat-1.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Milks',
        'milks',
        '/storage/photos/1/catergories/milk-1.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Others',
        'others',
        '/storage/photos/1/catergories/others.jpg',
        1,
        NULL,
        1,
        'active'
    ),
    -- phần chia các thư mục con trong thư mục cha
    -- Pulses id 2
    (
        'Soybeans',
        'soybeans',
        NULL,
        0,
        2,
        1,
        'active'
    ),
    (
        'Greenbeans',
        'greenbeans',
        NULL,
        0,
        2,
        1,
        'active'
    ),
    (
        'Peas',
        'peas',
        NULL,
        0,
        2,
        1,
        'active'
    ),
    (
        'Redbeans',
        'redbeans',
        NULL,
        0,
        2,
        1,
        'active'
    ),
    (
        'Blackbeans',
        'blackbeans',
        NULL,
        0,
        2,
        1,
        'active'
    ),
    -- Agro Products id 6
    (
        'Herbal Tea',
        'herbal-tea',
        NULL,
        0,
        6,
        1,
        'active'
    ),
    (
        'Dried Fruit',
        'dried-fruit',
        NULL,
        0,
        6,
        1,
        'active'
    ),
    (
        'Fruit Wine',
        'fruit-wine',
        NULL,
        0,
        6,
        1,
        'active'
    ),
    -- Categories meat id10: beef, pork,chicken,
    (
        'Porks',
        'porks',
        NULL,
        0,
        10,
        1,
        'active'
    ),
    (
        'Beefs',
        'beefs',
        NULL,
        0,
        10,
        1,
        'active'
    ),
    (
        'Seafoods',
        'seafoods',
        NULL,
        0,
        10,
        1,
        'active'
    ),
    (
        'Dried',
        'dried',
        NULL,
        0,
        10,
        1,
        'active'
    ),
    (
        'Poultrys',
        'poultrys',
        NULL,
        0,
        10,
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
    `photo` text DEFAULT NULL,
    `stock` int(11) NOT NULL DEFAULT 1,
    -- stock hàng tồn kho
    `size` varchar(191) DEFAULT NULL,
    `condition` enum('default', 'new', 'hot') NOT NULL DEFAULT 'default',
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'inactive',
    `price` double(8, 2) NOT NULL,
    `discount` double(8, 2) NOT NULL,
    `is_featured` tinyint(1) NOT NULL,
    -- is_featured sản phẩm nổi bật hay là bán chạy có giá trị là 1 hoạc 0
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    `cat_id` bigint(20) unsigned DEFAULT NULL,
    `child_cat_id` bigint(20) unsigned DEFAULT NULL,
    -- `brand_id` bigint(20) unsigned DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `products_slug_unique` (`slug`),
    -- KEY `products_brand_id_foreign` (`brand_id`),
    KEY `products_cat_id_foreign` (`cat_id`),
    KEY `products_child_cat_id_foreign` (`child_cat_id`),
    -- CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE
    -- SET
    --     NULL,
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
        `child_cat_id` -- `brand_id`
    )
VALUES
    -- agro products cat_id=6 herbaltea id18 driedfuit id19 fuit wine id20
    (
        'Antonin Fels',
        'antonin-fels',
        '<p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Eligendi molestias doloribus nam laborum dicta deleniti quo consequuntur voluptate blanditiis quasi voluptas, magnam explicabo excepturi tempore vel iure harum, voluptatem exercitationem?</p>',
        '<ul >Lorem ipsum dolor sit amet consectetur adipisicing elit. Culpa pariatur, sunt eveniet ex a, doloribus aliquid exercitationem ab officia facere repellat magnam saepe aut consequuntur quis, veniam odio doloremque ducimus.</ul>',
        '/storage/photos/1/products/agro-products/01_antonin-fels.jpg',
        20,
        '100ml',
        'hot',
        'active',
        20.00,
        10.00,
        1,
        6,
        NULL
    ),
    (
        'Hemp Sed',
        'hemp-seed',
        '<p>Apply directly to skin or mix with your favorite moisturizer. For hair, use as a mask or add to conditioner. For nails, massage into cuticles.</p>',
        '<ul >Experience the natural goodness of Organic Hemp Oil, rich in essential fatty acids, vitamins, and antioxidants. This dryy oil deeply moisturizes, softens, and nourishes skin, helping to alleviate dryness. With a balanced ratio of Omega 6, Omega 3, and GLA, it promotes skin suppleness, reduces wrinkles, and rebalances oily skin. </ul>',
        '/storage/photos/1/products/agro-products/02_hemp-seed.jpg',
        50,
        '300ml',
        'hot',
        'active',
        50.00,
        10.00,
        1,
        6,
        19
    ),
    (
        'Hemp Seed 2',
        'hemp-seed2',
        '<p>Apply directly to skin or mix with your favorite moisturizer. For hair, use as a mask or add to conditioner. For nails, massage into cuticles.</p>',
        '<ul >Experience the natural goodness of Organic Hemp Oil, rich in essential fatty acids, vitamins, and antioxidants. This dryy oil deeply moisturizes, softens, and nourishes skin, helping to alleviate dryness. With a balanced ratio of Omega 6, Omega 3, and GLA, it promotes skin suppleness, reduces wrinkles, and rebalances oily skin. </ul>',
        '/storage/photos/1/products/agro-products/03_hemp-seed2.jpg',
        20,
        '300ml',
        'new',
        'active',
        50.00,
        10.00,
        1,
        6,
        19
    ),
    (
        'Fluff',
        'fluff',
        '<p>Apply directly to skin or mix with your favorite moisturizer. For hair, use as a mask or add to conditioner. For nails, massage into cuticles.</p>',
        '<ul >Experience the natural goodness of Organic Hemp Oil, rich in essential fatty acids, vitamins, and antioxidants. This dryy oil deeply moisturizes, softens, and nourishes skin, helping to alleviate dryness. With a balanced ratio of Omega 6, Omega 3, and GLA, it promotes skin suppleness, reduces wrinkles, and rebalances oily skin. </ul>',
        '/storage/photos/1/products/agro-products/04_fluff.jpg',
        15,
        '400ml',
        'hot',
        'active',
        50.00,
        10.00,
        1,
        6,
        NULL
    ),
    (
        'Peppermint essential oil',
        'peppermint-essential-oil',
        '<p>Apply directly to skin or mix with your favorite moisturizer. For hair, use as a mask or add to conditioner. For nails, massage into cuticles.</p>',
        '<ul >Experience the natural goodness of Organic Hemp Oil, rich in essential fatty acids, vitamins, and antioxidants. This dryy oil deeply moisturizes, softens, and nourishes skin, helping to alleviate dryness. With a balanced ratio of Omega 6, Omega 3, and GLA, it promotes skin suppleness, reduces wrinkles, and rebalances oily skin. </ul>',
        '/storage/photos/1/products/agro-products/05_tinhdaubacha.jpg',
        40,
        '400ml',
        'new',
        'active',
        60.00,
        10.00,
        1,
        6,
        NULL
    ),
    (
        'Herbal Tea Type 1',
        'herbal-tea-1',
        '<p>Herbal tea is increasingly popular because it contains antioxidants, reduces pain, stress and many other nutrients that help improve health. Besides, this type of tea does not contain caffeine so people can use it without worrying about insomnia.</p>',
        '<ul >The main ingredients of herbal tea are leaves, stems, branches, flowers, buds, fruits, seeds and roots. These ingredients are used fresh or dried, dried at a certain temperature (usually around 40°C - 60°C). Some types are kept whole or sliced, chopped depending on their effects in each type of tea. </ul>',
        '/storage/photos/1/products/agro-products/herbal-tea-1.jpg',
        23,
        '400g',
        'new',
        'active',
        60.00,
        10.00,
        1,
        6,
        18
    ),
    (
        'Fruit Wine AgaveGarden Type 1',
        'fruit-wine-agavegarden-1',
        '<p>Fruit wines are made from a variety of fruits such as apples, pears, plums, blueberries, strawberries, and even flowers such as dandelions.</p>',
        '<ul >Fruit wines have unique flavors depending on the type of fruit used. For example, apple wine has the delicious flavor of apples, while plum wine has the rich flavor of plums.</ul>',
        '/storage/photos/1/products/agro-products/fruit-wine-agavegarden-1.jpg',
        10,
        '400g',
        'new',
        'active',
        60.00,
        10.00,
        1,
        6,
        20
    ),
    (
        'Fruit Wine AgaveGarden Type 2',
        'fruit-wine-agavegarden-2',
        '<p>Fruit wines are made from a variety of fruits such as apples, pears, plums, blueberries, strawberries, and even flowers such as dandelions.</p>',
        '<ul >Fruit wines have unique flavors depending on the type of fruit used. For example, apple wine has the delicious flavor of apples, while plum wine has the rich flavor of plums.</ul>',
        '/storage/photos/1/products/agro-products/fruit-wine-agavegarden-2.jpg',
        34,
        '400g',
        'hot',
        'active',
        60.00,
        10.00,
        1,
        6,
        20
    ),
    -- cooking oil cat-id 4
    (
        'Anderson Peanut Oil Extraction',
        'anderson-peanut-oil-extraction',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/cooking-oils/01_anderson-peanut-oil-extraction.jpg',
        25,
        '300ml',
        'hot',
        'active',
        76.00,
        10.00,
        1,
        4,
        NULL
    ),
    (
        'Peanut Oil Grupo Campo',
        'peanut-Oil-grupo-campo',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/cooking-oils/02_peanut-Oil-grupo-campo.jpg',
        35,
        '400ml',
        'hot',
        'active',
        20.00,
        10.00,
        1,
        4,
        NULL
    ),
    (
        'Pure Peanut Oil',
        'pure-peanut-oil',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/cooking-oils/03_pure-peanut-oil.jpg',
        40,
        '500ml',
        'hot',
        'active',
        35.00,
        10.00,
        1,
        4,
        NULL
    ),
    (
        'Soyabean Oils',
        'soyabean-oils',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/cooking-oils/04_soyabean-oils.jpg',
        53,
        '500ml',
        'hot',
        'active',
        15.00,
        10.00,
        1,
        4,
        NULL
    ),
    (
        'Top Soybean Oil Oleo Fats',
        'top-soybean oil-oleo-fats',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/cooking-oils/05_top-soybean oil-oleo-fats.jpg',
        15,
        '500ml',
        'hot',
        'active',
        25.00,
        10.00,
        1,
        4,
        NULL
    ),
    -- fruit-pulps cat_id 5
    (
        'Mango Fruit Pulp',
        '01_mango-fruit pulp',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/fruit-pulps/01_mango-fruit pulp.jpg',
        10,
        '500ml',
        'default',
        'active',
        25.00,
        10.00,
        1,
        5,
        NULL
    ),
    (
        'Fresh Juicy Mango Ultimate Refreshing Summer Fruit',
        '02_fresh-juicy-mango-ultimate-refreshing-summer-fruit',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/fruit-pulps/02_fresh-juicy-mango-ultimate-refreshing-summer-fruit.jpg',
        15,
        '500ml',
        'default',
        'active',
        55.00,
        10.00,
        1,
        5,
        NULL
    ),
    (
        'Palm Fruit Pulp',
        '03_palm-fruit-pulp',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/fruit-pulps/03_palm-fruit-pulp.jpg',
        10,
        '500ml',
        'new',
        'active',
        55.00,
        10.00,
        1,
        5,
        NULL
    ),
    (
        'Orange Juice With Pulp',
        '04_orange-juice-with-pulp',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/fruit-pulps/04_orange-juice-with-pulp.jpg',
        10,
        '200ml',
        'new',
        'active',
        55.00,
        10.00,
        1,
        5,
        NULL
    ),
    (
        'Plum Pulp Fruit For Industry',
        '05_plum-pulp-fruit-for-industry',
        '<p>Eucalyptus - Like a combination of wood, mint, and camphor - strong, cleansing, and enticing.</p>',
        '<ul >For aromatherapy use. Please consult manufacturer directions, essential oils book, or other professional reference guide for uses specific to each oil, dilution ratios, and other relevant information.</ul>',
        '/storage/photos/1/products/fruit-pulps/05_plum-pulp-fruit-for-industry.jpg',
        20,
        '200ml',
        'new',
        'active',
        55.00,
        10.00,
        1,
        5,
        NULL
    ),
    -- Meats id = 10 pork 21 beefid22 dried 23 seafood24 poultry25
    (
        'Beef Type 1',
        'beef-1',
        '<p>You will receive three tenderised schnitzels weighing approximately 275 gm. The schnitzel will be vacuum sealed to ensure a shelf life of 14 days from the day they are packaged. </p>',
        '<ul >
        Ethically raised on a regenerative farm where we farm in harmony with nature 100% grass fed for their whole lives Slowly grown until they reach natural maturity.</ul>',
        '/storage/photos/1/products/meats/beef-1.jpg',
        10,
        '200g',
        'new',
        'active',
        55.00,
        10.00,
        1,
        10,
        22
    ),
    (
        'Fresh Pork Type 1',
        'fresh-pork-1',
        '<p>Our Organic Pork Chops have rave reviews from our customers who love their tender, juicy texture and delicious flavor.</p>',
        '<ul >Achieve a delectable, natural, sweet, and nutty flavor by pan-searing and then oven-roasting these chops. Whether you prefer to grill, bake, or pan-sear these chops, ensure they reach an internal temperature of 145°F for an irresistible result.</ul>',
        '/storage/photos/1/products/meats/fish-1.jpg',
        10,
        '200g',
        'new',
        'active',
        55.00,
        10.00,
        1,
        10,
        24
    ),
    (
        'Organic Slow Cook Meat',
        'Organic-Slow-Cook-Meat',
        '<p>Our Organic Pork Chops have rave reviews from our customers who love their tender, juicy texture and delicious flavor.</p>',
        '<ul >Achieve a delectable, natural, sweet, and nutty flavor by pan-searing and then oven-roasting these chops. Whether you prefer to grill, bake, or pan-sear these chops, ensure they reach an internal temperature of 145°F for an irresistible result.</ul>',
        '/storage/photos/1/products/meats/Organic-Slow-Cook-Meat.jpg',
        30,
        '500g',
        'new',
        'active',
        55.00,
        10.00,
        1,
        10,
        25
    ),
    (
        'Fish Type 1',
        'fish-1',
        '<p>Our Organic Fish Chops have rave reviews from our customers who love their tender, juicy texture and delicious flavor.</p>',
        '<ul >Achieve a delectable, natural, sweet, and nutty flavor by pan-searing and then oven-roasting these chops. Whether you prefer to grill, bake, or pan-sear these chops, ensure they reach an internal temperature of 145°F for an irresistible result.</ul>',
        '/storage/photos/1/products/meats/fish-1.jpg',
        10,
        '200ml',
        'new',
        'active',
        55.00,
        10.00,
        1,
        10,
        21
    ),
    --  Milks id11
    (
        'Milk Type 1',
        'milk-1',
        '<p>Daioni flavoured milk drinks come in delicious banana. We use organic semi-skimmed milk that is less than two per cent fat, they are low in sugar and we never use artificial colours or flavours. Tastes fresh but does not need refridgeration, which makes it great for lunch boxes. Our fresh whole, semi-skimmed and skimmed organic Daioni milk is available in two litre, one litre and 500 ml polybottles. And we supply fresh organic double cream too.</p>',
        '<ul >Ingredients: Semi skimmed milk (94.3%), Sugar, Rice starch, Natural banana flavour, Stabiliser (Carageenan) ( = Approved non-organic ingredient).</ul>',
        '/storage/photos/1/products/milks/milk-1.jpg',
        20,
        '200ml',
        'new',
        'active',
        15.00,
        5.00,
        1,
        10,
        NULL
    ),
    (
        'Milk Type 2',
        'milk-2',
        '<p>Daioni flavoured milk drinks come in delicious banana. We use organic semi-skimmed milk that is less than two per cent fat, they are low in sugar and we never use artificial colours or flavours. Tastes fresh but does not need refridgeration, which makes it great for lunch boxes. Our fresh whole, semi-skimmed and skimmed organic Daioni milk is available in two litre, one litre and 500 ml polybottles. And we supply fresh organic double cream too.</p>',
        '<ul >Ingredients: Semi skimmed milk (94.3%), Sugar, Rice starch, Natural banana flavour, Stabiliser (Carageenan) ( = Approved non-organic ingredient).</ul>',
        '/storage/photos/1/products/milks/milk-2.jpg',
        10,
        '200ml',
        'new',
        'active',
        15.00,
        5.00,
        1,
        10,
        NULL
    ),
    (
        'Milk Type 4',
        'milk-4',
        '<p>Daioni flavoured milk drinks come in delicious banana. We use organic semi-skimmed milk that is less than two per cent fat, they are low in sugar and we never use artificial colours or flavours. Tastes fresh but does not need refridgeration, which makes it great for lunch boxes. Our fresh whole, semi-skimmed and skimmed organic Daioni milk is available in two litre, one litre and 500 ml polybottles. And we supply fresh organic double cream too.</p>',
        '<ul >Ingredients: Semi skimmed milk (94.3%), Sugar, Rice starch, Natural banana flavour, Stabiliser (Carageenan) ( = Approved non-organic ingredient).</ul>',
        '/storage/photos/1/products/milks/milk-4.jpg',
        10,
        '200ml',
        'new',
        'active',
        15.00,
        5.00,
        1,
        10,
        NULL
    ),
    -- nutritious-cereals id1
    (
        'Breakfast Cereals 1',
        '01_breakfast-cereals',
        '<p>Breakfast cereal is a category of food, including food products, made from processed cereal grains, that are eaten as part of breakfast or as a snack food, primarily in Western societies.</p>',
        '<ul >This is a list of breakfast cereals. Many cereals are trademarked brands of large companies, such as Kellanova, WK Kellogg Co, General Mills, Malt-O-Meal, Nestlé, Quaker Oats and Post Consumer Brands, but similar equivalent products are often sold by other manufacturers and as store brands.</ul>',
        '/storage/photos/1/products/nutritious-cereals/01_breakfast-cereals.jpg',
        10,
        '300g',
        'hot',
        'active',
        45.00,
        5.00,
        1,
        1,
        NULL
    ),
    (
        'Healthiest-cereals',
        'healthiest-cereals',
        '<p>Breakfast cereal is a category of food, including food products, made from processed cereal grains, that are eaten as part of breakfast or as a snack food, primarily in Western societies.</p>',
        '<ul >This is a list of breakfast cereals. Many cereals are trademarked brands of large companies, such as Kellanova, WK Kellogg Co, General Mills, Malt-O-Meal, Nestlé, Quaker Oats and Post Consumer Brands, but similar equivalent products are often sold by other manufacturers and as store brands.</ul>',
        '/storage/photos/1/products/nutritious-cereals/05_healthiest-cereals.jpg',
        40,
        '300g',
        'new',
        'active',
        35.00,
        5.00,
        1,
        1,
        NULL
    ),
    (
        'Cereals',
        '07_cereals',
        '<p>Breakfast cereal is a category of food, including food products, made from processed cereal grains, that are eaten as part of breakfast or as a snack food, primarily in Western societies.</p>',
        '<ul >This is a list of breakfast cereals. Many cereals are trademarked brands of large companies, such as Kellanova, WK Kellogg Co, General Mills, Malt-O-Meal, Nestlé, Quaker Oats and Post Consumer Brands, but similar equivalent products are often sold by other manufacturers and as store brands.</ul>',
        '/storage/photos/1/products/nutritious-cereals/07_cereals.jpg',
        10,
        '300g',
        'default',
        'active',
        20.00,
        10.00,
        1,
        1,
        NULL
    ),
    -- Oil id 7
    (
        'Original Swiss Just Organic Ong 10ml',
        '02_original-swiss-just-organic-ong-10ml',
        '<p>Are you looking for the perfect organic essential oil set for yourself or a friend? Well look no further! Plant Therapy s Top 6 Organic Set includes our most popular organic essential oils in one set! You will be happy you chose our Top 6 Organic Set! The Top 6 Organic Set contains 10 mL each of Eucalyptus Globulus, Lavender, Lemon, Peppermint, Sweet Orange, and Tea Tree. </p>',
        '<ul >This set includes USDA Certified Organic essential oils. These oils are free from GMOs and the plants grow freely without the aid of synthetic fertilizers and in soil that is clean of prohibited substances, such as harmful pesticides. When you purchase a certified organic product, you are also helping to conserve biodiversity! This helps to ensure our natural landscapes and their ecosystems are maintained and intact for generations to come.</ul>',
        '/storage/photos/1/products/oils/02_original-swiss-just-organic-ong-10ml.jpg ',
        10,
        '200ml',
        'hot',
        'active',
        25.00,
        10.00,
        1,
        7,
        NULL
    ),
    (
        'Organic Essential Oils',
        'organic-essential-oils',
        '<p>Are you looking for the perfect organic essential oil set for yourself or a friend? Well look no further! Plant Therapy s Top 6 Organic Set includes our most popular organic essential oils in one set! You will be happy you chose our Top 6 Organic Set! The Top 6 Organic Set contains 10 mL each of Eucalyptus Globulus, Lavender, Lemon, Peppermint, Sweet Orange, and Tea Tree. </p>',
        '<ul >This set includes USDA Certified Organic essential oils. These oils are free from GMOs and the plants grow freely without the aid of synthetic fertilizers and in soil that is clean of prohibited substances, such as harmful pesticides. When you purchase a certified organic product, you are also helping to conserve biodiversity! This helps to ensure our natural landscapes and their ecosystems are maintained and intact for generations to come.</ul>',
        '/storage/photos/1/products/oils/03_organic-essential-oils.jpg ',
        10,
        '200ml',
        'hot',
        'active',
        25.00,
        10.00,
        1,
        7,
        NULL
    ),
    (
        'Organic Tamanu Oil',
        'organic-tamanu-oil',
        '<p>Tamanu Oil is revered for its outstanding healing, skin-regeneration, skin-repair, anti-inflammatory, and anti-aging benefits. It is particularly well known for treating scars, blemishes, stretch marks, and dark circles. Used in hair-care, it promotes scalp health and controls dandruff.</p>',
        '<ul >Our Tamanu Oil is carefully extracted using cold-pressed extraction method, with no further processing, deodorizing, or decolorizing, to preserve its natural nutrients.</ul>',
        '/storage/photos/1/products/oils/05_organic-tamanu-oil.jpg ',
        10,
        '100ml',
        'hot',
        'active',
        30.00,
        20.00,
        1,
        7,
        NULL
    ),
    -- Pulses cat_id=2 soybeans id13, greenbeans id14, peas 15,redbeans 16, blackbeans 17
    (
        'Organic Green Gram Split',
        '01_organic-green-gram-split',
        '<p>Moong is at the very core of the Saatvik diet. This pulse is known for its nourishing properties and its use as a fasting food favoured by yogis.</p>',
        '<ul >Our kidney beans can be used for dry retail packing or for canning. Our kidney beans are an excellent ingredient in ready-made meals, salads, soups and other dishes</ul>',
        '/storage/photos/1/products/pulses/01_organic-green-gram-split.jpg ',
        30,
        '500g',
        'hot',
        'active',
        70.00,
        20.00,
        1,
        2,
        14
    ),
    (
        'Black Matpe',
        '03_black-matpe',
        '<p>Moong is at the very core of the Saatvik diet. This pulse is known for its nourishing properties and its use as a fasting food favoured by yogis.</p>',
        '<ul >Our kidney beans can be used for dry retail packing or for canning. Our kidney beans are an excellent ingredient in ready-made meals, salads, soups and other dishes</ul>',
        '/storage/photos/1/products/pulses/03_black-matpe.jpg ',
        10,
        '300g',
        'new',
        'active',
        30.00,
        10.00,
        1,
        2,
        17
    ),
    (
        'Red Lentils Split',
        'red-lentils-split',
        '<p>Moong is at the very core of the Saatvik diet. This pulse is known for its nourishing properties and its use as a fasting food favoured by yogis.</p>',
        '<ul >Our kidney beans can be used for dry retail packing or for canning. Our kidney beans are an excellent ingredient in ready-made meals, salads, soups and other dishes</ul>',
        '/storage/photos/1/products/pulses/05_red-lentils-split.jpg ',
        10,
        '200g',
        'new',
        'active',
        30.00,
        5.00,
        1,
        2,
        16
    ),
    (
        'Bengal Gram Dal',
        'bengal-gram-dal',
        '<p>Moong is at the very core of the Saatvik diet. This pulse is known for its nourishing properties and its use as a fasting food favoured by yogis.</p>',
        '<ul >Our kidney beans can be used for dry retail packing or for canning. Our kidney beans are an excellent ingredient in ready-made meals, salads, soups and other dishes</ul>',
        '/storage/photos/1/products/pulses/06_bengal-gram-dal.jpg ',
        10,
        '200g',
        'new',
        'active',
        20.00,
        5.00,
        1,
        2,
        13
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
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'active',
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
        'Organic Lentils',
        'organic-lentils',
        '<p style="text-align: justify; font-family: Open Sans, Arial, sans-serif; font-size: 14px;">
        Tradin Organic supplies a wide variety of organic lentils, including brown, red, green, yellow, French, and beluga lentils.
        These are available in split, polished, or flour form. Lentils are a low-calorie, high-protein food, sourced from Canada, Italy, and Turkey.
    </p>',
        '<p style="text-align: justify; font-family: Open Sans, Arial, sans-serif; font-size: 14px;">
        Lentils: a protein-rich, low-calorie organic ingredient used in soups, meals, and flour production.
    </p>',
        '/storage/photos/1/posts/organic-lentils.jpg',
        'Enjoy',
        'active',
        1,
        2,
        1
    ),
    (
        'Organic Chickpeas',
        'organic-chickpeas',
        '<p style="text-align: justify; font-family: Open Sans, Arial, sans-serif; font-size: 14px;">
        Our chickpeas from Turkey and Italy are rich in fiber and protein. Commonly used in hummus and falafel, they are also ideal for soups, sauces, spreads, and can be milled into flour.
    </p>',
        '<p style="text-align: justify; font-family: Open Sans, Arial, sans-serif; font-size: 14px;">
        Chickpeas: nutritious, versatile, and great for hummus, soups, and flour.
    </p>',
        '/storage/photos/1/posts/organic-chickpeas.jpg',
        'Like',
        'active',
        2,
        3,
        1
    ),
    (
        'Organic Beans',
        'organic-beans',
        '<p style="text-align: justify; font-family: Open Sans, Arial, sans-serif; font-size: 14px;">
        We offer organic red and white kidney beans, navy, black turtle, mung, and adzuki beans. Ideal for ready meals, salads, soups, or retail packaging. Sourced globally, including from China and Ethiopia.
    </p>',
        '<p style="text-align: justify; font-family: Open Sans, Arial, sans-serif; font-size: 14px;">
        Beans: a key organic protein source, excellent in salads, meals, and soups.
    </p>',
        '/storage/photos/1/posts/organic-beans.jpg',
        'Enjoy',
        'active',
        1,
        2,
        4
    ),
    (
        'Ingredients and Uses of Herbal Teas',
        'ingredients-and-uses-of-herbal-teas',
        '<p style="text-align: justify; font-family: Open Sans, Arial, sans-serif; font-size: 14px;">
        Herbal teas help in weight loss, relaxation, and immunity. Made from natural ingredients like flowers and herbs, they are caffeine-free and rich in antioxidants. Popular among all ages.
    </p>',
        '<p style="text-align: justify; font-family: Open Sans, Arial, sans-serif; font-size: 14px;">
        Herbal tea: healthy, calming, and packed with natural benefits.
    </p>',
        '/storage/photos/1/posts/herbal-teas-1.jpg',
        'Enjoy-2022',
        'active',
        2,
        2,
        5
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

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
        'That is cool',
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
    `rate` tinyint(4) NOT NULL DEFAULT 0,
    `review` text DEFAULT NULL,
    `status` enum('active', 'inactive') NOT NULL DEFAULT 'active',
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `product_id` bigint(20) unsigned DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `product_reviews_user_id_foreign` (`user_id`),
    KEY `product_reviews_product_id_foreign` (`product_id`),
    CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE
    SET
        NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

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

-- ====================================================================================
-- ====================================================================================
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
    `price` double(8, 2) NOT NULL,
    `status` enum('new', 'progress', 'delivered', 'cancel') NOT NULL DEFAULT 'new',
    `quantity` int(11) NOT NULL,
    `amount` double(8, 2) NOT NULL,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `product_id` bigint(20) unsigned NOT NULL,
    `order_id` bigint(20) unsigned DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `carts_product_id_foreign` (`product_id`),
    KEY `carts_user_id_foreign` (`user_id`),
    KEY `carts_order_id_foreign` (`order_id`),
    CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE
    SET
        NULL,
        CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
        CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `carts`
--
LOCK TABLES `carts` WRITE;

/*!40000 ALTER TABLE `carts` DISABLE KEYS */
;

INSERT INTO
    `carts` (`price`, `status`, `quantity`, `amount`)
VALUES
    (
        66.00,
        'new',
        2,
        5
    ),
    (
        77.00,
        'progress',
        1,
        9
    ),
    (
        75.00,
        'delivered',
        5,
        20
    );

/*!40000 ALTER TABLE `carts` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
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
    `price` double(8, 2) NOT NULL,
    `quantity` int(11) NOT NULL,
    `amount` double(8, 2) NOT NULL,
    `product_id` bigint(20) unsigned NOT NULL,
    `cart_id` bigint(20) unsigned DEFAULT NULL,
    `user_id` bigint(20) unsigned DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    `updated_at` timestamp NULL DEFAULT current_timestamp ON UPDATE current_timestamp,
    `delete_at` timestamp NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

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

-- ====================================================================================
-- ====================================================================================
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

-- ====================================================================================
-- ====================================================================================
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
    -- `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
    `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
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

-- ====================================================================================
-- ====================================================================================
--
-- Table structure for table `jobs`
--
DROP TABLE IF EXISTS `jobs`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `jobs` (
    -- viết theo migration
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `queue` VARCHAR(255) NOT NULL,
    `payload` LONGTEXT NOT NULL,
    `attempts` TINYINT UNSIGNED NOT NULL,
    `reserved_at` INT UNSIGNED DEFAULT NULL,
    `available_at` INT UNSIGNED NOT NULL,
    `created_at` INT UNSIGNED NOT NULL,
    -- cách viết khác
    -- `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    -- `queue` text NOT NULL,
    -- `payload` longtext NOT NULL,
    -- `attempts` tinyint(3) unsigned NOT NULL,
    -- `reserved_at` timestamp NULL DEFAULT NULL,
    -- `available_at` timestamp NULL DEFAULT NULL,
    -- -- `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
    -- `created_at` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `jobs_queue_index` (`queue`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `jobs`
--
LOCK TABLES `jobs` WRITE;

/*!40000 ALTER TABLE `jobs` DISABLE KEYS */
;

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
-- job_batches
--
-- Table structure for table `job_batches`
--
DROP TABLE IF EXISTS `job_batches`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `job_batches` (
    `id` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `total_jobs` INT NOT NULL,
    `pending_jobs` INT NOT NULL,
    `failed_jobs` INT NOT NULL,
    `failed_job_ids` LONGTEXT NOT NULL,
    `options` MEDIUMTEXT DEFAULT NULL,
    `cancelled_at` INT DEFAULT NULL,
    `created_at` INT NOT NULL,
    `finished_at` INT DEFAULT NULL,
    -- `id` varchar(255) NOT NULL,
    -- `name` text NOT NULL,
    -- `total_jobs` int(11) NOT NULL,
    -- `pending_jobs` int(11) NOT NULL,
    -- `failed_jobs` int(11) NOT NULL,
    -- `failed_job_ids` longtext NOT NULL,
    -- `options` mediumtext NULL,
    -- `cancelled_at` timestamp NOT NULL DEFAULT current_timestamp,
    -- `finished_at` timestamp NOT NULL DEFAULT current_timestamp,
    -- `created_at` timestamp NOT NULL DEFAULT current_timestamp,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `job_batches`
--
LOCK TABLES `job_batches` WRITE;

/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */
;

/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `migrations`
--
LOCK TABLES `migrations` WRITE;

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */
;

INSERT INTO
    `migrations` (`migration`, `batch`)
VALUES
    ('2014_10_12_000000_create_users_table', 1),
    (
        '2014_10_12_100000_create_password_resets_table',
        1
    ),
    (
        '2019_08_19_000000_create_failed_jobs_table',
        1
    ),
    ('2020_07_10_021010_create_brands_table', 1),
    ('2020_07_10_025334_create_banners_table', 1),
    (
        '2020_07_10_112147_create_categories_table',
        1
    ),
    ('2020_07_11_063857_create_products_table', 1),
    (
        '2020_07_12_073132_create_post_categories_table',
        1
    ),
    ('2020_07_12_073701_create_post_tags_table', 1),
    ('2020_07_12_083638_create_posts_table', 1),
    ('2020_07_13_151329_create_messages_table', 1),
    (
        '2020_07_14_023748_create_shippings_table',
        1
    ),
    ('2020_07_15_054356_create_orders_table', 1),
    ('2020_07_15_102626_create_carts_table', 1),
    (
        '2020_07_16_041623_create_notifications_table',
        1
    ),
    ('2020_07_16_053240_create_coupons_table', 1),
    (
        '2020_07_23_143757_create_wishlists_table',
        1
    ),
    (
        '2020_07_24_074930_create_product_reviews_table',
        1
    ),
    (
        '2020_07_24_131727_create_post_comments_table',
        1
    ),
    ('2020_08_01_143408_create_settings_table', 1),
    ('2024_08_07_074407_create_sessions_table', 2),
    ('2024_08_07_084359_create_cache_table', 3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */
;

UNLOCK TABLES;

-- ====================================================================================
-- ====================================================================================
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

-- ====================================================================================
-- ====================================================================================
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

-- ====================================================================================
-- ====================================================================================
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