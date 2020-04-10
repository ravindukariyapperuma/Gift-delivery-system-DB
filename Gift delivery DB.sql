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