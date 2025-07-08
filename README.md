# 🛒 Zepto SQL Data Analysis Project

This project is an end-to-end SQL-based exploratory data analysis (EDA) on product listings from Zepto. The analysis focuses on cleaning the data, understanding product availability, discount trends, pricing strategies, and estimating potential revenue.

---

## 📌 Table of Contents

- [About the Dataset](#about-the-dataset)
- [Tech Stack](#tech-stack)
- [Data Cleaning Tasks](#data-cleaning-tasks)
- [Key Business Questions Solved](#key-business-questions-solved)
- [Sample SQL Queries](#sample-sql-queries)
- [Insights](#insights)

---

## 📦 About the Dataset

The dataset contains product-level data from Zepto, including:

- `sku_id` (Product ID)
- `name` (Product name)
- `category` (Product category)
- `mrp` (Maximum Retail Price)
- `discountpercent` (Discount offered)
- `discountsellingprice` (Final selling price)
- `availableQuantity` (Quantity available)
- `weightinGms` (Weight of the product)
- `outOfStock` (Boolean flag)
- `quantity` (Stock quantity)

---

## 🛠 Tech Stack

- SQL (PostgreSQL/MySQL compatible)
- GitHub for version control

---

## 🧹 Data Cleaning Tasks

- Removed products where MRP or selling price is `0`
- Converted MRP and Selling Price from Paise to Rupees
- Checked for NULL values in key columns
- Identified duplicate product names

---

## ❓ Key Business Questions Solved

1. 🔝 Top 10 best value products based on discount percentage
2. ❌ High-MRP products that are out of stock
3. 💰 Estimated revenue for each product category
4. 🧐 Products with high MRP but low discounts
5. 🏆 Top 5 categories offering the highest average discount

---

## 💡 Sample SQL Query

```sql
-- Calculate estimated revenue for each category
SELECT category,
       SUM(discountsellingprice * availabeQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue DESC;

📊 Insights
Categories like [you can fill here if known] generated the highest estimated revenue
Certain products have high MRP but low discounts, indicating premium pricing
Several products are duplicated with different SKUs
Many products with great discounts are still out of stock



