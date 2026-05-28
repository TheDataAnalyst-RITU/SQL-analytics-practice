# Write your MySQL query statement below
SELECT w.name as warehouse_name, SUM((p.width*p.length*p.height)*units)AS volume
FROM Warehouse AS w
JOIN Products AS p
ON w.product_id = p.product_id
GROUP BY w.name