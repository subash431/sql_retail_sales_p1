-- SQL Retail Sales analysis --

-- Crate Table 
CREATE TABLE retail_sales_tb
(
	transsactions_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(15),
	age INT,
	category VARCHAR(15),
	quantty INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT

);
-- --DATA CLEANING--  
SELECT * FROM retail_sales_tb;

select count(*) FROM retail_sales_tb;

SELECT * FROM retail_sales_tb 
WHERE 
	transsactions_id IS NULL
	OR
	sale_date IS NULL 
	OR
	sale_time IS NULL
	OR 
	customer_id IS NULL
	OR 
	gender is null
	OR
	age is null 
	OR
	category is null 
	OR 
	quantty is null
	OR 
	cogs is null 
	OR
	total_sale is null;

DELETE FROM retail_sales 
WHERE 
transsactions_id IS NULL
	OR
	sale_date IS NULL 
	OR
	sale_time IS NULL
	OR 
	customer_id IS NULL
	OR 
	gender is null
	OR
	age is null 
	OR
	category is null 
	OR 
	quantty is null
	OR 
	cogs is null 
	OR
	total_sale is null;
    
-- DATA  EXPLORATION

-- How many sales we have?
SELECT COUNT(*) AS Total_sales From retail_sales_tb; 

-- How many unique customer do we have?
SELECT COUNT(distinct(customer_id)) AS Total_sales From retail_sales_tb; 

-- How many unique CATEGORY do we have?
SELECT DISTINCT category From retail_sales_tb; 

-- Data Analysis and  business key Problems and answers 

-- Q.1. Write a SQL query to retrieve all colums for sales made on '2022-11-05' -- 
SELECT * 
FROM retail_sales_tb 
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than AND EQUAL TO 4 in the month of Nov-2022
SELECT *
FROM retail_sales_tb
WHERE category = 'Clothing' 
	AND 
	date_format(sale_date, '%Y-%m') = '2022-11'
    AND 
    quantty >=4;
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT category, SUM(total_sale) as net_sale
from retail_sales_tb
group by 1;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT ROUND(AVG(age), 2)
FROM retail_sales_tb
WHERE category = 'Beauty';
-- Q.5 Write a SQL to find all transactions where the total sale is greater than 1000.
SELECT *
FROM retail_sales_tb
WHERE total_sale> 1000;
-- Q.6 Write a query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT category, gender , COUNT(transsactions_id) as total_transactions
FROM retail_sales_tb 
group by category, gender; 
-- Q.7 Write to calculate the average sale for each month. Find out best selling month in each year
SELECT extract(YEAR FROM sale_date) as year,
extract(MONTH FROM sale_date) as month,
AVG(total_sale) as avg_sale
FROM retail_sales_tb
group by 1,2
order by 1,2, 3 DESC;

-- End of project  

