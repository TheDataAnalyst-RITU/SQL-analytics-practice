WITH daily_spam AS (
    SELECT 
        action_date,
        COUNT(DISTINCT post_id) AS spam_posts
    FROM Actions
    WHERE extra = 'spam'
    GROUP BY action_date
),
daily_removed AS (
    SELECT 
        a.action_date,
        COUNT(DISTINCT r.post_id) AS removed_posts
    FROM Actions a
    LEFT JOIN Removals r
        ON a.post_id = r.post_id
    WHERE a.extra = 'spam'
    GROUP BY a.action_date
)
SELECT 

    ROUND(AVG(removed_posts / spam_posts) * 100, 2) AS average_daily_percent
FROM daily_spam s
JOIN daily_removed r
    ON s.action_date = r.action_date;