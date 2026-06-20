# Write your MySQL query statement below
with cte as (select project_id, p.employee_id,
dense_rank() over(partition by project_id order by e.experience_years desc) as rnk
from Project p
left join Employee e
on p.employee_id=e.employee_id)
select project_id,employee_id from cte
where rnk=1