USE lab_mysql;

CREATE TABLE Cars (
ID int AUTO_INCREMENT,
VIN varchar(20) NOT NULL,
Manufacturer varchar(50),
Model varchar(50),
Year int(4),
Color varchar(30),
PRIMARY KEY (ID)
);

CREATE TABLE SalesPerson (
ID int AUTO_INCREMENT,
Staff_ID varchar(30) NOT NULL,
Name varchar(40),
Store varchar(20),
PRIMARY KEY (ID)
);

CREATE TABLE Customers (
ID int AUTO_INCREMENT,
Customer_ID varchar(15) NOT NULL,
Name varchar(40) NOT NULL,
Phone_num varchar(20) NOT NULL,
Email varchar(50) NOT NULL,
City varchar(20),
Country char(30), 
Postal_code int(6),
PRIMARY KEY (ID)
);

CREATE TABLE Invoices (
ID int AUTO_INCREMENT,
Invoice_number varchar(20) NOT NULL,
Date date,
Car_ID varchar(15) NOT NULL,
Customer_ID varchar(15) NOT NULL,
Sales_person_ID varchar(30) NOT NULL,
PRIMARY KEY (ID)
);

