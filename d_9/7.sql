CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS numeric LANGUAGE sql AS $$
    SELECT MIN(value) FROM UNNEST(arr) AS value;
$$;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
