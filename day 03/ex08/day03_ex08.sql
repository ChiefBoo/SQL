insert into menu values ((select max(menu.id) + 1 from menu),
                         (select pizzeria.id from pizzeria where name = 'Dominos'),
                         'sicilian pizza', 900);