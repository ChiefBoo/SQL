insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

with currency_gr as(
    select currency.id, currency.name from currency
    group by 1, 2
)

select
    coalesce(u.name, 'not defined') as name,
    coalesce(u.lastname, 'not defined') as lastname,
    currency_gr.name as currency_name,
    coalesce(
            (select rate_to_usd from currency c
             where b.currency_id = c.id and c.updated < b.updated
             order by c.updated desc limit 1),
            (select rate_to_usd from currency c
             where b.currency_id = c.id and c.updated > b.updated
             order by c.updated limit 1)
            ) * b.money as currency_in_usd
from balance b
join currency_gr on b.currency_id = currency_gr.id
left join "user" u on u.id = b.user_id
order by name desc, lastname, currency_name;