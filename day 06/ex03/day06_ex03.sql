CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique
    ON person_discounts USING btree(person_id, pizzeria_id);

SET ENABLE_SEQSCAN = OFF;

EXPLAIN ANALYZE
SELECT *
FROM person_discounts WHERE person_id = 6;
