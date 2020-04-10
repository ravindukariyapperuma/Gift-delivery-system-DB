create table Customer (
	customer_no char(4) PRIMARY KEY,
	customer_name varchar(40) NOT NULL,
	contact_no char(10) NOT NULL,
	address varchar(40),
	email char(30) NOT NULL,
	CONSTRAINT chk_customer_no CHECK (customer_no like '[C][0-9][0-9][0-9]'),
	CONSTRAINT chk_contact_no CHECK (contact_no not like '%[^0-9]%'),
	CONSTRAINT chk_email CHECK (email like '%_@__%.__%'),
)

create table Vehicle (
	vehicle_no char(10) PRIMARY KEY,
	type varchar(40),
	vehicle_name char(40),
	CONSTRAINT chk_vehicle_no CHECK (vehicle_no like '[V][0-9][0-9][0-9]'),
)

create table Employee (
	Employee_id char(4) PRIMARY KEY,
	Employee_name varchar(30) NOT NULL,
	contact_no char(10) NOT NULL,
	vehicle_no char(10) FOREIGN KEY REFERENCES Vehicle,
	CONSTRAINT chk_Employee_id CHECK (Employee_id like '[E][0-9][0-9][0-9]'),
	CONSTRAINT chk_contact_no_emp CHECK (contact_no not like '%[^0-9]%'),
)

create table Orders (
	order_no char(4) PRIMARY KEY,
	deliverpersonname varchar(40) NOT NULL,
	street varchar(40) NOT NULL,
	town varchar(40) NOT NULL,
	house_no integer NOT NULL,
	order_date_time datetime DEFAULT getdate(),
	deliver_date_time datetime,
	customer_no char(4) FOREIGN KEY REFERENCES Customer,
	Employee_id char(4) FOREIGN KEY REFERENCES Employee,
	CONSTRAINT chk_order_no CHECK (order_no like '[O][0-9][0-9][0-9]'),
)

create table Category (
	cid char(4) PRIMARY KEY,
	c_name varchar(40),
	description varchar(50),
	CONSTRAINT chk_cid CHECK (cid like '[T][0-9][0-9][0-9]'),
)

create table Item (
	item_id char(4) PRIMARY KEY,
	name varchar(30) NOT NULL,
	price real NOT NULL,
	description varchar(40),
	cid char(4) FOREIGN KEY REFERENCES Category,
	CONSTRAINT chk_item_id CHECK (item_id like '[I][0-9][0-9][0-9]'),
)

create table ItemOrder (
	Qty integer NOT NULL CHECK(Qty > 0) DEFAULT 1,
	amount real NOT NULL,
	order_no char(4) FOREIGN KEY REFERENCES Orders,
	item_id char(4)  FOREIGN KEY REFERENCES Item,
	PRIMARY KEY (order_no, item_id),
)

create table Payment (
	payment_id char(4) PRIMARY KEY,
	net_price real NOT NULL,
	type varchar(40) CHECK (type = 'Card' OR type = 'Paypal') DEFAULT 'Card',
	paypal_email char(30),
	bank varchar(30),
	card_no integer,
	order_no char(4) FOREIGN KEY REFERENCES Orders,
	CONSTRAINT chk_payment_id CHECK (payment_id like '[P][0-9][0-9][0-9]'),
	CONSTRAINT chk_paypal_email CHECK (paypal_email like '%_@__%.__%'),
)










--Data--
Insert into Customer values('C001','Kamal','0714528247','43/ Rathnapura','kamal@gmail.com');
Insert into Customer values('C002','Amal','0772545965','3/ Malabe','amal@yahoo.com');

Insert into Vehicle values('V001','Bicycle','Honda');
Insert into Vehicle values('V002','Van','Toyota');

Insert into Employee values('E001','Nuwan','0778542395','V001');
Insert into Employee values('E002','Kumara','0785474652','V002');

Insert into Orders(order_no,deliverpersonname,street,town,house_no,customer_no,Employee_id) values('O001','Sandum','New road','Kiribathgoda', 11,'C002','E001' );
Insert into Orders(order_no,deliverpersonname,street,town,house_no,customer_no,Employee_id) values('O002','Pawan','Wijayarama Mw','Nugegoda', 105,'C002','E002' );

Insert into Category values('T001','Cake','Cake is a form of sweet food made from flour');
Insert into Category values('T002','Flowers','A flower sometimes known as a bloom or blossom');

Insert into Item values('I001','Rose Flower',25.20, 'Red or white colours available', 'T002');
Insert into Item values('I002','Fruit Cake', 450.00,'Many kind of fruits added', 'T001');

Insert into ItemOrder(amount,order_no,item_id) values(450.00,'O001','I002');
Insert into ItemOrder values(2,50.4,'O001','I001');
Insert into ItemOrder values(2,900.00,'O002','I002');

Insert into Payment values('P001',900.00,'Card',Null,'HNB',10012,'O002');
Insert into Payment values('P002',500.4,'Paypal','123@atels.com',Null, Null,'O001');


SELECT * FROM  Customer
SELECT * FROM  Vehicle
SELECT * FROM  Employee
SELECT * FROM Orders
SELECT * FROM  Category
SELECT * FROM  Item
SELECT * FROM  ItemOrder
SELECT * FROM  Payment