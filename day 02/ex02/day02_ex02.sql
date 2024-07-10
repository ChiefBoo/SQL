select coalesce(person.name, '-') as person_name,
       vis.visit_date as visit_date,
       coalesce(pizzeria.name, '-') as pizzeria_name from person
left join (select * from person_visits
               where person_visits.visit_date between '2022-01-01' and '2022-01-03') as vis
on vis.person_id = person.id
full join pizzeria on pizzeria.id = vis.pizzeria_id
order by person_name, visit_date, pizzeria_name;