WITH PIVOT AS (SELECT *
FROM Employee Emp
WHERE (Emp.departmentId, Emp.salary) IN (
    SELECT E.departmentId, MAX(E.salary)
    FROM Employee E
    GROUP BY E.departmentId    
))

SELECT D.name Department, P.name Employee, P.salary Salary
FROM PIVOT P 
INNER JOIN Department D
ON P.departmentId = D.id;