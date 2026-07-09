# Write your MySQL query statement below
SELECT
    customer_id,
    product_id,
    product_name
FROM (
    SELECT
        o.customer_id,
        o.product_id,
        p.product_name,
        RANK() OVER (
            PARTITION BY o.customer_id
            ORDER BY COUNT(*) DESC
        ) AS rk
    FROM Orders o
    JOIN Products p
    USING(product_id)
    GROUP BY o.customer_id, o.product_id
) t
WHERE rk = 1;