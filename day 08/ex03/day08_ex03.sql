-- Session#1
begin transaction isolation level read committed; -- start transaction in Session#1
-- Session#2
begin transaction isolation level read committed; -- start transaction in Session#2

-- Session#1
select * from pizzeria where name = 'Pizza Hut';

-- Session#2
update pizzeria set rating = 3.6 where name = 'Pizza Hut'; --rating update in session 2
commit; -- end of transaction block in Session#2

-- Session#1
select * from pizzeria where name = 'Pizza Hut';
COMMIT; -- end of transaction block in Session#1
select * from pizzeria where name = 'Pizza Hut';

-- Session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';