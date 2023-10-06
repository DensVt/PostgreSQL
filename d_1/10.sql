SELECT p.name AS person_name, m.pizza_name, pz.name AS pizzeria_name
FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS pz ON m.pizzeria_id = pz.id
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;

