SELECT DISTINCT p.name
FROM person_order AS po
JOIN person AS p ON po.person_id = p.id
JOIN menu AS m ON m.id = po.menu_id
WHERE p.gender = 'male'
  AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
  AND p.address IN ('Moscow', 'Samara')
ORDER BY p.name DESC;

