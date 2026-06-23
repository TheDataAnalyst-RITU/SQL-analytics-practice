# Write your MySQL query statement below
with above as (select distinct customer_id, min(order_date) as d1, min(customer_pref_delivery_date) as d2
from Delivery
group by 1),

above2 as (select customer_id, 
case when d1=d2 then 'immediate' else 'scheduled' end as pref
from above)

select round((sum(case when pref='immediate' then 1 else 0 end)/count(*))*100,2) as immediate_percentage
from above2