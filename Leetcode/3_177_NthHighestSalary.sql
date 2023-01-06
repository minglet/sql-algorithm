CREATE FUNCTION getNthHighestSalary(N INT)
RETURNS INT
BEGIN 
    RETURN (
    SELECT IFNULL(max(R.salary),NULL) as getNthHighestSalary
    FROM
        (SELECT *, DENSE_RANK() OVER (ORDER BY salary DESC) AS RANKING
        FROM Employee) R
    WHERE R.RANKING = N
    );
END

--함수 선언하기
/*
CREATE FUNCTION [함수명] ([파라미터])
RETURNS [결과 데이터 타입]
AS
BEGIN
	[함수 내용]
	RETURN [결과값]
END
*/