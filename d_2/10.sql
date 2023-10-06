SELECT A.name AS first_person, B.name AS second_person, A.address AS common_address
FROM person AS A, person AS B
WHERE A.id > B.id AND A.address = B.address
ORDER BY A.name, B.name, A.address;
