-- сессия 1
BEGIN;
UPDATE pizzeria SET rating = 4 WHERE name = 'Dominos';

-- сессия 2
BEGIN;
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
UPDATE pizzeria SET rating = 3 WHERE name = 'Dominos';

-- сессия 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
commit;
select sum(rating) from pizzeria;

-- сессия 2
commit;

