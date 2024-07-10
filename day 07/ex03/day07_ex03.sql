select name, sum(count) as total_count from ((select pizzeria.name, count(*) as count from person_visits
join pizzeria on pizzeria.id = person_visits.pizzeria_id
group by pizzeria.name)
union all
(select pizzeria.name, count(*) as count from person_order
join menu on person_order.menu_id = menu.id
join pizzeria on menu.pizzeria_id = pizzeria.id
group by pizzeria.name)) as vis_n_ord
group by name
order by total_count desc , name asc;