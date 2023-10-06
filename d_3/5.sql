SELECT p.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria p ON pv.pizzeria_id = p.id
LEFT JOIN (
    SELECT po.person_id, m.pizzeria_id
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
) AS po_sub ON pv.person_id = po_sub.person_id AND pv.pizzeria_id = po_sub.pizzeria_id
JOIN person pr ON pv.person_id = pr.id
WHERE pr.name = 'Andrey' AND po_sub.pizzeria_id IS NULL
ORDER BY p.name;
