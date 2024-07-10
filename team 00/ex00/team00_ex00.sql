CREATE TABLE IF NOT EXISTS nodes (
    point1 CHAR NOT NULL,
    point2 CHAR NOT NULL,
    cost INT NOT NULL
);

INSERT INTO nodes (point1, point2, cost)
VALUES ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('c', 'd', 30),
    ('d', 'c', 30);

WITH RECURSIVE tours AS (
    SELECT point1, point2, point1 || ',' || point2 AS tour,
       cost AS total_cost FROM nodes WHERE point1 = 'a'
    UNION
    SELECT next.point1, next.point2, curr.tour || ',' || next.point2,
           curr.total_cost + next.cost AS total_cost FROM nodes next
    JOIN tours curr on next.point1 = curr.point2
    WHERE curr.tour NOT LIKE '%' || next.point2 || '%'
),
from_start_to_start AS (
    SELECT (total_cost +
            (SELECT cost FROM nodes WHERE point1 = 'a'
                                      AND point2 = tours.point2)) AS total_cost,
        '{' || tour || ',' || 'a' || '}' AS tour
    FROM tours
    WHERE length(tour) = 7
)

SELECT total_cost, tour FROM from_start_to_start
WHERE total_cost = (SELECT min(total_cost) FROM from_start_to_start)
ORDER BY 1,2;
