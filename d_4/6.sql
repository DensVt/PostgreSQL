CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT p.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria p ON m.pizzeria_id = p.id
INNER JOIN person_visits pv ON m.pizzeria_id = pv.pizzeria_id
INNER JOIN person per ON per.id = pv.person_id
WHERE m.price < 800 AND per.name = 'Dmitriy' AND pv.visit_date = '2022-01-08';
