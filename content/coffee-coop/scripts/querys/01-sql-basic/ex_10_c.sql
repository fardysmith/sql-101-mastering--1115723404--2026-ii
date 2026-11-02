-- Exercise 10 - c
-- Settlements of 2026-09-30 without deductions, with a gross value check
-- Explicacion: gross_amount es una columna GENERATED, es decir, la base de datos
-- la calcula sola como net_weight_kg * price_per_kg_applied. Como estoy repitiendo
-- esa misma multiplicacion en check_gross_cop, los dos valores coinciden siempre.
SELECT
    T1.settlement_id AS settlement,
    T1.net_weight_kg AS net_weight_kg,
    T1.price_per_kg_applied AS price_per_kg,
    T1.net_weight_kg * T1.price_per_kg_applied AS check_gross_cop,
    T1.gross_amount AS gross_cop,
    T1.deductions_amount AS deductions_cop
FROM pay.settlements AS T1
WHERE T1.settlement_id LIKE 'STL-20260930-%'
    AND T1.deductions_amount = 0
ORDER BY T1.settlement_id ASC;

/*
     settlement      | net_weight_kg | price_per_kg | check_gross_cop | gross_cop  | deductions_cop 
---------------------+---------------+--------------+-----------------+------------+----------------
 STL-20260930-000001 |        138.86 |     22176.00 |    3079359.3600 | 3079359.36 |           0.00
 STL-20260930-000005 |        158.94 |     21608.00 |    3434375.5200 | 3434375.52 |           0.00
 STL-20260930-000006 |        145.01 |     22847.00 |    3313043.4700 | 3313043.47 |           0.00
 STL-20260930-000008 |        152.95 |     22477.00 |    3437857.1500 | 3437857.15 |           0.00
 STL-20260930-000009 |         76.15 |     22169.00 |    1688169.3500 | 1688169.35 |           0.00
 STL-20260930-000011 |        211.64 |     22841.00 |    4834069.2400 | 4834069.24 |           0.00
 STL-20260930-000014 |         87.39 |     21960.00 |    1919084.4000 | 1919084.40 |           0.00
 STL-20260930-000015 |        115.02 |     20937.00 |    2408173.7400 | 2408173.74 |           0.00
 STL-20260930-000016 |        180.13 |     21779.00 |    3923051.2700 | 3923051.27 |           0.00
 STL-20260930-000018 |        216.32 |     21645.00 |    4682246.4000 | 4682246.40 |           0.00
...

(37 rows)
*/
