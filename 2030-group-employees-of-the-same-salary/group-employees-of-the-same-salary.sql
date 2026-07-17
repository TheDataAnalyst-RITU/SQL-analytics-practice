# Write your MySQL query statement below
SELECT employee_id,name,salary,
       DENSE_RANK() OVER(ORDER BY salary) team_id
FROM Employees
WHERE salary IN(
    SELECT salary
    FROM Employees
    GROUP BY salary
    HAVING COUNT(*)>1
)
ORDER BY team_id,employee_id;