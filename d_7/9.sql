SELECT 
    address,
    CASE 
        WHEN (max(age) - min(age) / max(age::numeric)) % 1 = 0 THEN
            CAST(TRUNC(max(age) - min(age) / max(age::numeric)) AS VARCHAR)
        ELSE
            CAST(ROUND((max(age) - min(age) / max(age::numeric)), 2) AS VARCHAR)
    END as formula,
    CASE 
        WHEN avg(age) % 1 = 0 THEN
            CAST(TRUNC(avg(age)) AS VARCHAR)
        ELSE
            CAST(ROUND(avg(age), 2) AS VARCHAR)
    END as "average",
    ROUND((max(age) - min(age) / max(age::numeric)), 2) > ROUND(avg(age), 2) as comparison
FROM person
GROUP BY address
ORDER BY address;
