with buyers_w2 as (
select
	distinct s.ID_BUYER as buyer_w2
from 
	sales_vestiaire s
where 
	s.date_payment >= '2021-01-08' and s.date_payment <='2021-01-15')

,buyers_w2_w1 as (
select
	distinct s.ID_BUYER as buyer_w2_w1
from 
	sales_vestiaire s
where 
	s.date_payment >= '2021-01-01' and s.date_payment <'2021-01-08')

select 
	round(cast (count(*) as float)*100/(select count (distinct s.ID_BUYER) from sales_vestiaire s),2) as pourcentage_w2_w1_buyers
from buyers_w2 b1
inner join buyers_w2_w1 b2 on b1.buyer_w2 = b2.buyer_w2_w1
;