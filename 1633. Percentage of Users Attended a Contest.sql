SELECT contest_id, ROUND(COUNT(contest_id) / 
    (SELECT COUNT(user_id) FROM Users) 
    , 4) * 100 AS percentage 
FROM Register
GROUP BY contest_id
ORDER BY 2 DESC, contest_id;