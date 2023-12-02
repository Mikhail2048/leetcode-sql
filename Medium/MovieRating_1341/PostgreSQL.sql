(
    SELECT 
        MIN(u.name) AS results
    FROM users u INNER JOIN  ( 
        SELECT 
            user_id,
            COUNT(DISTINCT movie_id) as cnt
        FROM MovieRating 
        GROUP BY user_id
    ) t ON t.user_id = u.user_id
    GROUP BY t.cnt
    ORDER BY t.cnt DESC
    LIMIT 1
)
UNION ALL
(
    SELECT 
        MIN(m.title) AS results
    FROM movies m INNER JOIN ( 
        SELECT 
            movie_id,
            (SUM(rating)::NUMERIC)/COUNT(rating) as avg
        FROM movierating 
        WHERE created_at BETWEEN '2020-02-01'::DATE AND '2020-02-29'::DATE
        GROUP BY movie_id
    ) t ON t.movie_id = m.movie_id
    GROUP BY t.avg
    ORDER BY t.avg DESC
    LIMIT 1
)
