select address, pizzeria.name, count(order_date) as count_of_orders from person_order
join person on person_order.person_id = person.id
join menu on person_order.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
group by address, pizzeria.name
order by address, pizzeria.name;