CREATE TABLE person_discounts (
    id BIGINT PRIMARY KEY,
    person_id BIGINT REFERENCES person(id) ON DELETE CASCADE,
    pizzeria_id BIGINT REFERENCES pizzeria(id) ON DELETE CASCADE,
    discount NUMERIC CHECK (discount >= 0 AND discount <= 100),
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
);
