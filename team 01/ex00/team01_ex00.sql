with
    last_update_for_currency_rate as (
        select * from currency
        where updated in (select max(updated) from currency group by id)
    ),
    personal_transactions_info as (
        select distinct coalesce(u.name, 'not defined') as name,
        coalesce(u.lastname, 'not defined') as lastname,
        b.type,
        sum(b.money) over(partition by u.id, b.type) as volume,
        coalesce(c.name, 'not defined') as currency_name,
        coalesce(c.rate_to_usd, 1) as last_rate_to_usd
        from public.balance b
        left join public.user u on u.id = b.user_id
        left join last_update_for_currency_rate c on b.currency_id = c.id
    )
select name, lastname, type, volume, currency_name, last_rate_to_usd,
       volume * last_rate_to_usd as total_volume_in_usd
from personal_transactions_info
order by name desc, lastname, type;