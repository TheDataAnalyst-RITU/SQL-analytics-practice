# Write your MySQL query statement below
SELECT *
FROM products
WHERE REGEXP_LIKE(description, '(^| )SN[0-9]{4}-[0-9]{4}( |$)', 'c')
ORDER BY (product_id) ASC
# ^ inside [] means "not"
# | → OR
# $ → end of string
# ^ →start of string
# Use REGEXP BINARY so MySQL treats the pattern as case-sensitive:
#REGEXP_LIKE(column, pattern, 'c')
#'c' → makes regex case-sensitive