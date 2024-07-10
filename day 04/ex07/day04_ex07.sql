WITH pizzerias AS (SELECT pizzeria.name AS pizzeria_name,
                          menu.pizzeria_id FROM person
  JOIN person_visits ON person.id = person_visits.person_id
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
  JOIN menu ON pizzeria.id = menu.pizzeria_id
  WHERE person.name = 'Dmitriy' AND price < 800
    AND pizzeria.name NOT IN (SELECT pizzeria_name FROM mv_dmitriy_visits_and_eats))

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT MAX(pizzeria_id) FROM pizzerias),
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;