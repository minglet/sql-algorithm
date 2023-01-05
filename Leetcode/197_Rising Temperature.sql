WITH PIVOT AS (SELECT *, DATE_ADD(recordDate, INTERVAL 1 DAY)
FROM Weather)

SELECT W.id
FROM PIVOT P
LEFT JOIN Weather W
ON P.nextDay = W.recordDate
WHERE P.temperature < W.temperature;


--다른 풀이 : DATEDIFF 사용
SELECT nextDay.id AS 'Id'
FROM weather nextDay
JOIN weather theDayBefore 
ON DATEDIFF(nextDay.recordDate, theDayBefore.recordDate) = 1
AND nextDay.Temperature > theDayBefore.Temperature;