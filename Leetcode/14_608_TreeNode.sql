SELECT id,
    (CASE 
    WHEN (T.p_id IS Null) THEN "Root"
    WHEN T.id NOT IN (SELECT p_id FROM Tree WHERE p_id IS NOT NULL) THEN "Leaf"
    ELSE "Inner"
    END) AS type
FROM Tree T;