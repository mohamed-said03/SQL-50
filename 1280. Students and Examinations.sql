-- CROSS JOIN: Each student from the Students table takes every course from the Subjects table.
-- Count ex.student_id not st.students_id because NULLs are ignored in COUNT function => Count(NULL) = 0

SELECT st.student_id, st.student_name, sub.subject_name, Count(ex.student_id) AS attended_exams
FROM Students st
CROSS JOIN Subjects sub
LEFT OUTER JOIN Examinations ex
ON sub.subject_name = ex.subject_name AND st.student_id = ex.student_id
GROUP BY st.student_id, sub.subject_name
ORDER BY st.student_id, sub.subject_name;