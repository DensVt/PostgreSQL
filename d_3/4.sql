(SELECT p.name AS pizzeria_name
 FROM pizzeria p
 WHERE p.id IN (
    SELECT m.pizzeria_id
    FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN person pr ON pr.id = po.person_id
    WHERE pr.gender = 'female'
 )
 AND p.id NOT IN (
    SELECT m.pizzeria_id
    FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN person pr ON pr.id = po.person_id
    WHERE pr.gender = 'male'
 ))
UNION
(SELECT p.name AS pizzeria_name
 FROM pizzeria p
 WHERE p.id IN (
    SELECT m.pizzeria_id
    FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN person pr ON pr.id = po.person_id
    WHERE pr.gender = 'male'
 )
 AND p.id NOT IN (
    SELECT m.pizzeria_id
    FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN person pr ON pr.id = po.person_id
    WHERE pr.gender = 'female'
 ))
ORDER BY pizzeria_name;

