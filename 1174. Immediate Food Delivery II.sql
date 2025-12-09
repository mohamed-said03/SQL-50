-- cte with ranking function solution

WITH orders_with_ranking AS(
    SELECT customer_id, order_date, customer_pref_delivery_date, 
    RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS order_rank
    FROM Delivery
)
SELECT ROUND(AVG(
    CASE
        WHEN customer_pref_delivery_date = order_date THEN 1
        ELSE 0
    END
) * 100, 2) AS immediate_percentage
FROM orders_with_ranking
WHERE order_rank = 1;
