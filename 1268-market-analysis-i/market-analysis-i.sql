# Write your MySQL query statement below
with cte as (
select buyer_id as bid,join_date, count(order_id) as orders_in_2019
from Users u
left join Orders o
on o.buyer_id=u.user_id
where YEAR(order_date)=2019
group by 1)

select user_id as buyer_id, u.join_date, coalesce(orders_in_2019,0) as orders_in_2019
from Users u
left join cte
on u.user_id=cte.bid