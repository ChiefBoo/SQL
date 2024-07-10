create or replace function fnc_fibonacci(in pstop integer default 10)
returns setof integer as
$$
    with recursive fib(a, b) as (
        values (0,1)
        union all
        select greatest(a, b),
               a + b as a
        from fib where b < $1
    )
    select a from fib;
$$ language sql;

select * from fnc_fibonacci(100);

select * from fnc_fibonacci();