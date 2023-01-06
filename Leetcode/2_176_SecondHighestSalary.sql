with pivot as (select salary
    from Employee
    order by salary desc
    limit 1,1)

select 
    ifnull(max(p.salary), null) as SecondHighestSalary
from pivot p;

--limit 1,1 => limit 시작 index, 개수
--ifnull(column명, null인 경우 대체할 값)

--다른 풀이
SELECT
    (SELECT Salary 
    FROM Employee
    ORDER BY Salary DESC
    LIMIT 1 OFFSET 1) AS SecondHighestSalary;

/*LIMIT는 몇 개 불러올건지, OFFSET은 어디부터 불러올건지
OFFSET 1 이라고 지정 했의 2번째순서부터 1개 인 200을 가져오게 됨 */

--또 다른 풀이 dense_rank
with pivot as (select salary, (dense_rank() over (order by salary desc))as ranking
    from Employee)

select 
    (case when max(p.salary) then p.salary else null end) as SecondHighestSalary
from pivot p
where p.ranking = 2;