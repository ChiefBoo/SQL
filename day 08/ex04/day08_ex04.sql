-- Session#1
begin transaction isolation level serializable; -- start transaction in Session#1
-- Session#2
begin transaction isolation level serializable; -- start transaction in Session#2

-- Session#1
select * from pizzeria where name = 'Pizza Hut';
-- Session#2
select * from pizzeria where name = 'Pizza Hut';

-- Session#2
update pizzeria set rating = 3.0 where name = 'Pizza Hut'; --rating update in session 2
commit; -- end of transaction block in Session#2

-- Session#1
select * from pizzeria where name = 'Pizza Hut'; --rating is 3.6
commit; -- end of transaction block in Session#1
select * from pizzeria where name = 'Pizza Hut'; --rating is 3.0

-- Session#2
select * from pizzeria where name = 'Pizza Hut';