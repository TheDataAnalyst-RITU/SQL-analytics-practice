# Write your MySQL query statement below
SELECT m.member_id, m.name,
CASE
 WHEN COUNT(v.visit_id)=0 THEN 'Bronze'
 WHEN COUNT(p.visit_id)*100/COUNT(v.visit_id)>=80 THEN 'Diamond'
 WHEN COUNT(p.visit_id)*100/COUNT(v.visit_id)>=50 THEN 'Gold'
 ELSE 'Silver'
END category
FROM Members m
LEFT JOIN Visits v ON m.member_id=v.member_id
LEFT JOIN Purchases p ON v.visit_id=p.visit_id
GROUP BY m.member_id, m.name;