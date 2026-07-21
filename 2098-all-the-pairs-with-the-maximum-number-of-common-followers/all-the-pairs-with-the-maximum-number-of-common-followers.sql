# Write your MySQL query statement below
WITH c AS (
    SELECT a.user_id user1_id,b.user_id user2_id,COUNT(*) cnt
    FROM Relations a
    JOIN Relations b
      ON a.follower_id=b.follower_id
     AND a.user_id<b.user_id
    GROUP BY 1,2
)
SELECT user1_id,user2_id
FROM c
WHERE cnt=(SELECT MAX(cnt) FROM c);