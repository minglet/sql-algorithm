WITH PIVOT AS (SELECT *,
    (CASE
        WHEN operation = 'Buy' THEN price*(-1) ELSE price
    END) AS price_A
FROM Stocks)

SELECT P.stock_name, SUM(P.price_A) AS capital_gain_loss
FROM PIVOT P
GROUP BY P.stock_name;