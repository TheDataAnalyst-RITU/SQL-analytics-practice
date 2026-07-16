# Write your MySQL query statement below
SELECT transaction_id
FROM (
    SELECT *,
           RANK() OVER(PARTITION BY DATE(day) ORDER BY amount DESC) rnk
    FROM Transactions
) t
WHERE rnk = 1
ORDER BY transaction_id;