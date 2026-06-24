# Write your MySQL query statement below
WITH cte AS (
    SELECT
        DATE_FORMAT(trans_date,'%Y-%m') AS month,
        country,
        COUNT(*) AS approved_count,
        SUM(amount) AS approved_amount,
        0 AS chargeback_count,
        0 AS chargeback_amount
    FROM Transactions
    WHERE state='approved'
    GROUP BY 1,2

    UNION ALL

    SELECT
        DATE_FORMAT(c.trans_date,'%Y-%m') AS month,
        t.country,
        0,
        0,
        COUNT(*) AS chargeback_count,
        SUM(t.amount) AS chargeback_amount
    FROM Chargebacks c
    JOIN Transactions t
    ON c.trans_id=t.id
    GROUP BY 1,2
)

SELECT
    month,
    country,
    SUM(approved_count) AS approved_count,
    SUM(approved_amount) AS approved_amount,
    SUM(chargeback_count) AS chargeback_count,
    SUM(chargeback_amount) AS chargeback_amount
FROM cte
GROUP BY 1,2;