select missing_day::date
from (select generate_series('2022-01-01'::date,
                             '2022-01-10'::date,
                             '1 day'::interval) as missing_day) as missing_days
left join (select visit_date from person_visits where person_id = 1 or person_id = 2) as vis
on missing_days.missing_day = vis.visit_date
where vis.visit_date is null
order by missing_day;