# Write your MySQL query statement below
WITH showaction AS (
    SELECT
        question_id,
        COUNT(*) AS shows
    FROM SurveyLog
    WHERE action = 'show'
    GROUP BY question_id
),
answeredquestion AS (
    SELECT
        question_id,
        COUNT(*) AS answers
    FROM SurveyLog
    WHERE action = 'answer'
    GROUP BY question_id
)

SELECT s.question_id AS survey_log
FROM showaction s
LEFT JOIN answeredquestion a
    ON s.question_id = a.question_id
ORDER BY COALESCE(a.answers,0) / s.shows DESC,
         s.question_id ASC
LIMIT 1;