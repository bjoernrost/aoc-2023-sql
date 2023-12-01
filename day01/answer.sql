-- Put everything in a schema so its easy to reset. This also makes
-- this automatically reset so we can just run it many times.
DROP SCHEMA IF EXISTS day01 CASCADE;
CREATE SCHEMA day01;

CREATE TABLE day01.inputs (
  id    SERIAL,
  value VARCHAR
);

-- Use \COPY rather than COPY so its client-side in psql
\COPY day01.inputs (value) FROM 'input.txt' WITH (FORMAT 'text', NULL '');

-- replace all non-digits, then treat as ints and sum up

select sum(cast(left(regexp_replace(value, '[^\d]', '', 'g'),1) as int)*10+ cast(right(regexp_replace(value, '[^\d]', '', 'g'),1) as int)) from day01.inputs;
