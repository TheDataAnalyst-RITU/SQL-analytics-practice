# Write your MySQL query statement below
WITH p AS (
    SELECT 'Android' platform UNION ALL
    SELECT 'IOS' UNION ALL
    SELECT 'Web'
),
e AS (
    SELECT 'Reading' experiment_name UNION ALL
    SELECT 'Sports' UNION ALL
    SELECT 'Programming'
)

SELECT
    p.platform,
    e.experiment_name,
    COUNT(ex.experiment_id) num_experiments
FROM p
CROSS JOIN e
LEFT JOIN Experiments ex
ON p.platform = ex.platform
AND e.experiment_name = ex.experiment_name
GROUP BY p.platform, e.experiment_name;