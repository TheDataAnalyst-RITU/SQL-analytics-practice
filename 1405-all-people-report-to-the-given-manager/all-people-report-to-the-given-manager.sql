# Write your MySQL query statement below
SELECT employee_id
FROM Employees
WHERE employee_id <> 1
AND (
    manager_id = 1
    OR manager_id IN (
        SELECT employee_id
        FROM Employees
        WHERE manager_id = 1
    )
    OR manager_id IN (
        SELECT employee_id
        FROM Employees
        WHERE manager_id IN (
            SELECT employee_id
            FROM Employees
            WHERE manager_id = 1
        )
    )
);