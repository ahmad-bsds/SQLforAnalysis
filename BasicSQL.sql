-- The SELECT statement.

-- SELECT all columns from table.
select *
from retail_schema.transactions;

-- Selecting specific columns.
select age_customer
from retail_schema.transactions;

select date_order, gender
from retail_schema.transactions;

-- Numeric.
select product_category, priceperunit + 10  -- Follows PEMDAS operator precedency.
from retail_schema.transactions;

-- Function.
select AVG(priceperunit)
from retail_schema.transactions;

-- Selecting the unique elements.
select distinct gender
from retail_schema.transactions;


-- setting up condition, filttering the data.
select *
from retail_schema.transactions
where priceperunit = 500;


select *
from retail_schema.transactions
where priceperunit <= 200;


select *
from retail_schema.transactions
where priceperunit > 200; -- I use only < but not =. So only greater then 200 and 200 will not include.

select *
from retail_schema.transactions
where priceperunit <> 200; -- not equal.

select product_category, priceperunit
from retail_schema.transactions
where product_category = 'Clothing' 
	and date_order = '2023-05-21'; -- and or not.
	
select product_category, priceperunit
from retail_schema.transactions
where (product_category = 'Clothing' and date_order = '2023-05-21')
	or age_customer = 26;

-- LIKE: Text patterens.
/*
 * Like statement is used to find specific patterns inside the text.
 * It has two main things:
 * %	is used for wildcard for multiple charecters.
 * _	is used for wildcard for single charecter.
 * */

select *
from retail_schema.transactions
where product_category like 'C%';

select *
from retail_schema.transactions
where product_category like 'B_'; -- one charecter afterr B. no output here.

select *
from retail_schema.transactions
where product_category like 'B_____'; -- five charecters afterr B.

-- any thing contains 'ea'
select *
from retail_schema.transactions
where product_category like '%ea%'; -- five charecters afterr B.

-- Group by and order by.

-- Group by: works with a agregate function e.g. SUM, MIN, MAX and a column to be group.
select gender, AVG(age_customer) AS "Average Age", MAX(age_customer) as "Max age"
from retail_schema.transactions
group by gender;

-- Order by: order by <COLUMN_NAME> <ASC|DESC> --> by default order is ascending 1, 2, 3.
select gender, age_customer as "Age"
from retail_schema.transactions
order by age_customer;

-- Ascending.
select gender, age_customer as "Age"
from retail_schema.transactions
order by age_customer ASC;

-- Descending.
select gender, age_customer as "Age"
from retail_schema.transactions
order by age_customer DESC;

-- Orderring Multiple columns.
select *
from retail_schema.transactions
order by age_customer, gender;

-- Now gender will be ordered first.
select *
from retail_schema.transactions
order by gender, age_customer;

-- Using column position rarher then column names.
select *
from retail_schema.transactions
order by 7; -- Quantity is 7th column, and will be ordered.

-- Having vs Where.
select product_category, avg(total_amount) as "Average total amount"
from retail_schema.transactions
where quantity >= 2
-- avg(total_amount) > 550
group by product_category;

-- Having
select product_category, avg(total_amount) "Average total amount"-- removed as, it is same as using 'as'.
from retail_schema.transactions
where quantity >= 2
group by product_category
having avg(total_amount) > 550;

-- Limit: is used to get top n rows.
select *
from retail_schema.transactions
limit 7;

----------------------------------------------------------------------------------------------

