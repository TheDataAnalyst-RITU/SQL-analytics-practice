# Write your MySQL query statement below
WITH CTE AS ( SELECT email as Email, COUNT(*) CNT
FROM Person
GROUP BY email
)
SELECT Email from cte
where cnt >1