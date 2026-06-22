# Write your MySQL query statement below
with cte as (
SELECT student_id, course_id, grade
, row_number() over(partition by student_id order by grade desc ,course_id asc) as rw
from Enrollments
)

select student_id, course_id, grade
from cte where rw=1
order by student_id asc