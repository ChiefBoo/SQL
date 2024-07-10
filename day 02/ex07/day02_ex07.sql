select pizzeria.name as pizzeria_name from pizzeria
    join menu on menu.pizzeria_id = pizzeria.id
    join person_visits on pizzeria.id = person_visits.pizzeria_id
    join person on person_visits.person_id = person.id
where person.name = 'Dmitriy' and menu.price < 800 and person_visits.visit_date = '2022-01-08';