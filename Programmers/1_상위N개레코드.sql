-- WHERE 문을 활용
SELECT NAME
FROM ANIMAL_INS
WHERE DATETIME = (SELECT MIN(DATETIME) FROM ANIMAL_INS);

-- ORDER BY와 LIMIT을 활용
SELECT NAME
FROM ANIMAL_INS
ORDER BY DATETIME
LIMIT 1;