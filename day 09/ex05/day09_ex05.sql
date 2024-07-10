drop function fnc_person_female;
drop function fnc_person_male;

create or replace function fnc_person(pgender varchar default 'female')
returns table (id bigint, name varchar, age int, gender varchar, address varchar) as
$$
    select * from person where gender = pgender;
$$ language sql;

select * from fnc_person(pgender := 'male');

select * from fnc_person();