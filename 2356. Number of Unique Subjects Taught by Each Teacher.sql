SELECT teacher_id, COUNT(DISTINCT dept_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
