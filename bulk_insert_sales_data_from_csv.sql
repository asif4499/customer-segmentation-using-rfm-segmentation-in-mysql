LOAD DATA INFILE '/var/lib/mysql-files/Superstore_Sales_Data.csv'
INTO TABLE sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    row_id,
    order_priority,
    discount,
    unit_price,
    shipping_cost,
    customer_id,
    customer_name,
    ship_mode,
    customer_segment,
    product_category,
    product_sub_category,
    product_container,
    product_name,
    @product_base_margin, -- Use a variable to handle empty strings
    region,
    manager,
    state_or_province,
    city,
    postal_code,
    order_date,
    ship_date,
    profit,
    quantity_ordered,
    sales,
    order_id,
    return_status
)
SET product_base_margin = IF(@product_base_margin = '', 0, @product_base_margin); -- Replace empty strings with 0
