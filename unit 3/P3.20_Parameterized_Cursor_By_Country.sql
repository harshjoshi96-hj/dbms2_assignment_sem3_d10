SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_pub (p_country VARCHAR2) IS
        SELECT pub_name, city
        FROM publisher
        WHERE UPPER(country) = UPPER(p_country);
    v_found BOOLEAN := FALSE;
BEGIN
    FOR r IN c_pub('India') LOOP
        v_found := TRUE;
        DBMS_OUTPUT.PUT_LINE(r.pub_name || ' - ' || r.city);
    END LOOP;

    IF NOT v_found THEN
        DBMS_OUTPUT.PUT_LINE('No publisher found in India');
    END IF;

    -- %ROWCOUNT cannot be checked after a cursor FOR loop because the loop
    -- automatically closes its cursor when the loop ends.
END;
/
