SET SERVEROUTPUT ON;

-- The books priced above 600 are 7 rows in the supplied sample data.
-- The loop fetches once more after the 7th row; that unsuccessful FETCH
-- increments %ROWCOUNT to 8, sets %NOTFOUND to TRUE, and exits before printing.
-- Therefore the first PUT_LINE values are 1 through 7, and the final value is 8.

DECLARE
    CURSOR c IS SELECT title FROM book WHERE price > 600;
    v_title book.title%TYPE;
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO v_title;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(c%ROWCOUNT || ' : ' || v_title);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Final ROWCOUNT = ' || c%ROWCOUNT);
    CLOSE c;
END;
/
