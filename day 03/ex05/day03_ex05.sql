(select pizzeria.name as pizzeria_name from pizzeria
    join person_visits on pizzeria.id = person_visits.pizzeria_id
    join person on person_visits.person_id = person.id
where person.name = 'Andrey')
except
(select pizzeria.name as pizzeria_name from person_order
    join person on person_order.person_id = person.id
    join menu on person_order.menu_id = menu.id
    join pizzeria on menu.pizzeria_id = pizzeria.id
where person.name = 'Andrey')
order by pizzeria_name;





