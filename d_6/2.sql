SELECT 
    per.name, 
    men.pizza_name, 
    men.price, 
    CASE 
        WHEN (men.price - (men.price * pers_disc.discount / 100))::DECIMAL % 1 = 0
        THEN CAST(FLOOR(men.price - (men.price * pers_disc.discount / 100)) AS VARCHAR)
        ELSE TRIM(TRAILING '0' FROM TO_CHAR((men.price - (men.price * pers_disc.discount / 100))::DECIMAL, 'FM999999999.999999'))
    END AS discount_price,
    piz.name AS pizzeria_name
FROM 
    person_order po
INNER JOIN 
    menu men ON men.id = po.menu_id
INNER JOIN 
    person per ON per.id = po.person_id
INNER JOIN 
    person_discounts pers_disc ON per.id = pers_disc.person_id AND pers_disc.pizzeria_id = men.pizzeria_id
INNER JOIN 
    pizzeria piz ON men.pizzeria_id = piz.id
ORDER BY 
    1, 2;
