drop table if exists zepto;

create table zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountpercent NUMERIC(5,2),
availabeQuantity INTEGER,
discountsellingprice NUMERIC(8,2),
weightinGms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--data exploration
SELECT COUNT(*) FROM zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;

--null value
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
discountsellingprice IS NULL
OR
weightInGms IS NULL
OR
availabeQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL

--different product categories
SELECT DISTINCT category
FROM ZEPTO
ORDER BY category;

--products in stock vs out of stock
SELECT outOfStock , COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present multiple times
SELECT name, COUNT(sku_id) as "Number of Skills"
FROM zepto
GROUP BY name
HAVING COUNT (sku_id)>1
ORDER BY COUNT(sku_id) DESC;

--data cleaning

--products with price =0
SELECT * FROM zepto
WHERE mrp=0 OR discountsellingprice=0;

DELETE FROM zepto
WHERE mrp=0;

--convert paise to rupees
UPDATE zepto
SET mrp=mrp/100.00,
discountsellingprice=discountsellingprice/100.00;

SELECT mrp,discountsellingprice FROM zepto

--Q1 Find the top 10 best value products based on discount percentage.
SELECT DISTINCT NAME ,mrp,discountsellingprice
FROM zepto
ORDER BY discountsellingprice DESC
LIMIT 10;

--Q2 What are products with high mrp but out of stock.
SELECT DISTINCT NAME ,mrp
FROM zepto
WHERE outOfStock =TRUE and mrp>300
ORDER BY mrp DESC;

--Q3 Calculate estimated revenue for each category.
SELECT category ,
SUM(discountsellingprice * availabeQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

--Q4 Find all the products where mrp is greater than 500 and discount is less than 10%
SELECT DISTINCT name , mrp,discountPercent
FROM zepto
WHERE mrp>500 AND discountPercent<10
ORDER BY mrp DESC , discountPercent DESC;

--Q5 Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discountpercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;


