--자세한건 notion
WITH PIVOT AS (SELECT *, ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY name) AS ranking
               FROM Occupations )

SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN NAME ELSE NULL END),
    MAX(CASE WHEN Occupation = 'Professor' THEN NAME ELSE NULL END),
    MAX(CASE WHEN Occupation = 'Singer' THEN NAME ELSE NULL END),
    MAX(CASE WHEN Occupation = 'Actor' THEN NAME ELSE NULL END)
FROM PIVOT
GROUP BY ranking;

--다른 풀이
SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN NAME ELSE NULL END),
    MAX(CASE WHEN Occupation = 'Professor' THEN NAME ELSE NULL END),
    MAX(CASE WHEN Occupation = 'Singer' THEN NAME ELSE NULL END),
    MAX(CASE WHEN Occupation = 'Actor' THEN NAME ELSE NULL END)
FROM (SELECT *, ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY name) AS ranking FROM Occupations) AS TEMP
GROUP BY ranking;