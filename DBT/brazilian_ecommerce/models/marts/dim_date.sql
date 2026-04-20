select
    dateadd(
        day,
        row_number() over (order by seq4()) - 1,
        '2016-01-01'
    ) as date_day
from table(generator(rowcount => 3650)) 