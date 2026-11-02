-- Exercise 06 - b
-- Farmers of municipality 54518 without a registered email
SELECT
    T1.document_number AS document,
    T1.first_name AS first_name,
    T1.last_name AS last_name,
    T1.phone_number AS phone,
    T1.email AS email
FROM farm.farmers AS T1
WHERE T1.municipality_code = '54518'
    AND T1.email IS NULL
ORDER BY T1.last_name ASC, T1.first_name ASC;

/*
  document  |    first_name    |     last_name      |   phone    | email 
------------+------------------+--------------------+------------+-------
 768461420  | Marleny          | Agudelo Sandoval   | 3242280898 | 
 939635303  | Marleny          | Álvarez Correa     | 3232410671 | 
 302223305  | Camilo           | Arias Mora         | 3045535545 | 
 550696749  | Viviana          | Arias Ramírez      | 3204850778 | 
 797017145  | Isabella         | Barrera Cabrera    | 3041744702 | 
 483692716  | Ramiro           | Barrera Villamizar | 3056539829 | 
 718906996  | Nelson           | Bedoya Vélez       | 3194564518 | 
 21358854   | Manuela Yolanda  | Benavides Delgado  | 3229418470 | 
 737383707  | Yesenia          | Bermúdez Henao     | 3141005257 | 
 1015411133 | Santiago         | Bermúdez Ruiz      | 3003993000 | 
...

(65 rows)
*/
