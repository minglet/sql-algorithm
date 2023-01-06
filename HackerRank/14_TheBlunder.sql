select round(avg(salary)) - 
    (select round(avg(replace(salary, '0', '')))
    from employees)
from employees;

--replace : salary에서 ‘0’을 찾아서 ‘ ’으로 만들어주는 것