# Write your MySQL query statement below
SELECT e.name as employee
FROM Employee as e
JOIN Employee as m
ON e.managerId = m.id
WHERE e.salary > m.salary