# Write your MySQL query statement below
WITH medals AS (
    SELECT contest_id, gold_medal user_id FROM Contests
    UNION ALL
    SELECT contest_id, silver_medal FROM Contests
    UNION ALL
    SELECT contest_id, bronze_medal FROM Contests
),
consecutive AS (
    SELECT DISTINCT user_id
    FROM (
        SELECT *,
               LAG(contest_id,1) OVER(PARTITION BY user_id ORDER BY contest_id) p1,
               LAG(contest_id,2) OVER(PARTITION BY user_id ORDER BY contest_id) p2
        FROM medals
    ) t
    WHERE contest_id=p1+1 AND p1=p2+1
),
gold AS (
    SELECT gold_medal user_id
    FROM Contests
    GROUP BY gold_medal
    HAVING COUNT(*)>=3
)
SELECT DISTINCT name, mail
FROM Users
WHERE user_id IN (
    SELECT user_id FROM consecutive
    UNION
    SELECT user_id FROM gold
);