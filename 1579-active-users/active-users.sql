# Write your MySQL query statement below
WITH cte AS (
    SELECT DISTINCT id, login_date
    FROM Logins
),
grp AS (
    SELECT *,
           DATE_SUB(login_date, INTERVAL ROW_NUMBER() OVER(
               PARTITION BY id ORDER BY login_date
           ) DAY) AS g
    FROM cte
),
active AS (
    SELECT id
    FROM grp
    GROUP BY id, g
    HAVING COUNT(*) >= 5
)

SELECT DISTINCT a.id, a.name
FROM Accounts a
JOIN active b
ON a.id = b.id
ORDER BY a.id;