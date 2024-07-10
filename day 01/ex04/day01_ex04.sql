select person_id from (select * from person_order where order_date = '2022-01-07') as ord
except all
select person_id from (select * from person_visits where visit_date = '2022-01-07') as vis;