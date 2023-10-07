SELECT m.pizza_name, p.name as pizzeria_name
FROM menu m
JOIN pizzeria p ON m.pizzeria_id = p.id;


-- SET enable_indexscan = ON;
-- SET enable_seqscan = OFF;
-- EXPLAIN ANALYZE
-- SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
-- LEFT JOIN pizzeria ON pizzeria.id = menu.pizzeria_id;