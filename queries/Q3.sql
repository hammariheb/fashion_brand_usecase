SELECT
        LEAST(c1.COUNTRY, c2.COUNTRY) AS country1,
        GREATEST(c1.COUNTRY, c2.COUNTRY) AS country2,
        SUM(s.REVENUE) AS revenue_generated_countries
    FROM 
        sales_vestiaire s
    LEFT JOIN 
        country c1 ON s.ID_BUYER_COUNTRY = c1.ID_COUNTRY
    LEFT JOIN 
        country c2 ON s.ID_SELLER_COUNTRY = c2.ID_COUNTRY
    GROUP BY 
        LEAST(c1.COUNTRY, c2.COUNTRY),
        GREATEST(c1.COUNTRY, c2.COUNTRY)
	order by 
		revenue_generated_countries desc;