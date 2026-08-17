# Write your MySQL query statement below
WITH t AS (
    SELECT departure_airport AS airport_id, flights_count FROM Flights
    UNION ALL
    SELECT arrival_airport, flights_count FROM Flights
)
SELECT airport_id
FROM t
GROUP BY airport_id
HAVING SUM(flights_count) = (SELECT MAX(total) FROM (
    SELECT SUM(flights_count) AS total
    FROM t
    GROUP BY airport_id
) x);