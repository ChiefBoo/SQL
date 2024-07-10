--Session #1
begin;  -- start transaction block
update pizzeria set rating = 5 where name = 'Pizza Hut';  -- rating update
select * from pizzeria; -- check update

--Session #2
select * from pizzeria; -- check no changes in session #2

--Session #1
commit; -- end of transaction block

--Session #2
select * from pizzeria; --check changes in session #2