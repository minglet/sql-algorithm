WITH PIVOT AS (SELECT *,
    (CASE
        WHEN operation = 'Buy' THEN price*(-1) ELSE price
    END) AS price_A
FROM Stocks)

SELECT P.stock_name, SUM(P.price_A) AS capital_gain_loss
FROM PIVOT P
GROUP BY P.stock_name;

-- 간결하게 정리
SELECT stock_name,
    SUM( -- SELECT를 빼고 바로 SUM으로 합계내준다.
        CASE
            WHEN operation = 'Buy' THEN price*(-1) ELSE price
        END) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name;