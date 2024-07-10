-- Session#1
begin transaction isolation level repeatable read; -- start transaction in Session#1
-- Session#2
begin transaction isolation level repeatable read; -- start transaction in Session#2

-- Session#1
select * from pizzeria where name = 'Pizza Hut';
-- Session#2
select * from pizzeria where name = 'Pizza Hut';

-- Session#1
update pizzeria set rating = 4 where name = 'Pizza Hut'; --rating update in session 1
-- Session#2
update pizzeria set rating = 3.6 where name = 'Pizza Hut'; --rating update in session 2, waiting until commit in session 1. ERROR:  could not serialize access due to concurrent update

-- Session#1
commit; -- end of transaction block in Session#1
-- Session#2
commit; -- end of transaction block in Session#2 as ROLLBACK

-- Session#1
select * from pizzeria where name = 'Pizza Hut'; -- the result is 4
-- Session#2
select * from pizzeria where name = 'Pizza Hut'; -- the result is 4