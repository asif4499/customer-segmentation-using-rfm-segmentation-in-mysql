-- explore_data.sql
-- This script explores the data to ensure it is in the proper format and identifies any inconsistencies.

-- Check the first 10 rows of the data
SELECT * FROM sales LIMIT 10;

-- Check for missing values in critical columns
SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN row_id IS NULL THEN 1 ELSE 0 END) AS missing_row_id,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS missing_sales
FROM sales;

-- Check for duplicate rows based on row_id (primary key)
SELECT row_id, COUNT(*)
FROM sales
GROUP BY row_id
HAVING COUNT(*) > 1;

-- Check data types and column structure
DESCRIBE sales;

-- Check for invalid dates (e.g., order_date > ship_date)
SELECT *
FROM sales
WHERE order_date > ship_date;

-- Check for negative values in numeric columns (e.g., sales, profit, quantity_ordered)
SELECT *
FROM sales
WHERE sales < 0 OR profit < 0 OR quantity_ordered < 0;
