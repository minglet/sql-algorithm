-- test case는 통과, submit 실패
WITH Sales_id AS (
    SELECT product_id, sale_date
    FROM Sales
    WHERE product_id NOT IN (
        SELECT product_id
        FROM Sales
        WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31')
)

SELECT P.product_id, P.product_name
FROM Product P
INNER JOIN Sales_id S
ON P.product_id = S.product_id;

-- DISTINCT 붙여서 성공
WITH Sales_id AS (
    SELECT product_id, sale_date
    FROM Sales
    WHERE product_id NOT IN (
        SELECT product_id
        FROM Sales
        WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31')
)

SELECT DISTINCT(P.product_id), P.product_name -- DISTINCT 추가
FROM Product P
INNER JOIN Sales_id S
ON P.product_id = S.product_id;

/*
SELECT DISTINCT(P.product_id), DISTINCT(P.product_name) --이렇게 중복으로 사용 불가..
SELECT DISTINCT(P.product_id, P.product_name) --묶어서도 사용 불가
*/