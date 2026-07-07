# Write your MySQL query statement below
SELECT company_id,
       employee_id,
       employee_name,
       ROUND(salary * CASE
                        WHEN mx < 1000 THEN 1
                        WHEN mx <= 10000 THEN 0.76
                        ELSE 0.51
                      END) AS salary
FROM (
    SELECT *,
           MAX(salary) OVER(PARTITION BY company_id) AS mx
    FROM Salaries
) s;