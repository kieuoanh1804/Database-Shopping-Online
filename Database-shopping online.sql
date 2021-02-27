DROP DATABASE IF EXISTS online_shop_management;
CREATE DATABASE online_shop_management;
USE online_shop_management;

DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
	id 			INT NOT NULL AUTO_INCREMENT,
    cate_name 	VARCHAR(50) NOT NULL,
    cate_desc 	VARCHAR(155),
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS positions;
CREATE TABLE positions(
	id 				INT NOT NULL AUTO_INCREMENT,
    position_name 	VARCHAR(50) NOT NULL,
    position_desc 	VARCHAR(155),
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS providers;
CREATE TABLE providers(
	id 				INT NOT NULL AUTO_INCREMENT,
    prov_name 		VARCHAR(50) NOT NULL,
    phone_number 	VARCHAR(15) NOT NULL,
    email 			VARCHAR(55) NOT NULL,
    address 		VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees(
	id 				INT NOT NULL AUTO_INCREMENT,
    position_id		INT NOT NULL,
    full_name 		VARCHAR(50) NOT NULL,
    date_of_birth 	DATE NOT NULL,
    phone_number 	VARCHAR(15) NOT NULL,
    salary 			DECIMAL(10, 2) NOT NULL CHECK(salary > 0),
    email 			VARCHAR(55) NOT NULL,
    address			VARCHAR(100),
    PRIMARY KEY(id),
    FOREIGN KEY(position_id) REFERENCES positions(id)
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
	id 				INT NOT NULL AUTO_INCREMENT,
    full_name 		VARCHAR(50) NOT NULL,
    date_of_birth 	DATE NOT NULL,
    phone_number 	VARCHAR(15) NOT NULL,
    email 			VARCHAR(55) NOT NULL,
    address			VARCHAR(100),
    loyal_points	INT,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products(
	id 				INT NOT NULL AUTO_INCREMENT,
    cate_id 		INT NOT NULL,
    prod_name 		VARCHAR(55) NOT NULL,
    price 			DECIMAL(10,2) NOT NULL CHECK(price > 0),
    size 			VARCHAR(10) NOT NULL,
    quantity		INT NOT NULL CHECK(quantity >= 0),
    prod_desc		VARCHAR(155),
    PRIMARY KEY(id),
    FOREIGN KEY(cate_id) REFERENCES categories(id)
);

DROP TABLE IF EXISTS customer_orders;
CREATE TABLE customer_orders(
	id 					INT NOT NULL AUTO_INCREMENT,
    emp_id 				INT NOT NULL,
    cus_id 				INT NOT NULL,
    order_date 			DATE NOT NULL,
    shipment_address 	VARCHAR(50) NOT NULL,
    status_name			VARCHAR(50),
    PRIMARY KEY(id),
    FOREIGN KEY(emp_id) REFERENCES employees(id),
    FOREIGN KEY(cus_id) REFERENCES customers(id)
);

DROP TABLE IF EXISTS customer_order_details;
CREATE TABLE customer_order_details(
	id 				INT NOT NULL AUTO_INCREMENT,
    order_id 		INT NOT NULL,
    prod_id 		INT NOT NULL,
    quantity 		INT NOT NULL CHECK(quantity >= 0),
    size 			VARCHAR(10) NOT NULL,
    unit_price 		DECIMAL(10,2) NOT NULL CHECK(unit_price > 0),
    PRIMARY KEY(id),
    FOREIGN KEY(order_id) REFERENCES customer_orders(id),
    FOREIGN KEY(prod_id) REFERENCES products(id)
);

DROP TABLE IF EXISTS product_imports;
CREATE TABLE product_imports(
	id 				INT NOT NULL AUTO_INCREMENT,
    emp_id 			INT NOT NULL,
    prov_id 		INT NOT NULL,
    import_date 	DATE NOT NULL,
    status_name		VARCHAR(50),
    PRIMARY KEY(id),
    FOREIGN KEY(emp_id) REFERENCES employees(id),
    FOREIGN KEY(prov_id) REFERENCES providers(id)
);

DROP TABLE IF EXISTS product_import_details;
CREATE TABLE product_import_details(
	id			 	INT NOT NULL AUTO_INCREMENT,
    imp_id 			INT NOT NULL,
    prod_id 		INT NOT NULL,
    quantity 		INT NOT NULL CHECK(quantity >= 0),
    size 			VARCHAR(10) NOT NULL,
    unit_price 		DECIMAL(10, 2) NOT NULL CHECK(unit_price > 0),
    PRIMARY KEY(id),
    FOREIGN KEY(imp_id) REFERENCES product_imports(id),
    FOREIGN KEY(prod_id) REFERENCES products(id)
);

INSERT INTO categories (cate_name, cate_desc) 
VALUES  
	    ('Ao','Chat lieu vai HQ'),
    	('Quan','Chat lieu vai HQ'),
    	('Vay', 'Chat lieu vai HQ'),
    	('Mu', ''),
    	('Giay', '');

INSERT INTO positions (position_name, position_desc) 
VALUES 
	('Nhan Vien Ban Hang','Tiep Nhan Don Hang'),
	('Shipper','Giao Don Hang'),
	('Quan Ly','Quan Ly Dieu Phoi Cong Viec'),
	('Nhan Vien Xuat Nhap Kho','Phu Trach Xuat Nhap Kho'),
	('Giam Doc','Dieu Hanh Hoat Dong');

INSERT INTO providers (prov_name, phone_number, email, address)
VALUES 
	('Alpha T','01667715028','alphatproduct@gmail.com','KCN Alpha-Quang Chau-Trung Quoc'), -- ao
	('Beta X','09900099','Betax69@gmail.com','Tang 2 Khach San Continental-Da Nang-VietNam'), -- quan
	('Back June','0654321','Blackjunemidterm@gmail.com','Tang 5 Bitexco- Ha Noi- Viet Nam'), -- mu vay
	('MiXao S','0987654321','Aloohaha321@gamail.com','Tang 5-Chung Cu Hiyori - My Khe -Da Nang-Viet Nam'); -- giay

INSERT INTO employees (full_name, position_id, date_of_birth, phone_number, salary, email, address)
VALUES 
	('Nguyen Ngoc Huy',1,'2001/01/01','0987654301', 13000000,'chaulen3@gmail.com','Da Nang'),
	('Nguyen Hung Manh',1,'2001/02/02','0987654302', 11000000,'chaulen4@gmail.com','Da Nang'),
	('Nguyen Van Sy',1,'2001/03/03','0987654303', 14000000, 'chaulen5@gmail.com','Da Nang'),
	('Huynh Minh Hai',2,'2001/04/04','0987654304', 10000000, 'chaulen6@gmail.com','Da Nang'),
	('Thai Tran Hung Vuong',2,'2001/05/05','0987654305', 15000000, 'chaulen7@gmail.com','Da Nang'),
	('Ho Thi Dieu',2,'2001/06/06','0987654306', 15000000, 'chaulen8@gmail.com','Da Nang'),
	('Nguyen Doan Ngoc Hau',3,'2001/07/07','0987654307', 10000000, 'chaulen9@gmail.com','Da Nang'),
	('Nguyen Thi Diem',4,'2001/08/08','0987654308', 10000000, 'chaulen10@gmail.com','Da Nang'),
	('Nguyen Doan Ngoc Hau',5,'2001/09/09','0987654309', 15000000, 'chaulen11@gmail.com','Da Nang');


INSERT INTO customers (full_name, date_of_birth, phone_number, email, address)
VALUES  
	('Pham Anh Tuan','2001-02-01','0799101769','tuan.pham@gmail.com','Da Nang'),
	('Doan Thi Kieu Oanh','2001-02-02','0799101770','oanh.doan@gmail.com','Da Nang'),
	('Tran Thi Nhu Mai','2001-02-03','0799101771','mai.tran@gmail.com','Da Nang'),
    ('Gia Cao Bang','2001-02-04','0799101772','bang.cao@gmail.com','Ha Noi'),
	('Ha Mong Khang','2001-02-05','0799101773','khang.ha@gmail.com','TP-HCM'),
	('Nguyen Dinh Kha','2001-02-06','0799101775','Kha.dinh@gmail.com','Da Nang'),
	('Nguyen Dinh Long','2001-02-07','0799101776','long.nguyen@gmail.com','Da Nang'),
	('Nguyen Hoang Huan','2001-02-08','0799101777','huan.nguyen@gmail.com','Quang Nam'),
	('Nguyen Hong Quan','2001-02-09','0799101778','quan.nguyen@gmail.com','Da Nang'),
	('Tran Van Phat','2001-02-10','0799101779','phat.tran@gmail.com','Quang Tri'),
	('Dang Van Duc','2001-02-11','0799101789','duc.dang@gmail.com','Quang Binh');

INSERT INTO products (cate_id, prod_name, price, size, quantity, prod_desc) 
VALUES 
	(1, 'Ao Phong Trang Supreme M', 100000, 'M', 10,'Chat lieu vai thoang mat khong gay kich ung da'),
	(1, 'Ao Phong Trang Supreme L', 100000, 'L', 10,'Chat lieu vai thoang mat khong gay kich ung da'),
	(1, 'Ao Phong Trang Supreme XXL',100000, 'XL', 10, 'Chat lieu vai thoang mat khong gay kich ung da'),
	(1,'Ao Phong Trang Supreme',100000,'XXL',10,'Chat lieu vai thoang mat khong gay kich ung da'),
	(2,'Quan Short',300000,'M',10,'Chat lieu vai bo cao cap, khong gay kich ung da'),
	(2,'Quan Short',300000,'L',10,'Chat lieu vai bo cao cap, khong gay kich ung da'),
	(2,'Quan Short',300000,'XL',10,'Chat lieu vai bo cao cap, khong gay kich ung da'),
	(2,'Quan Short',300000,'XXL',10,'Chat lieu vai bo cao cap, khong gay kich ung da'),
	(3,'Chan Vay Ngan',200000 ,'M',10,'Chat lieu da Cao Cap, khong gay kich ung da'),
	(3,'Chan Vay Ngan',200000,'L',10,'Chat lieu da Cao Cap, khong gay kich ung da'),
	(3,'Chan Vay Ngan',200000,'XL',10,'Chat lieu da Cao Cap, khong gay kich ung da'),
	(3,'Chan Vay Ngan',200000,'XXL',10,'Chat lieu da Cao Cap, khong gay kich ung da'),
	(4, 'Mu Luoi Trai Supreme XL',100000, 'M', 10, 'Chat lieu vai thoang mat an toan cho da dau'),
	(5,'Nike',1500000,'38',10,'Chat Lieu Cao Cap, An Toan cho ban chan'),
	(5,'Nike',1500000,'39',10,'Chat Lieu Cao Cap, An Toan cho ban chan'),
	(5,'Nike',1500000,'40',10,'Chat Lieu Cao Cap, An Toan cho ban chan'),
	(5,'Nike',1500000,'41',10,'Chat Lieu Cao Cap, An Toan cho ban chan');

INSERT INTO customer_orders (emp_id, cus_id, order_date, shipment_address, status_name)
VALUES 
    (1, 1, '2020-06-20', '101B - Le Huu Trac - Son Tra - Da Nang', 'Dang giao hang'),
   	(2, 2, '2020-06-21', 'K4 - Nguyen Chi Thanh - Hai Chau - Da Nang', 'Da giao hang'),
    (3, 3, '2020-06-21', 'K5 - Nguyen Chi Thanh - Hai Chau - Da Nang', 'Da giao hang'),
    (1, 4, '2020-06-22', 'K6 - Nguyen Chi Thanh - Hai Chau - Da Nang', 'Da giao hang'),
    (1, 5, '2020-06-23', 'K7 - Nguyen Chi Thanh - Hai Chau - Da Nang', 'Da giao hang'),
    (2, 6, '2020-06-23', 'K8 - Nguyen Chi Thanh - Hai Chau - Da Nang', 'Da giao hang'),
    (1, 7, '2020-06-24', '101A - Le Huu Trac - Son Tra - Da Nang', 'Dang giao hang'),
    (2, 8, '2020-06-25', 'K11 - Nguyen Chi Thanh - Hai Chau - Da Nang', 'Da giao hang'),
    (2, 9, '2020-06-26', 'K15 - Nguyen Chi Thanh - Hai Chau - Da Nang', 'Dang giao hang'),
    (3, 10, '2020-06-27', 'K20 - Nguyen Chi Thanh - Hai Chau - Da Nang', 'Da giao hang'),
    (3, 2, '2020-06-28', 'K44 - Nguyen Chi Thanh - Hai Chau - Da Nang', 'Dang giao hang');
    
INSERT INTO customer_order_details (order_id, prod_id, quantity, size, unit_price)
VALUES  
	(1,1,15,'M', 100000),(2,6,20,'L', 600000),
	(3,9,3,'M', 200000),(4,14,10,'M', 100000),
	(5,17,30,'40',1500000),(6,1,15,'M', 100000),
	(7,6,20,'L', 600000),(8,9,12,'M', 200000),
	(9,14,10,'M', 100000),(10,17,1,'40',1500000),
	(11,17,100,'40',1500000);

INSERT INTO product_imports(emp_id, prov_id, import_date, status_name)
VALUES 
	(4,1,'2020-06-15','Da Nhap Kho'),
	(4,1,'2020-06-15','Dang Nhap Kho'),
	(4,1,'2020-06-15','Dang Nhap Kho'),
	(4,1,'2020-06-15','Dang Nhap Kho'),
	(4,2,'2020-06-15','Dang Nhap Kho'),
	(4,2,'2020-06-15','Da Nhap Kho'),
	(4,2,'2020-06-15','Da Nhap Kho'),
	(4,2,'2020-06-15','Da Nhap Kho'),
	(4,3,'2020-06-15','Da Nhap Kho'),
	(4,3,'2020-06-15','Da Nhap Kho'),
	(4,3,'2020-06-15','Dang Nhap Kho'),
	(4,3,'2020-06-15','Dang Nhap Kho'),
	(4,3,'2020-06-15','Da Nhap Kho'),
	(4,4,'2020-06-15','Da Nhap Kho'),
	(4,4,'2020-06-15','Dang Nhap Kho'),
	(4,4,'2020-06-15','Da Nhap Kho'),
	(4,4,'2020-06-15','Dang Nhap Kho');

INSERT INTO product_import_details (imp_id, prod_id, quantity, size, unit_price)
VALUES 
	(1,1,10,'M','700000'),(2,2,10,'L','700000'),(3,3,10,'XL','700000'),
	(4,4,10,'XXL','700000'),(5,5,10,'M', '2000000'),(6,6,10,'L', '2000000'),
	(7,7,10,'XL', '2000000'),(8,8,10,'XXL', '2000000'),(9,9,10,'M', '1500000'),
	(10,10,10,'L', '1500000'),(11,11,10,'XL', '1500000'),(12,12,10,'XXL', '1500000'),
	(13,13,50,'M', '3500000'),(14,14,10, '38','10000000'),(15,15,10,'39', '10000000'),
	(16,16,10,'40', '10000000'),(17,17,10,'41', '10000000');


-- Truy vấn toàn bộ nhân viên đã nhận orders
SELECT emp.id, emp.full_name, emp.date_of_birth, emp.email, 
	emp.phone_number, cus_ord.id AS OrderID
	FROM employees AS emp
	RIGHT JOIN customer_orders AS cus_ord
	ON emp.id = cus_ord.id; 

-- Truy vấn doanh thu của shop trong khoảng 1 thời gian cho trước
SELECT SUM(cus_ord_dt.quantity * cus_ord_dt.unit_price) AS Revenue, 
	cus_ord.order_date AS OrderDate
	FROM customer_order_details AS cus_ord_dt, customer_orders AS cus_ord
    WHERE cus_ord.id = cus_ord_dt.order_id 
    AND cus_ord.order_date BETWEEN '2020-06-20' AND '2020-06-21';
    
-- Truy vấn số lượng hóa đơn đã xuất (Customer order) trong 1 khoảng thời gian cho trước
SELECT COUNT(id) AS TotalOrders, order_date AS OrderDate
	FROM customer_orders
    WHERE order_date BETWEEN '2020-06-20' AND '2020-06-21';

-- Truy vấn số lượng hóa đơn đã xuất (Customer order) với status_name <Dang giao hang, Da giao hang>
SELECT COUNT(id) AS Total, order_date AS OrderDate
	FROM customer_orders
    WHERE status_name = 'Dang giao hang';

-- Truy vấn toàn bộ thông tin hóa đơn đã xuất (Customer order) với status_name <Dang giao hang, Da giao hang>
SELECT * FROM customer_orders
    WHERE status_name = 'Da giao hang';
    
-- Truy vấn số lượng hóa đơn đã nhập (Product import) trong 1 khoảng thời gian cho trước
SELECT COUNT(id) AS TotalImports, import_date AS ImportDate
	FROM product_imports
    WHERE import_date BETWEEN '2020-06-15' AND '2020-06-21';
  
-- Xuất toàn bộ hóa đơn trong một ngày nào đó dựa theo số tiền tăng dần
SELECT cus_ord_dt.order_id, cus_ord_dt.prod_id, cus_ord_dt.quantity,
	   cus_ord_dt.size, cus_ord_dt.unit_price, cus_ord.order_date 
	FROM customer_order_details AS cus_ord_dt
	RIGHT JOIN customer_orders AS cus_ord
    ON cus_ord_dt.order_id = cus_ord.id
    WHERE cus_ord.order_date BETWEEN '2020-06-20' AND '2020-06-21'
    ORDER BY cus_ord_dt.unit_price ASC;

-- Đếm số lượng khách hàng cùng một địa chỉ
SELECT COUNT(id) AS Total, address AS Address 
	FROM customers 
    GROUP BY address;

-- Truy vấn toàn bộ thông tin sản phẩm có số lượng đặt >= 10 và trong cùng 1 tháng
SELECT prod.prod_name, prod.price, prod.prod_desc, cus_ord_dt.quantity AS OrderedQuantity,
		cus_ord.order_date AS OrderedDate 
	FROM products AS prod
	LEFT JOIN customer_order_details AS cus_ord_dt
    ON cus_ord_dt.prod_id = prod.id
    LEFT JOIN customer_orders AS cus_ord
    ON cus_ord_dt.order_id = cus_ord.id
    WHERE cus_ord_dt.quantity >= 5 
		AND cus_ord.order_date BETWEEN '2020-06-01' AND '2020-06-30';
    
-- Truy vấn thông tin sản phẩm bán chạy nhất
SELECT products.id, products.cate_id, products.prod_name, products.price, 
	products.size, products.quantity, products.prod_desc,
	SUM(customer_order_details.quantity) AS TotalOrder 
	FROM products, customer_order_details
	WHERE products.id = (
		SELECT prod_id
		FROM customer_order_details
		GROUP BY prod_id
		ORDER BY SUM(quantity) DESC
		LIMIT 1
	) AND customer_order_details.prod_id = (
		SELECT prod_id
		FROM customer_order_details
		GROUP BY prod_id
		ORDER BY SUM(quantity) DESC
		LIMIT 1
);

-- Xuất thông tin nhân viên bán hàng xuất sắc (tính theo số hóa đơn đã nhận)
SELECT employees.id, employees.full_name, employees.date_of_birth,
	employees.salary, employees.email, employees.address, 
    COUNT(customer_orders.emp_id) AS TotalOrder 
	FROM employees, customer_orders
	WHERE employees.id = (
		SELECT emp_id
		FROM customer_orders
		GROUP BY emp_id
		ORDER BY COUNT(emp_id) DESC
		LIMIT 1
	) AND customer_orders.emp_id = (
		SELECT emp_id
		FROM customer_orders
		GROUP BY emp_id
		ORDER BY COUNT(emp_id) DESC
		LIMIT 1
);

-- Xuất thông tin khách hàng mua hàng nhiều nhất (tính theo số hóa đơn)
SELECT customers.id, customers.full_name, customers.date_of_birth,
	customers.phone_number, customers.email, customers.address,
    customers.loyal_points, COUNT(customer_orders.cus_id) AS TotalOrder 
	FROM customers, customer_orders
	WHERE customers.id = (
		SELECT cus_id
		FROM customer_orders
		GROUP BY cus_id
		ORDER BY COUNT(cus_id) DESC
		LIMIT 1
	) AND customer_orders.cus_id = (
		SELECT cus_id
		FROM customer_orders
		GROUP BY cus_id
		ORDER BY COUNT(cus_id) DESC
		LIMIT 1
);
