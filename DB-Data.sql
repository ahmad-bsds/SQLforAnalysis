-- View Existing database.
SELECT * FROM pg_database;

-- drop a database.
drop database retail
drop database retail_schema

-- View schema.
SELECT *
FROM information_schema.schemata;

-- drop a schema.
drop schema retail_schema

--create a database.
create database retail

-- create a schema.
create schema retail_schema

-- create transections table.
CREATE TABLE retail_schema.transactions (
    Transaction_ID SERIAL PRIMARY KEY,
    Date_Order DATE,
    Customer_ID VARCHAR(50),
    Gender VARCHAR(10),
    Age_Customer INT,
    Product_Category VARCHAR(50),
    Quantity INT,
    PricePerUnit NUMERIC(10, 2),
    Total_Amount NUMERIC(10, 2)
);
-- Load data into table from csv.
COPY retail_schema.transactions(Transaction_ID,Date_Order,Customer_ID,Gender,Age_Customer,Product_Category,Quantity,PricePerUnit,Total_Amount)
FROM 'F:\SQL\retail_sales_dataset.csv' DELIMITER ',' CSV HEADER;

-- show data.
select * 
from retail_schema.transactions;

-- Create customers table.
CREATE TABLE retail_schema.customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(20),
    Last_Name VARCHAR(20),
    Credit_Points INT
);

-- Load data into table from csv.
COPY retail_schema.customers(Customer_ID, First_Name, Last_Name, Credit_Points)
FROM 'F:\SQL\customers.csv' DELIMITER ',' CSV HEADER;

