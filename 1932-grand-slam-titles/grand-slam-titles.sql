# Write your MySQL query statement below
SELECT
    p.player_id,
    p.player_name,
    COUNT(*) grand_slams_count
FROM Players p
JOIN (
    SELECT Wimbledon player_id FROM Championships
    UNION ALL
    SELECT Fr_open FROM Championships
    UNION ALL
    SELECT US_open FROM Championships
    UNION ALL
    SELECT Au_open FROM Championships
) c
ON p.player_id = c.player_id
GROUP BY p.player_id, p.player_name;