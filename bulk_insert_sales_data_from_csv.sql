LOAD DATA INFILE '/path/Superstore_Sales_Data.csv' --replace your file path--
INTO TABLE sales
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
