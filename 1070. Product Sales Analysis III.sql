-- Ranking Solution

SELECT product_id, year AS first_year, quantity, price
FROM (SELECT *, DENSE_RANK() OVER(PARTITION BY product_id ORDER BY year) AS d_rank FROM Sales) AS sales_with_ranking
WHERE d_rank = 1;


-- CTE Solution

WITH sale_earliest_year AS(
    SELECT product_id, MIN(year) as earliest_year
    FROM Sales
    GROUP BY product_id
)
SELECT s.product_id, s.year AS first_year, s.quantity, s.price
FROM Sales s
JOIN sale_earliest_year sey
ON s.product_id = sey.product_id AND s.year = sey.earliest_year;
