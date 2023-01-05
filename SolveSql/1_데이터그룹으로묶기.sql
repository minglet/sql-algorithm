select quartet, avg(x) as x_mean,
round(pow(stdev(x),2),2) as x_var,
round(avg(y),2) as y_mean,
round(pow(stdev(y),2), 2) as y_var
from points
group by quartet;

/*
- `quartet` - 콰르텟
- `x_mean` - `x` 평균
- `x_var` - `x` 표본 분산
- `y_mean` - `y` 평균
- `y_var` - `y` 표본 분산
*/