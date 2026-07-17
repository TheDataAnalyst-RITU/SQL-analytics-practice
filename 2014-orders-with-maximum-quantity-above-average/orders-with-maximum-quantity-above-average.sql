# Write your MySQL query statement below
WITH cte AS (
    SELECT order_id,
           MAX(quantity) mx,
           AVG(quantity) avg_qty
    FROM OrdersDetails
    GROUP BY order_id
)
SELECT order_id
FROM cte
WHERE mx > (SELECT MAX(avg_qty) FROM cte);