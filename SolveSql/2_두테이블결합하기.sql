select distinct athlete_id
from events
inner join records
on events.id = records.event_id
where sport = 'Golf';

--한가지 유의점은 golf라는 종목에 다른 경기로 우승을 중복으로 할 수 있으니까 선수 id를 구하는 문제에서는 중복을 허용하면 안된다. (distinct)