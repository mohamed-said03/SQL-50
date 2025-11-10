-- JOIN Solution

SELECT today.id
FROM Weather today
INNER JOIN Weather yesterday
ON DATEDIFF(today.recordDate, yesterday.recordDate) = 1 
WHERE today.temperature > yesterday.temperature;


-- Sub Query Solution

SELECT id
FROM Weather today
WHERE EXISTS(
    SELECT id
    FROM Weather yesterday
    WHERE DATEDIFF(today.recordDate, yesterday.recordDate) = 1 AND today.temperature > yesterday.temperature
);