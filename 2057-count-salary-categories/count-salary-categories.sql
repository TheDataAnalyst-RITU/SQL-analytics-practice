# Write your MySQL query statement below
SELECT 'Low Salary' category,SUM(income<20000) accounts_count FROM Accounts
UNION ALL
SELECT 'Average Salary',SUM(income BETWEEN 20000 AND 50000) FROM Accounts
UNION ALL
SELECT 'High Salary',SUM(income>50000) FROM Accounts;