-- Session#1
begin; -- start transaction in Session#1
-- Session#2
begin; -- start transaction in Session#2

-- Session#1
update pizzeria set rating = 2 where id = 1;
-- Session#2
update pizzeria set rating = 3 where id = 2;

-- Session#1
update pizzeria set rating = 5 where id = 2;
-- Session#2
update pizzeria set rating = 3.5 where id = 1;

-- Session#1
commit; -- end of transaction block in Session#1

-- Session#2
commit; -- end of transaction block in Session#2

-- Session#1
select * from pizzeria where id = 1 or id = 2; -- check in Session#1
-- Session#2
select * from pizzeria where id = 1 or id = 2; -- check in Session#2