# Write your MySQL query statement below
with cte as (
    select candidateId, c.name as Cname,v.id as id
    from Vote v
    join Candidate c
    on v.candidateId=c.id),
cte2 as (Select Cname as name, count(id) as c
from cte 
group by name
order by c desc
limit 1)
select name from cte2