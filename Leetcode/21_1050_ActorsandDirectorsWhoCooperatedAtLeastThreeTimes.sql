-- WITH 절 이용
WITH PIVOT AS (SELECT *, COUNT(actor_id) AS cnt
FROM ActorDirector
GROUP BY actor_id, director_id)

SELECT P.actor_id, P.director_id
FROM PIVOT P
WHERE P.cnt >= 3;

-- HAVING 절 이용
SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(actor_id) >= 3;