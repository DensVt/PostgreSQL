CREATE VIEW v_price_with_discount AS
SELECT p.name AS person_name,
       m.pizza_name,
       m.price,
       ROUND(m.price * (1 - 0.1)) AS discount_price
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON m.id = po.menu_id
ORDER BY person_name, pizza_name;
