# Write your MySQL query statement below
WITH RECURSIVE ids AS (
    SELECT 1 id
    UNION ALL
    SELECT id + 1
    FROM ids
    WHERE id < (SELECT MAX(customer_id) FROM Customers)
)
SELECT id AS ids
FROM ids
WHERE id NOT IN (SELECT customer_id FROM Customers);