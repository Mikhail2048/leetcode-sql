SELECT s.score, t.rank FROM Scores s
INNER JOIN (
    SELECT
        row_number() OVER () as rank,
        temp.s as score
    FROM (
        SELECT
            score as s
        FROM Scores
        GROUP BY score ORDER BY score DESC
    ) as temp
) t on t.score = s.score
ORDER BY s.score DESC ;
