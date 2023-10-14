-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- сессия 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT;

-- сессия 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- сессия 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- сессия 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
