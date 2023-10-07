SELECT missing_date
FROM (
    SELECT generated_date AS missing_date
    FROM v_generated_dates
    EXCEPT
    SELECT visit_date
    FROM person_visits
) AS missing_dates
ORDER BY missing_date;
