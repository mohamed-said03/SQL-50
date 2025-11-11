-- JOIN Solution

SELECT s.user_id, Round(Count(confirmed.action) / Count(s.user_id), 2) AS confirmation_rate 
FROM Signups s
LEFT OUTER JOIN Confirmations c
ON s.user_id = c.user_id
LEFT OUTER JOIN Confirmations confirmed
ON confirmed.action = 'confirmed' AND c.user_id = confirmed.user_id AND c.time_stamp = confirmed.time_stamp
GROUP BY s.user_id


-- Sub Query with CASE Solution

SELECT s.user_id, (SELECT ROUND(COALESCE(
    COUNT(
        (CASE 
            WHEN c.action = 'confirmed' THEN 1
            ELSE NULL
        END)) / COUNT(*)
    , 0), 2) 
    FROM Confirmations c
    WHERE c.user_id = s.user_id) AS confirmation_rate
FROM Signups s
GROUP BY s.user_id;


-- JOIN With Sub Query Solution

SELECT s.user_id, ROUND(COALESCE(COUNT(c.user_id) / (
    SELECT COUNT(*)
    FROM Signups s2
    LEFT OUTER JOIN Confirmations c
    ON s2.user_id = c.user_id
    WHERE s.user_id = c.user_id)
    , 0), 2) AS confirmation_rate
FROM Signups s
LEFT OUTER JOIN Confirmations c
ON s.user_id = c.user_id AND c.action = 'confirmed'
GROUP BY s.user_id;


-- Sub Query Solution

SELECT s.user_id, ROUND(COALESCE(
    (SELECT COUNT(c.user_id)
    FROM Confirmations c
    WHERE c.user_id = s.user_id AND c.action ='confirmed')
    /
    (SELECT COUNT(*)
    FROM Signups s2
    LEFT OUTER JOIN Confirmations c
    ON s2.user_id = c.user_id
    WHERE s.user_id = c.user_id)
    , 0), 2) AS confirmation_rate
FROM Signups s
GROUP BY s.user_id;