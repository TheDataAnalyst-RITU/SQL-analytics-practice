# Write your MySQL query statement below
WITH cte AS (
    SELECT caller_id id, duration FROM Calls
    UNION ALL
    SELECT callee_id, duration FROM Calls
)

SELECT c.name AS country
FROM cte
JOIN Person p
ON cte.id = p.id
JOIN Country c
ON LEFT(p.phone_number,3) = c.country_code
GROUP BY c.name
HAVING AVG(duration) > (SELECT AVG(duration) FROM Calls)
;