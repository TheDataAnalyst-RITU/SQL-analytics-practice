# Write your MySQL query statement below
SELECT
    p.product_name,
    o.product_id,
    o.order_id,
    o.order_date
FROM (
    SELECT *,
           RANK() OVER(PARTITION BY product_id ORDER BY order_date DESC) rk
    FROM Orders
) o
JOIN Products p
ON o.product_id = p.product_id
WHERE rk = 1
ORDER BY p.product_name, o.product_id, o.order_id;