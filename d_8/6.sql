-- сессия 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT SUM(rating) FROM pizzeria;

-- сессия 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- сессия 1
SELECT SUM(rating) FROM pizzeria;
Commit;
SELECT SUM(rating) FROM pizzeria;