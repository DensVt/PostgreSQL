SELECT 
    address,
    piz.name,
    COUNT(po.id) as count_of_orders
FROM person_order po
JOIN person per ON po.person_id = per.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria piz ON m.pizzeria_id = piz.id
GROUP BY address, piz.name
ORDER BY address, piz.name;
