SELECT
    c.country,
   SUM (s.revenue)*100/(select sum(s1.revenue) from sales_vestiaire s1) as contribition_sales_country,
    CAST(COUNT(DISTINCT s.id_product) AS FLOAT)*100/ 
    CAST((SELECT COUNT(DISTINCT s2.id_product) FROM sales_vestiaire s2) AS FLOAT) AS contribution_nbItems_sold_country
FROM 
    sales_vestiaire s
LEFT JOIN 
    country c ON s.ID_SELLER_COUNTRY = c.ID_COUNTRY
GROUP BY 
    c.country
order by 
	contribition_sales_country desc;