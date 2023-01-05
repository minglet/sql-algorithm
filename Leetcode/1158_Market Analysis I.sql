SELECT 
    U.user_id as buyer_id, -- user_id
    U.join_date, 
		-- COUNT 집계함수가 2019년도가 아닌것은 집계하지 못하도록 NULL값으로 치환하여 집계함 
    COUNT(IF(YEAR(O.order_date)!='2019',null, O.order_date)) AS orders_in_2019
FROM Orders O
RIGHT JOIN Users U
ON O.buyer_id = U.user_id
GROUP BY U.user_id, U.join_date;