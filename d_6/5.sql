COMMENT ON TABLE person_discounts IS 'Таблица для хранения информации о персональных скидках для клиентов в различных пиццериях.';

COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи о скидке.';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента, которому предоставлена скидка.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, предоставляющей скидку.';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки в процентах, предоставляемой клиенту в пиццерии.';
