
WITH buyers_w2 AS (
    SELECT DISTINCT
        s.ID_BUYER AS buyer_w2,
        SUM(s.REVENUE) AS revenue_w2
    FROM 
        sales_vestiaire s
    WHERE 
        s.date_payment >= '2021-01-08' AND s.date_payment <= '2021-01-15'
    GROUP BY 
        s.ID_BUYER
),
buyers_w2_w1 AS (
    SELECT DISTINCT
        s.ID_BUYER AS buyer_w2_w1,
        SUM(s.REVENUE) AS revenue_w1
    FROM 
        sales_vestiaire s
    WHERE 
        s.date_payment >= '2021-01-01' AND s.date_payment < '2021-01-08'
    GROUP BY 
        s.ID_BUYER
)

SELECT 
    b2.revenue_w1,
    b1.revenue_w2,
    CASE 
        WHEN b1.revenue_w2 > b2.revenue_w1 THEN CONCAT(CAST((b1.revenue_w2 - b2.revenue_w1) / b2.revenue_w1 * 100 AS DECIMAL(10,2)), ' %increase')
        WHEN b1.revenue_w2 < b2.revenue_w1 THEN CONCAT(CAST(-(b2.revenue_w1 - b1.revenue_w2) / b2.revenue_w1 * 100 AS DECIMAL(10,2)), ' %decrease')
        ELSE 'No change'  
    END AS inc_or_dec_percentage
FROM 
    buyers_w2 b1
INNER JOIN
    buyers_w2_w1 b2 ON b1.buyer_w2 = b2.buyer_w2_w1;
