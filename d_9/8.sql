CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE (fibonacci_number INT) AS $$
DECLARE
    a INT := 0;
    b INT := 1;
    c INT;
BEGIN
    WHILE a < pstop LOOP
        fibonacci_number := a;
        RETURN QUERY SELECT fibonacci_number;
        c := a + b;
        a := b;
        b := c;
    END LOOP;
    RETURN;
END;
$$ LANGUAGE plpgsql;


select * from fnc_fibonacci(100);
select * from fnc_fibonacci();