-- 3.7
INSERT INTO menu (id, pizza_name, price, pizzeria_id) VALUES (19, 'greek pizza', 800, 2);

-- 3.8
INSERT INTO menu (id, pizza_name, price, pizzeria_id)
VALUES (
    (SELECT MAX(id) + 1 FROM menu),
    'sicilian pizza',
    900,
    (SELECT id FROM pizzeria WHERE name = 'Dominos')
);

-- 3.9
INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
SELECT max(id) + 1, 
       (SELECT id FROM person WHERE name = 'Denis'), 
       (SELECT id FROM pizzeria WHERE name = 'Dominos'), 
       '2022-02-24'
FROM person_visits;

INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
SELECT max(id) + 1, 
       (SELECT id FROM person WHERE name = 'Irina'), 
       (SELECT id FROM pizzeria WHERE name = 'Dominos'), 
       '2022-02-24'
FROM person_visits;

--3.10
INSERT INTO person_order(id, person_id, menu_id, order_date)
VALUES ((SELECT id FROM person_order ORDER BY id DESC LIMIT 1) + 1, (SELECT id FROM person WHERE name = 'Denis'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        '2022-02-24'),
       ((SELECT id FROM person_order ORDER BY id DESC LIMIT 1) + 2, (SELECT id FROM person WHERE name = 'Irina'),
        (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
        '2022-02-24');

--3.11
UPDATE menu
SET price = price * 0.9
WHERE pizza_name = 'greek pizza';

--3.12
INSERT INTO person_order
SELECT
    GENERATE_SERIES(
        (SELECT MAX(id) + 1 FROM person_order),
        (SELECT MAX(id) FROM person_order) + (SELECT MAX(id) FROM person)),
    GENERATE_SERIES(
        (SELECT MIN(id) FROM person),
        (SELECT MAX(id) FROM person)),
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25';

--3.13
DELETE FROM person_order
WHERE order_date = '2022-02-25';

DELETE FROM menu
WHERE pizza_name = 'greek pizza';

--4.6
CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT p.name AS pizzeria_name
FROM menu m
INNER JOIN pizzeria p ON m.pizzeria_id = p.id
INNER JOIN person_visits pv ON m.pizzeria_id = pv.pizzeria_id
INNER JOIN person per ON per.id = pv.person_id
WHERE m.price < 800 AND per.name = 'Dmitriy' AND pv.visit_date = '2022-01-08';

--4.7
INSERT INTO person_visits(id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT COALESCE(MAX(id), 0) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (
      SELECT p.id
      FROM pizzeria p
      INNER JOIN menu m ON p.id = m.pizzeria_id
      WHERE m.price < 800 AND m.pizza_name != 'Papa Johns'
      ORDER BY p.id
      LIMIT 1
    ),
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
