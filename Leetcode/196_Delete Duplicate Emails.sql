delete p1 from person p1,person p2 
where p1.email=p2.email and p1.id>p2.id;

--다른 풀이
DELETE FROM Person
WHERE id NOT IN ( 
    SELECT sub.id 
    FROM ( 
			SELECT min(id) as "id"  
            FROM Person
            GROUP BY email) sub  
);

/*
기본 문법 : DELETE FROM [테이블] WHERE [조건]
*/