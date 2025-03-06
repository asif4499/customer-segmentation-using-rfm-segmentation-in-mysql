# How to Use
### 1. Clone this repository:
* [git clone https://github.com/your-username/customer-segmentation-using-rfm-segmentation-in-mysql.git](https://github.com/asif4499/customer-segmentation-using-rfm-segmentation-in-mysql.git)
* cd customer-segmentation-using-rfm-segmentation-in-mysql

### 2. Run the SQL scripts in order:
* mysql -u your_username -p < create_mysql_database.sql
* mysql -u your_username -p sales_data < create_sales_table.sql
* mysql -u your_username -p sales_data < bulk_insert_sales_data_from_csv.sql
* mysql -u your_username -p sales_data < explore_data.sql
* mysql -u your_username -p sales_data < data_cleaning.sql
* mysql -u your_username -p sales_data < exploratory_data_analysis.sql
* mysql -u your_username -p sales_data < rfm_segmentation.sql

### 3. Review the results in your MySQL client or terminal.

# Script Details
* create_mysql_database.sql: Creates the sales_data database.
* create_sales_table.sql: Creates the sales table.
* bulk_insert_sales_data_from_csv.sql: Loads data from Superstore_Sales_Data.csv into the sales table.
* explore_data.sql: Explores the data for missing values, duplicates, and inconsistencies.
* data_cleaning.sql: Cleans the data by removing invalid rows and updating the schema if necessary.
* exploratory_data_analysis.sql: Performs exploratory data analysis to uncover trends and patterns.
* rfm_segmentation.sql: Segments customers using RFM analysis.
