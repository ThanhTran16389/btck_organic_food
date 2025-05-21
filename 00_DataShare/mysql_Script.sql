-- USE MASTER
-- GO
-- 
CREATE DATABASE IF NOT EXISTS btck_shopqa;
USE btck_shopqa;
-- --
-- TẠO BẢNG PHANLOAI-categories
CREATE TABLE IF NOT EXISTS categories
(
cat_id INT AUTO_INCREMENT PRIMARY KEY,
category VARCHAR(50)
);

-- TẠO BẢNG KICH THƯỚC- sizes
CREATE TABLE IF NOT EXISTS sizes
(
size_id INT AUTO_INCREMENT PRIMARY KEY,
sizes VARCHAR(50)
);

-- TẠO BẢNG HANGHOA - products
CREATE TABLE IF NOT EXISTS products
(
pro_id CHAR(10) PRIMARY KEY,
product_name VARCHAR(50),
description VARCHAR (255),
size_id INT,
color VARCHAR(50),
styles VARCHAR (255),
price DECIMAL (10,2),
quantity INT,
cat_id INT
);
-- foreign key cat_id references categories(cat_id)


-- TẠO BẢNG NHACUNGCAP - supplier
CREATE TABLE IF NOT EXISTS supplier
(
sup_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
address VARCHAR(100),
phone CHAR(15)
);

-- TẠO BẢNG HOADON_NCC - supplier_order
CREATE TABLE IF NOT EXISTS supplier_order
(
sup_order_id INT AUTO_INCREMENT PRIMARY KEY,
date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
total_price DECIMAL (10,2),
status_pay CHAR(10),
sup_id INT,
emp_id CHAR(10)
);

-- TẠO BẢNG HOADONMUA: order_buy = CHI TIẾT BẢNG HÓA ĐƠN NCC + HÀNG HÓA
CREATE TABLE IF NOT EXISTS order_buy
(
sup_order_id INT ,
pro_id CHAR(10),
deadline DATETIME,
quantity INT,
price DECIMAL (10,2),
pay_method CHAR(20),
PRIMARY KEY (sup_order_id,pro_id)
);

-- TẠO BẢNG KHACHHANG - customers
CREATE TABLE IF NOT EXISTS customers
(
cus_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
gender enum('Male','Female'),
address VARCHAR(100),
email VARCHAR (100) UNIQUE,
password VARCHAR(255),
phone CHAR(15) UNIQUE,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
email_verified_at DATETIME null

);

-- TẠO BẢNG HOADON_KH - customer_order
CREATE TABLE IF NOT EXISTS customer_order
(
cus_order_id INT AUTO_INCREMENT PRIMARY KEY,
date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
total_price DECIMAL (10,2),
status_pay CHAR(10),
cus_id INT,
emp_id CHAR(10)
);

-- TẠO BẢNG HOADONBAN - order_sell
CREATE TABLE IF NOT EXISTS order_sell
(
cus_order_id INT,
pro_id CHAR(10),
deadline DATETIME,
quantity INT,
price DECIMAL (10,2),
pay_method CHAR(20),
PRIMARY KEY (cus_order_id,pro_id)
);

-- TẠO BẢNG DANHGIA_SP - reviews
CREATE TABLE IF NOT EXISTS reviews
(
cus_id INT,
pro_id CHAR(10),
score INT,
date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
content VARCHAR(255),
PRIMARY KEY (cus_id,pro_id)
);

-- TẠO BẢNG NHANVIEN - employees
CREATE TABLE IF NOT EXISTS employees
(
emp_id CHAR(10) PRIMARY KEY,
emp_name VARCHAR(50),
manager_id CHAR(10),
address VARCHAR(100),
sal_id CHAR(10)
);
-- TẠO BẢNG BANGLUONG - salary
CREATE TABLE IF NOT EXISTS salary
(
sal_id INT AUTO_INCREMENT PRIMARY KEY,
grade DECIMAL (10,2)
);
-- TẠO BẢNG GIỎ HÀNG - carts
CREATE TABLE IF NOT EXISTS carts
(
cart_id INT AUTO_INCREMENT PRIMARY KEY,
date_create TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
date_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
cus_id INT 
);

-- -----------------------------------

-- TẠO LIÊN KẾT:
ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (cat_id)
REFERENCES categories(cat_id);

ALTER TABLE products
ADD CONSTRAINT FK_products_sizes
FOREIGN KEY (size_id)
REFERENCES sizes(size_id);

-- FOREIGN KEY (user_id) REFERENCES users(id)
-- 
ALTER TABLE supplier_order
ADD CONSTRAINT fk_supplier_order_supplier
FOREIGN KEY (sup_id)
REFERENCES supplier(sup_id);

-- liên kết với bản nhân viên

ALTER TABLE supplier_order
ADD CONSTRAINT fk_supplier_order_employees
FOREIGN KEY (emp_id)
REFERENCES employees(emp_id);

-- Liên kết bảng hóa đơn mua order_buy
-- 
ALTER TABLE order_buy
ADD CONSTRAINT fk_order_buy_supplier_order
FOREIGN KEY (sup_order_id)
REFERENCES supplier_order(sup_order_id);
--
ALTER TABLE order_buy
ADD CONSTRAINT fk_order_buy_products
FOREIGN KEY (pro_id)
REFERENCES products(pro_id);


-- Liên kết bảng hóa đơn khách hàng:

ALTER TABLE customer_order
ADD CONSTRAINT fk_customer_order_customers
FOREIGN KEY (cus_id)
REFERENCES customers(cus_id);

ALTER TABLE customer_order
ADD CONSTRAINT fk_customer_order_employees
FOREIGN KEY (emp_id)
REFERENCES employees(emp_id);
-- 
-- liên kết bảng hóa đơn bán order_sell
ALTER TABLE order_sell
ADD CONSTRAINT fk_order_sell_cus_order_id
FOREIGN KEY (cus_order_id)
REFERENCES customer_order(cus_order_id);

ALTER TABLE order_sell 
ADD CONSTRAINT fk_order_sell_products
FOREIGN KEY (pro_id)
REFERENCES products(pro_id);


-- Tạo liên kết bản reviews
-- 
ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_customers
FOREIGN KEY (cus_id)
REFERENCES customers(cus_id);

ALTER TABLE reviews
ADD CONSTRAINT fk_reviews_products
FOREIGN KEY (pro_id)
REFERENCES products(pro_id);
-- 
-- Tạo liên kết bảng carts
ALTER TABLE carts
ADD CONSTRAINT fk_carts_customers
FOREIGN KEY (cus_id)
REFERENCES customers(cus_id);

-- Tạo liên kết bản nhân viên

ALTER TABLE employees
ADD CONSTRAINT fk_employees_salary
FOREIGN KEY (sal_id)
REFERENCES salary(sal_id);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_manager_id
FOREIGN KEY (manager_id)
REFERENCES employees(emp_id);

-- NHẬP LIỆU CƠ BẢN
INSERT INTO categories (category)
VALUES 
('Men'),
('Women'),
('Combos'),
('Joggers');
INSERT INTO sizes (sizes)
VALUES 
('S'),('M'),('L'),('XXS'),('XS'),('XL'),('XXL'),('3XL'),('4XL');

INSERT INTO supplier (name,address,phone )
VALUES 
('Viet Tien','KCN Phú An Thanh','0978166949'),
('An Phuoc','Long An, Viêt Nam','0978567949'),
('Gucci','KCN Nha Bè','0846166949'),
('Chanel','Nhơn Trạch Đồng Nai','0846166124'),
('Dior','Mỹ Phước Binh Dương','0656166949')
;

INSERT INTO customers (name ,gender ,address ,email ,password ,phone ,created_at ,updated_at )
VALUES 
('Mai Đình Tới','Male','Bình Tân','toi@gmail.com','cv1256599','0978118449','2025/2/25','2025/5/25'),
('Nguyễn Thị Loan','Female','Tân Phú','loanthi@gmail.com','ahb235447','0971248450','2025/3/12','2025/4/18'),
('Trịnh Văn','Male','Đồng Nai','trinhvan@gmail.com','3465dgn34','0978238451','2025/4/20','2025/7/4'),
('Hồ Văn Minh','Male','Bình Phước','vanminh@gmail.com','e43764265','0443764546','2025/10/10','2025/11/18'),
('Mai Đình Tới','Male','Bình Tân','nguyendau@gmail.com','e43764456','0978528453','2025/7/15','2025/9/6')
;

INSERT INTO salary (sal_id ,grade )
VALUES 
('SA01',2000),('SA02',3000),('SA03',4000),('SA04',5000),('SA05',10000),('SA06',20000);

INSERT INTO employees (emp_id ,emp_name,manager_id ,address ,sal_id )
VALUES 
('NV001','NGUYỄN VĂN A','NV001','TÂN PHÚ','SA02'),
('NV002','HỒ VĂN ĐẠI','NV002','BÌNH THẠNH','SA02'),
('NV003','LÊ TINH TẦM','NV001','QUẬN 8','SA03'),
('NV004','VÓ THI THU','NV002','TÂN PHÚ','SA03'),
('NV005','NGUYỄN VĂN A','NV002','TÂN PHÚ','SA06')
;
INSERT INTO carts (date_create,date_update,cus_id)
VALUES 
('2025/2/12','2025/3/12',1),
('2025/2/15','2025/3/15',2),
('2025/3/5','2025/4/5',1),
('2025/3/20','2025/4/20',4),
('2025/4/2','2025/4/25',5)
;

INSERT INTO products (pro_id ,product_name ,size_id ,color ,styles ,price ,quantity ,cat_id )
VALUES 
('J001','Printed T-Shirts',1,'Pink','Classic',77,10,2),
('J002','Jeans',3,'Red','Bussiness',29,20,1),
('S001','Shirts',2,'Green','Sports',35,7,1),
('S002','Black Shorts',6,'Blue','Elegant',20,3,3),
('T001','White T-Shirts',3,'White','Formal',85,9,4)
;

INSERT INTO supplier_order (date_create ,status_pay,sup_id ,emp_id )
VALUES 
('2025/02/05','Pending',1,'NV001'),
('2025/04/07','Checking',1,'NV003'),
('2025/04/20','Shipping',1,'NV001'),
('2025/04/28','Cancel',1,'NV004'),
('2025/05/02','Done',1,'NV002')
;

INSERT INTO order_buy (sup_order_id,pro_id,deadline, quantity,price)
VALUES 
(2,'J001','2025/04/05',30,900),
(3,'J001','2025/05/17',20,800),
(5,'S002','2025/06/25',50,700),
(1,'T001','20250701',40,850)
;

INSERT INTO customer_order (date_create ,total_price,status_pay,cus_id,emp_id)
VALUES 
('2025/04/15',250,'Checking',1,'NV002'),
('2025/03/10',400,'Shipping',3,'NV001'),
('2025/03/15',280,'Checking',5,'NV003'),
('2025/04/15',300,'Checking',2,'NV002')
;

INSERT INTO order_sell (cus_order_id,pro_id,deadline,quantity,price)
VALUES 
(2,'S002','2025/01/15',15,200),
(4,'S001','2025/02/12',20,150),
(2,'J002','2025/03/17',10,100),
(1,'T001','2025/04/05',40,900)
;

INSERT INTO reviews (cus_id,pro_id ,score,`date` )
VALUES 
(2,'J001',5,'2025/01/15'),
(3,'J002',5,'2025/02/12'),
(2,'S001',3,'2025/03/17'),
(1,'T001',4,'2025/04/05')
;



