-- data_cleaning.sql
-- This script cleans the data and updates the table schema if necessary.

-- Remove rows with missing critical data
DELETE FROM sales
WHERE row_id IS NULL OR customer_id IS NULL OR order_date IS NULL OR sales IS NULL;

-- Remove duplicate rows based on row_id (if any)
DELETE FROM sales
WHERE row_id IN (
    SELECT row_id
    FROM (
        SELECT row_id, ROW_NUMBER() OVER (PARTITION BY row_id ORDER BY row_id) AS rn
        FROM sales
    ) AS duplicates
    WHERE rn > 1
);

-- Update invalid dates (e.g., order_date > ship_date)
UPDATE sales
SET ship_date = order_date
WHERE order_date > ship_date;

-- Correct negative values in numeric columns (e.g., sales, profit, quantity_ordered)
UPDATE sales
SET sales = ABS(sales), profit = ABS(profit), quantity_ordered = ABS(quantity_ordered)
WHERE sales < 0 OR profit < 0 OR quantity_ordered < 0;

-- Update the schema if necessary (e.g., change postal_code to INT)
ALTER TABLE sales
MODIFY COLUMN postal_code INT;
