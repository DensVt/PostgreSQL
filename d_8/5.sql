-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT SUM(rating) FROM pizzeria;

-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
Commit;
SELECT SUM(rating) FROM pizzeria;

-- сессия 1
SELECT SUM(rating) FROM pizzeria;
Commit;
SELECT SUM(rating) FROM pizzeria;
