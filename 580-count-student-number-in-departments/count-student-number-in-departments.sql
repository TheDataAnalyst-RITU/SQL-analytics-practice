# Write your MySQL query statement below
with cte as (select d.dept_name as dept_name, count(student_id) as student_number1
from Student s
left join Department d
on s.dept_id=d.dept_id
group by 1)

, cte2 as ( select distinct dept_name from Department
)

select c2.dept_name as dept_name, coalesce(c1.student_number1,null,0) as student_number
from cte2 c2
left join cte c1
on c1.dept_name= c2.dept_name
order by student_number desc, dept_name asc

