# Write your MySQL query statement below
with cte as (
select viewer_id, view_date, count(distinct article_id) as cnt
from Views
group by 1,2)

select distinct viewer_id as id from cte
where cnt>1
order by 1 asc