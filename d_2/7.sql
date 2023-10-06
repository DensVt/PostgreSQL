SELECT p.name AS pizzeria_name
FROM person_visits pv
JOIN person per ON pv.person_id = per.id
JOIN pizzeria p ON pv.pizzeria_id = p.id
JOIN menu m ON p.id = m.pizzeria_id
WHERE per.name = 'Dmitriy' 
  AND pv.visit_date = '2022-01-08' 
  AND m.price < 800;
