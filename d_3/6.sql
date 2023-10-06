SELECT m1.pizza_name,
       p1.name AS pizzeria_name_1,
       m1.price
FROM menu m1
INNER JOIN pizzeria p1 ON m1.pizzeria_id = p1.id
WHERE EXISTS (
    SELECT 1
    FROM menu m2
    INNER JOIN pizzeria p2 ON m2.pizzeria_id = p2.id
    WHERE m1.pizza_name = m2.pizza_name
      AND m1.price = m2.price
      AND m1.pizzeria_id < m2.pizzeria_id
)
ORDER BY m1.pizza_name;
