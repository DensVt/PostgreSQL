--сессия #1
BEGIN;

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

-- Проверяем, что видим изменения в сессии #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--сессия #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--сессия #1
COMMIT;

--сессия #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
