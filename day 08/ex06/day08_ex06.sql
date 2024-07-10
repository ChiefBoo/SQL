-- Session#1
begin transaction isolation level repeatable read; -- start transaction in Session#1
-- Session#2
begin transaction isolation level repeatable read; -- start transaction in Session#2

-- Session#1
select sum(rating) from pizzeria;

-- Session#2
update pizzeria set rating = 5 where name = 'Pizza Hut'; --rating update in session 2
commit; -- end of transaction block in Session#2

-- Session#1
select sum(rating) from pizzeria;
COMMIT; -- end of transaction block in Session#1
select sum(rating) from pizzeria;

-- Session#2
select sum(rating) from pizzeria;