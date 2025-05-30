-- dữ liệu mẫu cho products và catergories
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
        'Electronics',
        'electronics',
        NULL,
        1,
        NULL,
        1,
        'active'
    ),
    ('Kitchen', 'kitchen', NULL, 1, NULL, 1, 'active'),
    (
        'Software',
        'software',
        NULL,
        1,
        NULL,
        1,
        'active'
    ),
    (
        'Smartphones',
        'smartphones',
        NULL,
        0,
        1,
        1,
        'active'
    ),
    -- con của Electronics
    ('Tivi', 'tivi', NULL, 0, 1, 1, 'active'),
    -- con của Electronics
    ('Laptops', 'laptops', NULL, 0, 1, 1, 'active'),
    -- con của Electronics
    ('Cookware', 'cookware', NULL, 0, 2, 1, 'active'),
    -- con của Kitchen
    (
        'Appliances',
        'appliances',
        NULL,
        0,
        2,
        1,
        'active'
    );

-- con của Kitchen
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
        `child_cat_id`
    )
VALUES
    (
        'iPhone 14',
        'iphone-14',
        'Latest model of iPhone',
        'Description of iPhone 14',
        NULL,
        50,
        '128GB',
        'new',
        'active',
        999.99,
        50.00,
        1,
        1,
        --cat_id cha là số 1 thuộc mục electronic
        4 -- child_cat_id là 4 thuộc thư mục smartphones
    ),
    (
        'Samsung Galaxy S21',
        'samsung-galaxy-s21',
        'High-end Android smartphone',
        'Description of Galaxy S21',
        NULL,
        40,
        '128GB',
        'new',
        'active',
        799.99,
        40.00,
        0,
        1,
        4
    ),
    (
        'LG Tivi 50 inch',
        'lg-tivi-50',
        'Smart TV 50 inch',
        'Description of LG Tivi',
        NULL,
        20,
        NULL,
        'default',
        'active',
        499.99,
        30.00,
        0,
        1,
        5
    ),
    (
        'Dell XPS 13',
        'dell-xps-13',
        'Laptop for professional use',
        'Description of Dell XPS 13',
        NULL,
        25,
        '13 inch',
        'hot',
        'active',
        1199.99,
        100.00,
        1,
        1,
        6
    ),
    (
        'Non-stick Cookware Set',
        'non-stick-cookware',
        'Kitchen cookware set',
        'Description...',
        NULL,
        15,
        NULL,
        'default',
        'active',
        120.00,
        10.00,
        0,
        2,
        -- cat_id là 2 thuộc mục kitchens
        7 --child_cat_id là 7 thuộc thư mục Cookware
    ),
    (
        'Blender',
        'kitchen-blender',
        'Kitchen blender for smoothies',
        'Description...',
        NULL,
        10,
        NULL,
        'default',
        'active',
        80.00,
        5.00,
        0,
        2,
        8
    );