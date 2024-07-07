select top(10)BRAND,sum(revenue) as Tot_revenue

from 
	sales_vestiaire
group by 
	BRAND
order by	
	sum(revenue) desc ;