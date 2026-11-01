-- Exercise 09 - c
-- Farms with at least 3 analyses and an average cup score >= 84
SELECT
    T3.farm_name AS farm,
    COUNT(T1.analysis_id) AS analyses_count,
    ROUND(AVG(T1.cup_score), 2) AS avg_cup_score
FROM buy.quality_analyses AS T1
INNER JOIN buy.deliveries AS T2
    ON T1.delivery_id = T2.delivery_id
INNER JOIN farm.farms AS T3
    ON T2.farm_id = T3.farm_id
GROUP BY T3.farm_id, T3.farm_name
HAVING COUNT(T1.analysis_id) >= 3
    AND AVG(T1.cup_score) >= 84
ORDER BY AVG(T1.cup_score) DESC;

/*
       farm       | analyses_count | avg_cup_score 
------------------+----------------+---------------
 El Higuerón      |              3 |         90.00
 La Loma          |              4 |         90.00
 Santa Clara      |              3 |         90.00
 La Floresta      |              6 |         90.00
 La Estrella      |              7 |         90.00
 El Caney         |              8 |         90.00
 Monteverde       |              4 |         90.00
 El Caney         |              3 |         90.00
 El Placer        |              5 |         90.00
 El Encanto       |              3 |         90.00
...

(25433 rows)
*/
