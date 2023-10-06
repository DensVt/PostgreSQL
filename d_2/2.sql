WITH
  FilteredVisits AS (
    SELECT * FROM person_visits
    WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
  ),
  PersonWithVisits AS (
    SELECT COALESCE(p.name, '-') AS person_name, pv.visit_date, COALESCE(pz.name, '-') AS pizzeria_name
    FROM person p
    LEFT JOIN FilteredVisits pv ON p.id = pv.person_id
    LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
  ),
  PizzeriaWithVisits AS (
    SELECT '-' AS person_name, pv.visit_date, COALESCE(pz.name, '-') AS pizzeria_name
    FROM pizzeria pz
    LEFT JOIN FilteredVisits pv ON pz.id = pv.pizzeria_id
    WHERE pv.person_id IS NULL
  )
SELECT * FROM PersonWithVisits
UNION ALL
SELECT * FROM PizzeriaWithVisits
ORDER BY 1, 2, 3;
