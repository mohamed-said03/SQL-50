-- JOIN Solution

SELECT manager.name
FROM Employee manager
JOIN Employee emp
ON manager.id = emp.managerId
GROUP BY manager.id
HAVING COUNT(emp.id) >= 5;


-- Sub Query Solutions

-- using Grouping
SELECT manager.name
FROM Employee manager
WHERE manager.id in (
    SELECT emp.managerId
    FROM Employee emp
    GROUP BY emp.managerId
    HAVING COUNT(emp.Id) >= 5
    );

-- without Gruping
SELECT manager.name
FROM Employee manager
WHERE (
    SELECT COUNT(emp.id)
    FROM Employee emp
    WHERE emp.managerId = manager.Id
    ) >= 5;
