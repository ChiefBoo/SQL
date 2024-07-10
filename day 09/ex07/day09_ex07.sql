create or replace function func_minimum(arr numeric[])
returns numeric as
$$
    select min(num) from unnest(arr) as num;
$$ language sql;

select func_minimum(variadic arr => array [10.0, -1.0, 5.0, 4.4]);