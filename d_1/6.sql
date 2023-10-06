SELECT 
  intersected.action_date, 
  p.name AS person_name
FROM (
  SELECT order_date AS action_date, person_id
  FROM person_order
  INTERSECT
  SELECT visit_date AS action_date, person_id
  FROM person_visits
) AS intersected
JOIN person p ON intersected.person_id = p.id
ORDER BY intersected.action_date ASC, p.name DESC;
