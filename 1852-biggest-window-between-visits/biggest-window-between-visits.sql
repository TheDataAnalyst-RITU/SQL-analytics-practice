# Write your MySQL query statement below
WITH cte AS (
    SELECT
        user_id,
        DATEDIFF(
            LEAD(visit_date, 1, '2021-01-01') OVER (
                PARTITION BY user_id
                ORDER BY visit_date
            ),
            visit_date
        ) AS window_days
    FROM UserVisits
)

SELECT
    user_id,
    MAX(window_days) AS biggest_window
FROM cte
GROUP BY user_id
ORDER BY user_id;