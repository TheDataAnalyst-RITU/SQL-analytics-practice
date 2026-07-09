# Write your MySQL query statement below
SELECT
    u.user_id,
    u.user_name,
    u.credit + IFNULL(SUM(t.amount),0) AS credit,
    IF(u.credit + IFNULL(SUM(t.amount),0) < 0,'Yes','No') AS credit_limit_breached
FROM Users u
LEFT JOIN (
    SELECT paid_to AS user_id, amount
    FROM Transactions
    UNION ALL
    SELECT paid_by, -amount
    FROM Transactions
) t
ON u.user_id = t.user_id
GROUP BY u.user_id;