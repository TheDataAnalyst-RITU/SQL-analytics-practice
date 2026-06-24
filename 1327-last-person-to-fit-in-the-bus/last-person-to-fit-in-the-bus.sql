# Write your MySQL query statement below
with cte as (
Select person_id, turn, person_name,
sum(Weight) over (order by turn asc) as cmweight
from Queue)
select person_name 
from cte 
where cmweight<=1000
order by turn desc
limit 1