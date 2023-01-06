-- 풀이 1
SELECT name
FROM Customer
WHERE IFNULL(referee_id, 0) != 2;
--- null값은 등호로 비교하지 못함

-- 다른 풀이
SELECT name
FROM customer
WHERE referee_id <> 2 OR referee_id IS NULL