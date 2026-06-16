# Write your MySQL query statement below
with cte as (select player_id, event_date, 
sum(games_played) over(partition by player_id order by event_date asc) as games_played_so_far from Activity
)
select player_id, event_date, games_played_so_far 
from cte