--create tables
CREATE TABLE retail_sales
(
transactions_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(15),
age INT,
category VARCHAR(15),
quantiy INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
);

SELECT * FROM retail_sales;

SELECT COUNT(*) FROM retail_sales
--data cleaning

SELECT * FROM retail_sales
where transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null;

 delete from retail_sales
 where transactions_id is null
or
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
 category is null
 or
 quantiy is null
 or
 price_per_unit is null
 or
 cogs is null
 or
 total_sale is null;

--data exploration
--how many sales we have
SELECT COUNT(*) FROM retail_sales;
--how many unique customers we have
select count(distinct customer_id) from retail_sales
--how many unique category we have
select count(distinct category) from retail_sales
--what are those category
select distinct category from retail_sales

--data analysis and answers
--1)write a sql query to retrieve all columns for sales made on 2022-11-05
select * from retail_sales where sale_date = '2022-11-05';
--2)write sql query to retrieve all transaction where the category is clothing and the quantity sold is more than the 4 in the month of nov 2022
select * from retail_sales
where Category = 'Clothing'
  AND Quantiy = 4
  and EXTRACT(MONTH FROM sale_date) = 11
AND EXTRACT(YEAR FROM sale_date) = 2022
--3)write a sql query to calculate the total sales for each category

SELECT Category, SUM(total_sale) AS total_sales, count(*) as total_order
FROM retail_sales
GROUP BY Category;
--4)find the average age of customers who purchased items from beuty cateogory
select avg(age)as avg_age from retail_sales where category= 'Beauty';
--5)write a sql query to find all the transactions where the total sale is greater than 1000

select * from retail_sales where total_sale> 1000;

 --6)write sql query to find the total number of transactions made by each gender in each category

select 
category,
gender,
count(*)as total_transaction 
from retail_sales 
group by
category,
gender;

--7)write a sql query to calculate the avg sale for each month. find out best selling month in each year

select extract(year from sale_date) as year, extract(month from sale_date)as month,
avg(total_sale) as avg_sales
from retail_sales
group by 1,2
order by 1,3 desc;

--8)write a sql query to find the top 5 customers based on the highest total sales
select * from retail_sales;
select customer_id, sum(total_sale) as total_sales from retail_sales group by 1 order by 2 desc limit 5;

--9)write a sql query to find the number of unique  customers who purcchased items from each category

select category,count(distinct customer_id)as unique_customer from retail_sales group by category ;
--10)write a sql query to create each shift and number of orders(example morning<=12, afternoon 12&17 , evening>17)
select * from retail_sales;
SELECT
  CASE
    WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS shift,
  COUNT(*) AS total_orders
FROM retail_sales
GROUP BY shift
ORDER BY total_orders DESC;



