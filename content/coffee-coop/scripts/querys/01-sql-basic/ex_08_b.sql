-- Exercise 08 - b
-- Rejected deliveries of 2026-09-30 with the average kg per bag
SELECT
    T1.delivery_id AS delivery,
    T1.farm_id AS farm_id,
    T1.status AS status,
    T1.bag_count AS bag_count,
    T1.gross_weight_kg AS gross_weight_kg,
    T1.gross_weight_kg / T1.bag_count AS avg_kg_per_bag
FROM buy.deliveries AS T1
WHERE T1.delivery_id LIKE 'DLV-20260930-%'
    AND T1.status = 'rejected'
ORDER BY T1.delivered_at ASC;

/*
      delivery       | farm_id |  status  | bag_count | gross_weight_kg |   avg_kg_per_bag    
---------------------+---------+----------+-----------+-----------------+---------------------
 DLV-20260930-000006 |   58408 | rejected |         3 |          139.81 | 46.6033333333333333
 DLV-20260930-000070 |   69157 | rejected |         3 |          147.13 | 49.0433333333333333
 DLV-20260930-000083 |   66435 | rejected |         2 |           89.95 | 44.9750000000000000
 DLV-20260930-000109 |  216626 | rejected |         5 |          311.88 | 62.3760000000000000
 DLV-20260930-000147 |   77310 | rejected |         1 |           66.42 | 66.4200000000000000
 DLV-20260930-000165 |  107038 | rejected |         6 |          348.59 | 58.0983333333333333
 DLV-20260930-000214 |  223116 | rejected |         3 |          177.63 | 59.2100000000000000
 DLV-20260930-000223 |  216415 | rejected |         7 |          338.32 | 48.3314285714285714
 DLV-20260930-000253 |  143807 | rejected |         5 |          253.15 | 50.6300000000000000

(9 rows)
*/
