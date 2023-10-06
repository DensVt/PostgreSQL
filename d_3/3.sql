SELECT p.name AS pizzeria_name
FROM pizzeria p
WHERE (
    SELECT COUNT(*)
    FROM person_visits pv
    JOIN person pr ON pr.id = pv.person_id
    WHERE pv.pizzeria_id = p.id AND pr.gender = 'female'
) > (
    SELECT COUNT(*)
    FROM person_visits pv
    JOIN person pr ON pr.id = pv.person_id
    WHERE pv.pizzeria_id = p.id AND pr.gender = 'male'
)
UNION ALL
SELECT p.name AS pizzeria_name
FROM pizzeria p
WHERE (
    SELECT COUNT(*)
    FROM person_visits pv
    JOIN person pr ON pr.id = pv.person_id
    WHERE pv.pizzeria_id = p.id AND pr.gender = 'male'
) > (
    SELECT COUNT(*)
    FROM person_visits pv
    JOIN person pr ON pr.id = pv.person_id
    WHERE pv.pizzeria_id = p.id AND pr.gender = 'female'
)
ORDER BY pizzeria_name;
