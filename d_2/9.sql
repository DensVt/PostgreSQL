SELECT p.name
FROM person AS p
WHERE p.gender = 'female'
  AND EXISTS (
      SELECT 1 FROM person_order AS po
      JOIN menu AS m ON po.menu_id = m.id
      WHERE po.person_id = p.id AND m.pizza_name = 'pepperoni pizza'
  )
  AND EXISTS (
      SELECT 1 FROM person_order AS po
      JOIN menu AS m ON po.menu_id = m.id
      WHERE po.person_id = p.id AND m.pizza_name = 'cheese pizza'
  )
ORDER BY p.name ASC;
