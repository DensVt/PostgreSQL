SELECT pv.person_id, (SELECT COUNT(*) FROM person_visits WHERE person_id = pv.person_id) as count_of_visits
FROM person_visits pv
GROUP BY pv.person_id
ORDER BY count_of_visits DESC, pv.person_id ASC;
