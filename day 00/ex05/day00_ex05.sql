select (select name
     from person
     where person.id = person_order.person_id) as name
from person_order
where (order_date = '2022-01-07') and (menu_id = 13 or menu_id = 14 or menu_id = 18);
