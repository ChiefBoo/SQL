with orders as (
    select pizzeria.name as pizzeria_name, gender
    from person_order po
        join person on po.person_id = person.id
        join menu on po.menu_id = menu.id
        join pizzeria on menu.pizzeria_id = pizzeria.id
)
(select * from (select pizzeria_name from orders where gender = 'male') as vmen
except
select * from (select pizzeria_name from orders where gender = 'female') as vwomen)
union
(select * from (select pizzeria_name from orders where gender = 'female') as vwomen
except
select * from (select pizzeria_name from orders where gender = 'male') as vmen)
order by pizzeria_name;