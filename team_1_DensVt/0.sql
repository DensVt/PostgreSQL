WITH AggregatedBalance AS (
    SELECT 
        user_id, 
        type, 
        currency_id, 
        SUM(money) as volume
    FROM balance 
    GROUP BY user_id, type, currency_id
),
LatestCurrencyRate AS (
    SELECT 
        id,
        name,
        rate_to_usd,
        ROW_NUMBER() OVER (PARTITION BY id ORDER BY updated DESC) as rn
    FROM currency
)
SELECT 
    COALESCE(u.name, 'not defined') as name,
    COALESCE(u.lastname, 'not defined') as lastname,
    ab.type,
    ab.volume,
    COALESCE(lcr.name, 'not defined') as currency_name,
    COALESCE(lcr.rate_to_usd, 1) as last_rate_to_usd,
    ab.volume * COALESCE(lcr.rate_to_usd, 1) as total_volume_in_usd
FROM AggregatedBalance ab
FULL JOIN "user" u ON u.id = ab.user_id
LEFT JOIN LatestCurrencyRate lcr ON lcr.id = ab.currency_id AND lcr.rn = 1
ORDER BY name DESC, lastname, type;
