SELECT A.customer_number
FROM (
    SELECT customer_number, COUNT(order_number) as counting
    FROM Orders
    GROUP BY customer_number
    ORDER BY counting DESC
    LIMIT 1
) A;

-- 더 간결한 코드
SELECT customer_number 
FROM Orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC
LIMIT 1;

-- 다른 코드 : DENSE_RANK
WITH PIVOT AS (SELECT
    customer_number,
    DENSE_RANK() OVER(ORDER BY COUNT(order_number) DESC) --COUNT 그대로 넣어주면 
FROM Orders
GROUP BY customer_number)

/* GROUP BY는 COUNT에 필요한 것
GROUP BY를 없애고 PARTITIION BY로 대체하면 그건 또 다른 의미가 됨.
PARTITION BY를 넣어서 순위를 매기는 것은 각 customer_number에 따라 그 안에서 각각 순위를 매기는것
즉 각 customer_number에 속하는 order_number를 하나씩 카운트하는 의미
우리가 DENSE_RANK를 사용하는 이유는 COUNT하기 위함이 아닌, 이미 COUNT된 order_number의 개수를 다른 
customer_number와 비교하여 순위를 보기 위함 */

SELECT 
    P.customer_number
FROM PIVOT P
LIMIT 1;