SELECT N,
    (CASE
     WHEN P IS NULL THEN 'Root'
     WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf' 
     ELSE 'Inner'
     END)
FROM BST
ORDER BY N;

--시도했지만 실패
SELECT N,
    (CASE
     WHEN P='null' THEN 'Root'
     WHEN N NOT IN (SELECT DISTINCT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf' 
     ELSE 'Inner'
     END)
FROM BST
ORDER BY N;

/*
- 처음에 시도했던 코드를 보면 P=Null값을 갖는 것에 대해서 =null이아니라 IS NULL로 표현했어야됐음
- 처음 시도했을때 root 값이 없는 것을 보고 root가 출력될수있게 is null로 조건 수정
*/