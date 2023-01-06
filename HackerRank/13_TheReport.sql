with pivot as (select s.name,
    (select grade from grades where (min_mark <= s.marks) AND (s.marks <= max_mark)) as grade,
    s.marks
from students s)

select
    (case when grade > 7 then name else null end),
    grade, marks
from pivot
order by grade DESC, name;