-- null not counted, but 0 counted and return 1 so null is the correct choice in else
SELECT 'Low Salary' AS category, COUNT(IF(income < 20000, 1, null)) AS accounts_count
FROM Accounts

UNION ALL -- faster than union, no need to check the duplication

SELECT 'High Salary' AS category, COUNT(IF(income > 50000, 1, null)) AS accounts_count
FROM Accounts

UNION ALL

SELECT 'Average Salary' AS category, COUNT(IF(income >= 20000 and income <= 50000, 1, null)) AS accounts_count
FROM Accounts
