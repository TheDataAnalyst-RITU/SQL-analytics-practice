# Write your MySQL query statement below
SELECT
    c.name AS customer_name,
    o.customer_id,
    o.order_id,
    o.order_date
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM Orders
) o
JOIN Customers c
ON o.customer_id = c.customer_id
WHERE rn <= 3
ORDER BY c.name, o.customer_id, o.order_date DESC;