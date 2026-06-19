WITH counts AS (
    SELECT id, COUNT(*) AS num
    FROM (
        SELECT requester_id AS id FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id FROM RequestAccepted
    ) t
    GROUP BY id
)
SELECT id, num
FROM counts
WHERE num = (SELECT MAX(num) FROM counts);