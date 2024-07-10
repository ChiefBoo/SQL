SELECT person.name, pizza_name, price,
       price * (100 - discount) / 100 AS discount_price,
       pizzeria.name AS pizzeria_name FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
JOIN person_discounts ON person.id = person_discounts.person_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
                     AND person_discounts.pizzeria_id = pizzeria.id
ORDER BY 1,2;