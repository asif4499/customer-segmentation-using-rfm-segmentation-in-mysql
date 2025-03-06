-- rfm_segmentation.sql
-- This script segments customers using RFM (Recency, Frequency, Monetary) analysis.

-- Step 1: Calculate RFM metrics for each customer
WITH rfm_calculations AS (
    SELECT
        customer_id,
        DATEDIFF(CURDATE(), MAX(order_date)) AS recency, -- Days since last order
        COUNT(*) AS frequency, -- Number of orders
        SUM(sales) AS monetary -- Total sales
    FROM sales
    GROUP BY customer_id
),

-- Step 2: Assign RFM scores (1-4, where 4 is the best)
rfm_scores AS (
    SELECT
        customer_id,
        recency,
        frequency,
        monetary,
        NTILE(4) OVER (ORDER BY recency DESC) AS r_score, -- Higher recency is worse
        NTILE(4) OVER (ORDER BY frequency) AS f_score, -- Higher frequency is better
        NTILE(4) OVER (ORDER BY monetary) AS m_score -- Higher monetary is better
    FROM rfm_calculations
)

-- Step 3: Create RFM segments
SELECT
    customer_id,
    recency,
    frequency,
    monetary,
    r_score,
    f_score,
    m_score,
    CONCAT(r_score, f_score, m_score) AS rfm_score,
    CASE
        WHEN r_score = 4 AND f_score = 4 AND m_score = 4 THEN 'Best Customers'
        WHEN r_score >= 3 AND f_score >= 3 AND m_score >= 3 THEN 'Loyal Customers'
        WHEN r_score <= 2 AND f_score >= 3 AND m_score >= 3 THEN 'At-Risk Customers'
        WHEN r_score <= 2 AND f_score <= 2 AND m_score <= 2 THEN 'Lost Customers'
        ELSE 'Other'
    END AS rfm_segment
FROM rfm_scores
ORDER BY rfm_score DESC;
