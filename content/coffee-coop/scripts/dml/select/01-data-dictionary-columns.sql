-- COFFEE COOP - DATA DICTIONARY: COLUMNS
-- RUN IN coffee_coop_db - cc_admin
SELECT
  c.table_schema,
  c.table_name,
  c.ordinal_position AS pos,
  c.column_name,
  c.data_type,
  c.character_maximum_length AS max_length,
  c.numeric_precision,
  c.numeric_scale,
  c.is_nullable,
  c.column_default,
  COALESCE((
    SELECT string_agg(DISTINCT CASE tc.constraint_type
             WHEN 'PRIMARY KEY' THEN 'PK'
             WHEN 'FOREIGN KEY' THEN 'FK'
             WHEN 'UNIQUE' THEN 'UQ' END, ', ')
    FROM information_schema.key_column_usage k
    JOIN information_schema.table_constraints tc
      ON tc.constraint_name = k.constraint_name
     AND tc.constraint_schema = k.constraint_schema
    WHERE k.table_schema = c.table_schema
      AND k.table_name = c.table_name
      AND k.column_name = c.column_name
      AND tc.constraint_type IN ('PRIMARY KEY', 'FOREIGN KEY', 'UNIQUE')
  ), '') AS keys,
  '' AS description
FROM information_schema.columns c
WHERE c.table_schema IN ('geo', 'farm', 'buy', 'pay')
ORDER BY c.table_schema, c.table_name, c.ordinal_position;