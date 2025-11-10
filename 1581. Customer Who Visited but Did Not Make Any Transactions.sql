-- JOIN Solution

SELECT v.customer_id, COUNT(v.customer_id) AS count_no_trans 
FROM Visits v
LEFT OUTER JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id


-- Sub Query Solutions

-- using IN
SELECT customer_id, COUNT(visit_id) AS count_no_trans 
FROM Visits
WHERE visit_id NOT IN (
    SELECT visit_id
    FROM Transactions
)
GROUP BY customer_id;

-- using EXISTS
SELECT customer_id, COUNT(visit_id) AS count_no_trans 
FROM Visits v
WHERE NOT EXISTS (
    SELECT visit_id
    FROM Transactions t
    where v.visit_id = t.visit_id
)
GROUP BY customer_id;

-- using ALL
SELECT customer_id, COUNT(visit_id) AS count_no_trans 
FROM Visits v
WHERE v.visit_id <> ALL (
    SELECT visit_id
    FROM Transactions t
    WHERE v.visit_id = t.visit_id
)
GROUP BY customer_id;
