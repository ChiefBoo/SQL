select distinct name from person_order
join person on person_order.person_id = person.id
order by name;
