SELECT name AS Employee
FROM Employee E
WHERE salary > (SELECT salary FROM Employee WHERE id = E.managerId);