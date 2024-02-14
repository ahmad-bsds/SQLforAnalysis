-- Joins: Inner, Full/Left/Right, Outer.

-- Tables--

-- retail table
select *
from retail_schema.transactions;
-- customer table.
select *
from retail_schema.customers

-- Join-- used to combine multiple tables into a single output.
-- Inner Join A ⌒ B
select *
from retail_schema.transactions
inner join retail_schema.customers
	on retail_schema.transactions.customer_id = retail_schema.customers.customer_id;

-- Full outer join A U B
select *
from retail_schema.transactions
full outer join retail_schema.customers
	on retail_schema.transactions.customer_id = retail_schema.customers.customer_id;

-- Left outer join: Left table whole, regardless of right.
select *
from retail_schema.transactions
left outer join retail_schema.customers
	on retail_schema.transactions.customer_id = retail_schema.customers.customer_id;

-- Right outer join: Right table whole, regardless of left.
select *
from retail_schema.transactions
right outer join retail_schema.customers
	on retail_schema.transactions.customer_id = retail_schema.customers.customer_id;

-- selecting desired columns.
select gender, age_customer, first_name, credit_points 
from retail_schema.transactions
right outer join retail_schema.customers
	on retail_schema.transactions.customer_id = retail_schema.customers.customer_id;

-- Also selecting Key.
select retail_schema.transactions.customer_id, gender, age_customer, first_name, credit_points -- necessary to tell which table's key we wanna select.
from retail_schema.transactions
right outer join retail_schema.customers
	on retail_schema.transactions.customer_id = retail_schema.customers.customer_id;

-- Checking which gender has more credit points.
select gender, avg(credit_points) as "Average Credit Points", max(credit_points) as "Max Credit Points" 
from retail_schema.transactions
left outer join retail_schema.customers -- left because we wanna for left table (for gender).
	on retail_schema.transactions.customer_id = retail_schema.customers.customer_id
group by gender;

-- Unions: Combines columns from two tables one time. (A,B)+(A,B) = (A,B) | (Not as like previous A, B, A, B)
-- Union (Just like distinct statement.), Union all (Also has duplicates).
select *
from retail_schema.transactions
union
select *
from retail_schema.transactions;

-- -- --
select customer_id , age_customer 
from retail_schema.transactions
union
select customer_id , credit_points
from retail_schema.customers;


-- Case statement. It is like IF ELSE.
-- case will also be considered as a new column.
select *,
case
	when  age_customer <= 25 then 'Baby'
	else 'Old'
end
from retail_schema.transactions;

-- Naming the case column.
select *,
case
	when  age_customer <= 25 then 'Baby'
	else 'Old'
end "Customer segment"
from retail_schema.transactions;

-- More Conditions.
select *,
case
	when  age_customer <= 25 then 'Baby'
	when age_customer between 26 and 35 then 'Young'
	else 'Old'
end "Customer segment"
from retail_schema.transactions;

-- Group by,
select
	case
		when  age_customer <= 25 then 'Baby'
		when age_customer between 26 and 35 then 'Young'
		else 'Old'
	end "Customer segment",
	avg(quantity) "Average Quantity"
from retail_schema.transactions
group by "Customer segment";

-- Updating snd deleting data.
-- Updating
update retail_schema.transactions
set gender = 'Female'
where customer_id = 'CUST005'

update retail_schema.transactions
set gender = 'Female', age_customer = 50
where customer_id = 'CUST005'

--Deleting a row.
delete -- use here "select *" before deleting, for understanding if deleting the right data.
from retail_schema.transactions
where customer_id = 'CUST005'

-- Aliasing:
select age_customer as "AGE" -- will be as it in capital, and best for spaced words.
from retail_schema.transactions;

--Or
select age_customer as AGE -- will 'not' be as it in capital, and not best for spaced words.
from retail_schema.transactions;

-- Multiple columns.
select gender || ' ' || age_customer as "Customer"
from retail_schema.transactions;

-- Aliasing table names.
select *
from retail_schema.transactions as Records;

-- Or
select Records.gender
from retail_schema.transactions as Records;


-- use always "as" for a best practice.

-- Partition by:
/* group by reduces the result by rolling such as min, max, avg, etc. 
 * partition by divides the result.
 * */
select retail_schema.transactions.customer_id , age_customer , gender, credit_points , count(gender) over (partition by product_category) as TotalGender  
from retail_schema.transactions
left outer join retail_schema.customers -- left because we wanna for left table (for gender).
	on retail_schema.transactions.customer_id = retail_schema.customers.customer_id;

---------------------------------------------------------------------------------------------------

