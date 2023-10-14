WITH CombinedActions AS (
    SELECT p.name, COUNT(*) as count, 'order' as action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria p ON m.pizzeria_id = p.id
    GROUP BY p.name
    
    UNION ALL
    
    SELECT p.name, COUNT(*) as count, 'visit' as action_type
    FROM person_visits pv
    JOIN pizzeria p ON pv.pizzeria_id = p.id
    GROUP BY p.name
)

SELECT name, count, action_type
FROM (
    SELECT name, count, action_type,
           ROW_NUMBER() OVER (PARTITION BY action_type ORDER BY count DESC) as rn
    FROM CombinedActions
) AS RankedActions
WHERE rn <= 3
ORDER BY action_type ASC, count DESC;
