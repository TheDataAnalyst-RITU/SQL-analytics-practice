# Write your MySQL query statement below
with cte as (select num, 
lag(num,1) over() as prev1,
lead(num,1) over() as nxt1
from Logs)
select distinct num as ConsecutiveNums
from cte
where num=prev1 and num=nxt1