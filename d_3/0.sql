SELECT m.pizza_name, m.price, p.name AS pizzeria_name, pv.visit_date
FROM menu m
JOIN pizzeria p ON m.pizzeria_id = p.id
JOIN person_visits pv ON pv.pizzeria_id = p.id
JOIN person pr ON pr.id = pv.person_id
WHERE m.price BETWEEN 800 AND 1000 AND pr.name = 'Kate'
ORDER BY m.pizza_name, m.price, p.name;
