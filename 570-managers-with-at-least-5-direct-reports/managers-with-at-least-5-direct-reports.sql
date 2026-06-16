with cte as (
SELECT e2.id as id,e2.name as name, count(e1.managerId) as cnt
FROM Employee e1
join Employee e2
on e1.managerId=e2.id
group by 1)
select name
from cte where cnt>=5