-- case when 이용
WITH PIVOT AS (
    SELECT id,
    LAG(id, 1) OVER (ORDER BY id) AS odd_id,
    LEAD(id, 1) OVER (ORDER BY id) AS even_id,
    student
    FROM Seat
)

SELECT
	(CASE
		WHEN P.id % 2 = 1 THEN IFNULL(P.even_id, P.id)
		ELSE P.odd_id
		END) AS id,
    student
FROM PIVOT P
ORDER BY ID;

-- case when 없이 union
SELECT original.id
      ,changed.student
FROM seat original 
     LEFT JOIN seat changed 
                ON (original.id%2 = 1 AND original.id + 1 = changed.id) 
										-- 홀수인 경우 다음 행과 결합하게 하고, 
                OR (original.id%2 = 0 AND original.id - 1 = changed.id)
										-- 짝수인 경우 이전 행과 결합하게 조건을 설정하면 홀짝이 바뀐 결과가 나옴
WHERE changed.id IS NOT NULL -- 마지막 홀수행이 있을 경우 지워주는 역할  *

UNION

SELECT id
       ,student
FROM seat
WHERE id%2 = 1 
AND id = (SELECT MAX(id) FROM seat)
ORDER BY id;


-- LAG / LEAD 넣어서 풀이
SELECT 
     ID,
     IFNULL(CASE WHEN id % 2 != 0 
                 THEN lead(student) over ()  
                 ELSE lag(student) over ()
            END, student
            ) AS student
FROM seat;