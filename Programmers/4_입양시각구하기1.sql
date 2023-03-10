SELECT HOUR(DATETIME) AS HOUR, COUNT(*) AS COUNT
FROM ANIMAL_OUTS
GROUP BY HOUR
HAVING HOUR BETWEEN '9' AND '19'
ORDER BY HOUR;

/*HOUR 를 사용해서 DATETIME (2014-07-16 18:34:00)를 HOUR에 해당하는 부분만 추출해서 사용할 수 있음
그리고 SELECT에서 HOUR라고 이름을 지정했으면 GROUP BY HOUR로 HOUR별로 묶고, 
HAVING 절을 이용해서 HOUR의 범위를 지정해준다.
ORDER BY HOUR를 통해서 9부터 차례로 19시까지 정렬할 수 있다.*/