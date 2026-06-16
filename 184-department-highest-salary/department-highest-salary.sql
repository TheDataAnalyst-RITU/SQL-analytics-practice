# Write your MySQL query statement below
with cte as (
select e.name as name, d.name as Department, e.salary as salary,
dense_rank() over (partition by d.name order by e.Salary desc) as rnk
from Employee e
left join Department d
on e.departmentId=d.id
)
select Department, name as Employee, salary
from cte 
where rnk=1