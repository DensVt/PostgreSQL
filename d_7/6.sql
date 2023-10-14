SELECT 
    p.name,
    COUNT(*) as count_of_orders,
    ROUND(AVG(m.price), 2) as average_price,
    MAX(m.price) as max_price,
    MIN(m.price) as min_price
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria p ON m.pizzeria_id = p.id
GROUP BY p.name
ORDER BY p.name;
