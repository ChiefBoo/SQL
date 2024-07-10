(select pizzeria.name, count(*) as count, 'visit' as action_type from person_visits
join pizzeria on pizzeria.id = person_visits.pizzeria_id
group by pizzeria.name
order by 2 desc
limit 3)
union all
(select pizzeria.name, count(*) as count, 'order' as action_type from person_order
join menu on person_order.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
group by pizzeria.name
order by 2 desc
limit 3)
order by action_type asc, count desc;