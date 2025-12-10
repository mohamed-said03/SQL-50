-- Sub Query Solution

SELECT MAX(num) AS num
FROM (SELECT num 
    FROM MyNumbers 
    GROUP BY num 
    HAVING COUNT(num) = 1) AS nums;


-- Order By Solution
-- IFNULL to return NULL when the result is empty or we can select from sub query like the solution above
SELECT IFNULL(
(SELECT num
FROM MyNumbers 
GROUP BY num
HAVING COUNT(num) = 1
ORDER BY num DESC
LIMIT 1), NULL) as num;
