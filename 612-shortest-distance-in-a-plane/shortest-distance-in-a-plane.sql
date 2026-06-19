# Write your MySQL query statement below
with cte as(
select t1.x as x1,t1.y as y1,t2.x as x2 ,t2.y as y2
from Point2D as t1
cross join Point2D as t2)
, cte2 as (
select round(SQRT(POWER(x2 - x1, 2) + POWER(y2 - y1, 2)),2) as dist
from cte
where not (x1=x2 and y1=y2))
select min(dist) as shortest from cte2