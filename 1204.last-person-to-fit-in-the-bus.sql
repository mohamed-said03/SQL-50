-- good resource: https://stackoverflow.com/questions/2563918/create-a-cumulative-sum-column-in-mysql

-- window function solution
WITH Q_cumulative_weight AS(
    SELECT *, SUM(weight) OVER (ORDER BY turn) AS cumulative_weight
    FROM Queue
    )
SELECT person_name
FROM Q_cumulative_weight
WHERE cumulative_weight <= 1000
ORDER BY turn DESC
LIMIT 1;


-- variable solution
WITH Q_cumulative_weight AS(
    SELECT *, @total := @total + q.weight AS cumulative_weight
    FROM Queue q
    JOIN (SELECT @total := 0) AS init
    ORDER BY q.turn
    )
SELECT person_name
FROM Q_cumulative_weight
WHERE cumulative_weight <= 1000
ORDER BY turn DESC
LIMIT 1;