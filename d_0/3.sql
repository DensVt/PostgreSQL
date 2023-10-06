SELECT 
DISTINCT person_id
from person_visits 
WHERE (visit_date BETWEEN '2022-01-06' AND '2022-01-09') OR pizzeria_id = 2 
order by person_id DESC
