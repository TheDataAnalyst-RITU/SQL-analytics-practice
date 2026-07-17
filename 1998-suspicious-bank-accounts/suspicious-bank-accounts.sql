# Write your MySQL query statement below
WITH cte AS (
    SELECT
        t.account_id,
        DATE_FORMAT(day, '%Y-%m') AS month,
        SUM(amount) AS income,
        max_income
    FROM Transactions t
    JOIN Accounts a
    USING (account_id)
    WHERE type = 'Creditor'
    GROUP BY account_id, month
)
SELECT DISTINCT c1.account_id
FROM cte c1
JOIN cte c2
ON c1.account_id = c2.account_id
AND PERIOD_DIFF(REPLACE(c2.month,'-',''), REPLACE(c1.month,'-','')) = 1
WHERE c1.income > c1.max_income
AND c2.income > c2.max_income;