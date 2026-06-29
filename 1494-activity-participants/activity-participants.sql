# Write your MySQL query statement below
WITH c AS (
    SELECT activity, COUNT(*) cnt
    FROM Friends
    GROUP BY activity
)
SELECT activity
FROM c
WHERE cnt NOT IN (
    (SELECT MAX(cnt) FROM c),
    (SELECT MIN(cnt) FROM c)
);