-- CASE Solution

SELECT query_name, ROUND(AVG(rating / position), 2) AS quality, ROUND(
    COUNT(
    CASE
        WHEN rating < 3 THEN 1
        ELSE NULL
    END) / COUNT(query_name) * 100, 2) AS poor_query_percentage 
FROM Queries
GROUP BY query_name;

-- using case we avoided filtering the rows to count the poor queries, without CASE we need a subquery to count them

-- Sub Query Solution

SELECT query_name, ROUND(AVG(rating / position), 2) AS quality, ROUND( 
    (SELECT COUNT(query_name) 
    FROM Queries q2 
    WHERE q.query_name = q2.query_name AND q2.rating < 3) / COUNT(query_name) * 100, 2) AS poor_query_percentage 
FROM Queries q
GROUP BY query_name;
