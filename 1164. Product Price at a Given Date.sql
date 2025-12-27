WITH last_date AS(
    SELECT product_id, MAX(change_date) AS date
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
    )
, IDs AS(
    SELECT DISTINCT product_id 
    FROM Products
    )
SELECT id.product_id, IFNULL(p.new_price, 10) AS price
FROM Products p
JOIN last_date ld
ON p.product_id = ld.product_id AND p.change_date = ld.date
RIGHT OUTER JOIN IDs id
ON p.product_id = id.product_id;