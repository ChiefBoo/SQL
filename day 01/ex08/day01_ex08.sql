select person_order.order_date,
       per.name || ' (age:' || per.age || ')' as person_information
from person_order natural join (select id as person_id, name, age from person) as per
order by person_order.order_date, person_information;