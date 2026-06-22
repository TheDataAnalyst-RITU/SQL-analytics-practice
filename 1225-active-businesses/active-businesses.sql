SELECT business_id
FROM (
    SELECT
        event_type,
        AVG(occurrences) AS avg_occurrences
    FROM Events
    GROUP BY event_type
) AS temp1
JOIN Events AS e2
    ON temp1.event_type = e2.event_type
WHERE e2.occurrences > temp1.avg_occurrences
GROUP BY business_id
HAVING COUNT(DISTINCT temp1.event_type) > 1;