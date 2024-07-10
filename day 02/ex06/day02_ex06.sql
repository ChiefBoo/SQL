select menu.pizza_name, pizzeria.name as pizzeria_name from menu
    join pizzeria on menu.pizzeria_id = pizzeria.id
    join person_order on menu.id = person_order.menu_id
    join person on person_order.person_id = person.id
where person.name = 'Denis' or person.name = 'Anna'
order by menu.pizza_name, pizzeria.name;