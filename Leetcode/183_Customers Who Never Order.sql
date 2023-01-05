SELECT C.name as Customers
FROM Customers C
LEFT JOIN Orders O
ON C.id = O.customerId
WHERE customerId IS NULL;

--NULL을 확인할때는 WHERE customerId = null로 하면 안됨