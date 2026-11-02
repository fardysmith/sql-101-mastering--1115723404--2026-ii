-- Exercise 10 - b
-- Pending settlements generated on 2026-09-30, highest net value first
SELECT
    T1.settlement_id AS settlement,
    T1.delivery_id AS delivery,
    T1.status AS status,
    T1.net_amount AS net_cop
FROM pay.settlements AS T1
WHERE T1.settlement_id LIKE 'STL-20260930-%'
    AND T1.status = 'pending'
ORDER BY T1.net_amount DESC;

/*
     settlement      |      delivery       | status  |  net_cop   
---------------------+---------------------+---------+------------
 STL-20260930-000062 | DLV-20260929-000235 | pending | 6171557.18
 STL-20260930-000013 | DLV-20260928-000004 | pending | 5087855.55
 STL-20260930-000069 | DLV-20260930-000204 | pending | 5013706.66
 STL-20260930-000021 | DLV-20260928-000105 | pending | 4912541.01
 STL-20260930-000011 | DLV-20260927-000088 | pending | 4834069.24
 STL-20260930-000018 | DLV-20260927-000097 | pending | 4682246.40
 STL-20260930-000007 | DLV-20260927-000177 | pending | 4569033.82
 STL-20260930-000068 | DLV-20260928-000311 | pending | 4341052.80
 STL-20260930-000033 | DLV-20260929-000007 | pending | 4073521.56
 STL-20260930-000016 | DLV-20260928-000207 | pending | 3923051.27
...

(28 rows)
*/
