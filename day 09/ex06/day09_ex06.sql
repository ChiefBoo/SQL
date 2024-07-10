create or replace function fnc_person_visits_and_eats_on_date(
        in pperson varchar default 'Dmitriy',
        in pprice numeric default 500,
        in pdate date default '2022-01-08'
)
returns table (pizzeria_name varchar) as
$$
    begin return query
    select distinct pizzeria.name from person
        join person_visits on person.id = person_visits.person_id
        join pizzeria on person_visits.pizzeria_id = pizzeria.id
        join menu on pizzeria.id = menu.pizzeria_id
        where visit_date = pdate and person.name = pperson and menu.price < pprice;
    end;
$$ language plpgsql;

select * from fnc_person_visits_and_eats_on_date(pprice := 800);

select * from fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');