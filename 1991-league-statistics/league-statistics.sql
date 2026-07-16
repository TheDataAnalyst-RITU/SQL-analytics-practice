# Write your MySQL query statement below
WITH cte AS (
    SELECT
        home_team_id AS team_id,
        1 AS matches_played,
        CASE
            WHEN home_team_goals > away_team_goals THEN 3
            WHEN home_team_goals = away_team_goals THEN 1
            ELSE 0
        END AS points,
        home_team_goals AS goal_for,
        away_team_goals AS goal_against
    FROM Matches

    UNION ALL

    SELECT
        away_team_id,
        1,
        CASE
            WHEN away_team_goals > home_team_goals THEN 3
            WHEN away_team_goals = home_team_goals THEN 1
            ELSE 0
        END,
        away_team_goals,
        home_team_goals
    FROM Matches
)

SELECT
    t.team_name,
    SUM(matches_played) AS matches_played,
    SUM(points) AS points,
    SUM(goal_for) AS goal_for,
    SUM(goal_against) AS goal_against,
    SUM(goal_for)-SUM(goal_against) AS goal_diff
FROM Teams t
JOIN cte
ON t.team_id = cte.team_id
GROUP BY t.team_id, t.team_name
ORDER BY points DESC, goal_diff DESC, team_name;