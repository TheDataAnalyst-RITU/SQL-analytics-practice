# Write your MySQL query statement below
WITH f AS (
    SELECT user1_id u, user2_id f FROM Friendship
    UNION ALL
    SELECT user2_id, user1_id FROM Friendship
)
SELECT a.u user1_id,
       b.u user2_id,
       COUNT(*) common_friend
FROM f a
JOIN f b
  ON a.f=b.f
 AND a.u<b.u
JOIN Friendship c
  ON c.user1_id=a.u
 AND c.user2_id=b.u
GROUP BY a.u,b.u
HAVING COUNT(*)>=3;