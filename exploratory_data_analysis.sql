-- exploratory_data_analysis.sql
-- This script performs exploratory data analysis to uncover trends and patterns.

-- Total number of orders
SELECT COUNT(*) AS total_orders FROM sales;

-- Total revenue and profit
SELECT 
    SUM(sales) AS total_revenue,
    SUM(profit) AS total_profit
FROM sales;

-- Average sales and profit per order
SELECT 
    AVG(sales) AS avg_sales,
    AVG(profit) AS avg_profit
FROM sales;

-- Number of orders and total sales per customer
SELECT 
    customer_id,
    COUNT(*) AS num_orders,
    SUM(sales) AS total_sales
FROM sales
GROUP BY customer_id
ORDER BY total_sales DESC;

-- Sales and profit by product category
SELECT 
    product_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_category
ORDER BY total_sales DESC;

-- Sales and profit by region
SELECT 
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- Top 10 customers by total sales
SELECT 
    customer_id,
    customer_name,
    SUM(sales) AS total_sales
FROM sales
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Sales trend over time (monthly)
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    SUM(sales) AS monthly_sales
FROM sales
GROUP BY order_month
ORDER BY order_month;
