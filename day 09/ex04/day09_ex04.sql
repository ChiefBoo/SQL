create or replace function fnc_person_female()
returns table (id bigint, name varchar, age int, gender varchar, address varchar) as
$$
    select * from person where gender = 'female';
$$ language sql;

create or replace function fnc_person_male()
returns table (id bigint, name varchar, age int, gender varchar, address varchar) as
$$
    select * from person where gender = 'male';
$$ language sql;

select * from fnc_person_male();

select * from fnc_person_female();

