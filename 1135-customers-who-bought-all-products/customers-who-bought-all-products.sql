# Write your MySQL query statement below
with cte as (
    select count(*) as cnt1 from Product 
)
,
cte2 as 
(
select customer_id, count(distinct product_key) as cnt2
from Customer
group by 1
)
select customer_id from cte2
where cnt2 =(select cnt1 from cte)