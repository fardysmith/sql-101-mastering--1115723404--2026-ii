-- COFFEE COOP - DATA DICTIONARY: CONSTRAINTS
-- RUN IN coffee_coop_db - cc_admin
SELECT
  n.nspname AS table_schema,
  cl.relname AS table_name,
  c.conname AS constraint_name,
  CASE c.contype
    WHEN 'p' THEN 'PRIMARY KEY'
    WHEN 'f' THEN 'FOREIGN KEY'
    WHEN 'u' THEN 'UNIQUE'
    WHEN 'c' THEN 'CHECK'
  END AS constraint_type,
  pg_get_constraintdef(c.oid) AS definition
FROM pg_constraint c
JOIN pg_class cl ON cl.oid = c.conrelid
JOIN pg_namespace n ON n.oid = cl.relnamespace
WHERE n.nspname IN ('geo', 'farm', 'buy', 'pay')
ORDER BY n.nspname, cl.relname, c.contype, c.conname;