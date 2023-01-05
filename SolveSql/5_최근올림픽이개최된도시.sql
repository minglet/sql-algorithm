select year, upper(substring(city, 0, 4)) as city
from games
where year >= 2000
order by year desc;

/*
SUBSTRING( 문자열, 시작점, 끝점)
- 문자열을 슬라이싱 하는 것

UPPER( 문자열 )
- 문자열 대문자로 만들기
*/