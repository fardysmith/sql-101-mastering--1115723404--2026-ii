-- Exercise 09 - c
-- Rejected analyses of 2026-09-30 that have observations, most defects first
SELECT
    T1.analysis_id AS analysis,
    T1.delivery_id AS delivery,
    T1.defects_pct AS defects_pct,
    T1.cup_score AS cup_score,
    T1.is_accepted AS is_accepted,
    T1.observations AS observations
FROM buy.quality_analyses AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%'
    AND T1.is_accepted = FALSE
    AND T1.observations IS NOT NULL
ORDER BY T1.defects_pct DESC;

/*
      analysis      |      delivery       | defects_pct | cup_score | is_accepted |                observations                 
--------------------+---------------------+-------------+-----------+-------------+---------------------------------------------
 QA-20260930-000104 | DLV-20260930-000214 |       19.54 |     82.59 | f           | Olor a fermento en la muestra.
 QA-20260930-000068 | DLV-20260930-000165 |       17.29 |           | f           | Muestra tomada por duplicado.
 QA-20260930-000119 | DLV-20260930-000253 |       15.59 |     84.33 | f           | Exceso de impurezas y pasilla.
 QA-20260930-000086 | DLV-20260930-000147 |       13.21 |           | f           | Olor a fermento en la muestra.
 QA-20260930-000113 | DLV-20260930-000223 |       12.94 |     85.05 | f           | Café sobresecado, grano quebradizo.
 QA-20260930-000022 | DLV-20260930-000070 |        9.75 |           | f           | Café con humedad alta, requiere más secado.
 QA-20260930-000018 | DLV-20260930-000006 |        7.88 |     79.98 | f           | Café con humedad alta, requiere más secado.

(7 rows)
*/
