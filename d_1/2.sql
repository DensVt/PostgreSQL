SELECT sub.pizza_name
FROM (
    SELECT pizza_name, ROW_NUMBER() OVER (PARTITION BY pizza_name ORDER BY pizza_name DESC) as rn
    FROM menu
) AS sub
WHERE sub.rn = 1
ORDER BY sub.pizza_name DESC;
