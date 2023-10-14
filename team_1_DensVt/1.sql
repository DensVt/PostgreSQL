INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');

SELECT 
    COALESCE(u.name, 'is not defined') AS name,
    COALESCE(u.lastname, 'is not defined') AS lastname,
    COALESCE(c.name, 'is not defined') AS currency_name,
    COALESCE(
        b.money * COALESCE(
            (SELECT rate_to_usd
             FROM currency c1
             WHERE c1.id = b.currency_id AND c1.updated < b.updated
             ORDER BY c1.updated DESC
             LIMIT 1),
            (SELECT rate_to_usd
             FROM currency c1
             WHERE c1.id = b.currency_id AND c1.updated > b.updated
             ORDER BY c1.updated ASC
             LIMIT 1),
            1
        ),
        0
    )::real AS currency_in_usd
FROM balance b
JOIN (SELECT DISTINCT id, name FROM currency) c ON c.id = b.currency_id
LEFT JOIN "user" u ON u.id = b.user_id
ORDER BY name DESC, lastname, currency_name;
