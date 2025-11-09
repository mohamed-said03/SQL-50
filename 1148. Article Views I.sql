/*
we can write order by author_id
or order by id (alias name)
or order by 1 (column order in the results table)
*/

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;