CREATE SEQUENCE IF NOT EXISTS seq_person_discounts START 1;

SELECT setval('seq_person_discounts',
              (SELECT COALESCE(MAX(id),0) + 1 FROM person_discounts), FALSE);

ALTER TABLE person_discounts
    ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');

-- INSERT INTO person_discounts (person_id, pizzeria_id, discount) VALUES (1, 5, 4);
-- SELECT * FROM person_discounts;
-- DELETE FROM person_discounts WHERE id > 13;