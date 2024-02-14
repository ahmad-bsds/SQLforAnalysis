-- CTE
-- CTE is like a temporary table which is only available as till as query is running. 
with CTE_table
as (
select *
from retail_schema.transactions
where gender = 'Male'
)
-- run this with previous.
select *
from CTE_table;

-- Temp tables.

create temporary table temp_employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
);

-- Empty.
select *
from temp_employee;

-- Adding values:
insert into temp_employee (EmployeeID, JobTitle, Salary) values (1, 'Student', 0);

-- Checking data:
select *
from temp_employee;

-- changing column name.
alter table temp_employee
rename column Salary to credit_points;

-- changing column name.
alter table temp_employee
rename column JobTitle to Emp_name;

-- changing data type.
alter table temp_employee
alter column EmployeeID type varchar(10);

-- Inserting data from a other table.
insert into temp_employee (EmployeeID, JobTitle, credit_points) 
select customer_id, first_name, credit_points
from retail_schema.customers;

-- Checking data.
select *
from temp_employee; 

/*
 * Why temp tables:
 * They enables us to store a query results and we can then perform other operation
 * on that table rather then making the query complex.
 * We can use """drop table if exists""" to drop that temp table.*/

-- droping the temporary table from database.
drop table if exists temp_employee

/*
 * Defference between CTE and TEMP table:
 * cte remains available as query is running the deletes, but temp table remain in dbs once it is created.
 * */

-- String funnctions:

-- crteating a table.
create table retail_schema.EmplyeeErrors (
	
	EmployeeID varchar(5),
	FirstName varchar(50),
	LastName varchar(50)
	
);

-- inserting values.
insert into retail_schema.EmplyeeErrors values 
('1001', 'Jimbo', 'Helbert'),
('1002', 'Pamela', 'Basely'),
('1005', 'TOby', 'Flenderson - Fired');

-- printing data.
select *
from retail_schema.EmplyeeErrors

-- Using Trim, Ltrim, Rtrim:
select EmployeeID, trim(EmployeeID) as IDTRIM
from retail_schema.EmplyeeErrors;

select EmployeeID, ltrim(EmployeeID) as "ID-RTRIM"
from retail_schema.EmplyeeErrors;


select EmployeeID, rtrim(EmployeeID) as "ID-LTRIM"
from retail_schema.EmplyeeErrors;

-- Using Replace:
select lastname , replace(lastname, '- Fired', '') as LastNameReplaced
from retail_schema.EmplyeeErrors;

-- substring
select firstname , substring(firstname, 1, 1)
from retail_schema.EmplyeeErrors;

select firstname , substring(firstname, 1, 3) -- from first charecter to till third char.
from retail_schema.EmplyeeErrors;

select firstname , substring(firstname, 2, 3) -- from second charecter to till third char.
from retail_schema.EmplyeeErrors;

-- we can use substring for fuzzymatch.

-- upper
select upper(firstname) 
from retail_schema.EmplyeeErrors

-- lower
select lower(firstname) 
from retail_schema.EmplyeeErrors


-- Strored procedures:
/*
 * Group of SQL that has been created and stored in DB.
 * It can  be used by defferent users.
 * */


-- subquries:
-- inner/ nested quries. Use temp table or CTE for that condition.

-- for select:
select *, (select avg(priceperunit) from retail_schema.transactions) avg_priceperunit
from retail_schema.transactions;

-- for from:
select priceperunit, avg_priceperunit
from (
	select *, (select avg(priceperunit) from retail_schema.transactions) avg_priceperunit
	from retail_schema.transactions
);

--for  where:
select customer_id , gender, priceperunit 
from retail_schema.transactions
where customer_id in (
	select customer_id 
	from retail_schema.customers
);

-------------------------------------------------------------
