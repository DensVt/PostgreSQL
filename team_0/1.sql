WITH possible_tours AS ( 
    SELECT  
        a.cost + b.cost + c.cost + d.cost AS total_cost, 
        ARRAY[a.point1, a.point2, b.point2, c.point2, d.point2] AS tour 
    FROM cities a 
    JOIN cities b ON a.point2 = b.point1 AND b.point2 NOT IN (a.point1, a.point2) 
    JOIN cities c ON b.point2 = c.point1 AND c.point2 NOT IN (a.point1, a.point2, b.point2) 
    JOIN cities d ON c.point2 = d.point1 AND d.point2 = a.point1 
    WHERE a.point1 = 'a' 
) 
SELECT '"' || total_cost || '"' AS total_cost, 
       '"' || '{' || ARRAY_TO_STRING(tour, ',') || '}"' as tour
FROM possible_tours 
WHERE total_cost = (SELECT MIN(total_cost) FROM possible_tours)
   OR total_cost = (SELECT MAX(total_cost) FROM possible_tours)
ORDER BY total_cost, tour;
