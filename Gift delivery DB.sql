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