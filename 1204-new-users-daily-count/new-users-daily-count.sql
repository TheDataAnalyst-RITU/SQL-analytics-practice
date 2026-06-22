# Write your MySQL query statement below
WITH cte AS (
    SELECT
        user_id,
        activity_date,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY activity_date
        ) AS rn
    FROM Traffic
    WHERE activity = 'login'
)

SELECT
    activity_date AS login_date,
    COUNT(*) AS user_count
FROM cte
WHERE rn = 1
  AND activity_date BETWEEN DATE_SUB('2019-06-30', INTERVAL 90 DAY)
                        AND '2019-06-30'
GROUP BY activity_date;