SELECT m.pizza_name, p.name AS pizzeria_name
FROM person_order po
JOIN person per ON po.person_id = per.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria p ON m.pizzeria_id = p.id
WHERE per.name IN ('Denis', 'Anna')
ORDER BY m.pizza_name, p.name;
