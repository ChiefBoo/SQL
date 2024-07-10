select menu.id as menu_id from menu
where menu.id not in (select menu_id from person_order)
order by menu_id;
