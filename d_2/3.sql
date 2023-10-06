WITH DateGenerator AS (
    SELECT generate_series(
        '2022-01-01'::date,
        '2022-01-10'::date,
        '1 day'::interval
    ) AS missing_date
), DistinctVisits AS (
    SELECT DISTINCT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
)
SELECT to_char(DateGenerator.missing_date, 'YYYY-MM-DD') AS missing_date
FROM DateGenerator
LEFT JOIN DistinctVisits ON DateGenerator.missing_date = DistinctVisits.visit_date
WHERE DistinctVisits.visit_date IS NULL
ORDER BY DateGenerator.missing_date ASC;
