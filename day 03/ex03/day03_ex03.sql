with visits as (
    select pizzeria.name as pizzeria_name, gender
    from person_visits pv
        join person on pv.person_id = person.id
        join pizzeria on pv.pizzeria_id = pizzeria.id
)
(select * from (select pizzeria_name from visits where gender = 'male') as vmen
except all
select * from (select pizzeria_name from visits where gender = 'female') as vwomen)
union all
(select * from (select pizzeria_name from visits where gender = 'female') as vwomen
except all
select * from (select pizzeria_name from visits where gender = 'male') as vmen)
order by pizzeria_name;