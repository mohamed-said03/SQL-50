-- cte solution

WITH first_event AS(
    SELECT player_id, MIN(event_date) AS event_date
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(COUNT(a.player_id) / COUNT(fa.player_id), 2) AS fraction
FROM first_event fa
LEFT OUTER JOIN Activity a
ON fa.player_id = a.player_id AND DATEDIFF(a.event_date, fa.event_date) = 1;
