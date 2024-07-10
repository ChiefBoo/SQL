COMMENT ON TABLE person_discounts
    IS 'This table contains information about discounts received by customers at pizzerias.';
COMMENT ON COLUMN person_discounts.id
    IS 'The unique identifier for the discount.';
COMMENT ON COLUMN person_discounts.person_id
    IS 'The identifier of the person who received the discount.';
COMMENT ON COLUMN person_discounts.pizzeria_id
    IS 'The identifier of the pizzeria providing the discount.';
COMMENT ON  COLUMN person_discounts.discount
    IS 'The value of the discount received by the person at the specified pizzeria.(0-100%)';
