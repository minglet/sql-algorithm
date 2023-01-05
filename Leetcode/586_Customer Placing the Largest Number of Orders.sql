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