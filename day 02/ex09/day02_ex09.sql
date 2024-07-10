with fem as (
    select person.name, menu.pizza_name from person
    join person_order on person.id = person_order.person_id
    join menu on person_order.menu_id = menu.id
    where person.gender = 'female')
select name from fem
    where pizza_name = 'pepperoni pizza'
intersect
select name from fem
    where pizza_name = 'cheese pizza'
order by name;