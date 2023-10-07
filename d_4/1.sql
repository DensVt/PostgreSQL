SELECT name
FROM (
    SELECT name FROM v_persons_female
    UNION
    SELECT name FROM v_persons_male
) AS combined_persons
ORDER BY name;
