-- Sub Query solution with Grouping
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y' OR employee_id IN(
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(employee_id) = 1);

-- the same solution but using Union instead of Sub Query
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(employee_id) = 1;

-- another sub query solution without Grouping (gave me bad performance)
SELECT employee_id, department_id
FROM Employee e
WHERE primary_flag = 'Y' OR (
    SELECT COUNT(esq.employee_id) 
    FROM Employee esq 
    WHERE esq.employee_id = e.employee_id) = 1;