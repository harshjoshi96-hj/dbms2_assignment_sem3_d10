-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.18 Messy Name Cleaner

SET SERVEROUTPUT ON;

DECLARE
    v_raw   VARCHAR2(100) := '  hArSh   jOSHI  ';
    v_clean VARCHAR2(100);
    v_first VARCHAR2(50);
    v_last  VARCHAR2(50);
    v_email VARCHAR2(150);
BEGIN
    v_clean := TRIM(v_raw);

    -- Repeated REPLACE removes multiple spaces. Applying it twice
    -- handles cases where three or more spaces are present.
    v_clean := REPLACE(REPLACE(v_clean, '  ', ' '), '  ', ' ');
    v_clean := INITCAP(v_clean);

    v_first := SUBSTR(v_clean, 1, INSTR(v_clean, ' ') - 1);
    v_last := SUBSTR(v_clean, INSTR(v_clean, ' ') + 1);
    v_email := LOWER(v_first || '.' || v_last || '@ljku.edu.in');

    DBMS_OUTPUT.PUT_LINE('Original Name: [' || v_raw || ']');
    DBMS_OUTPUT.PUT_LINE('Cleaned Name: ' || v_clean);
    DBMS_OUTPUT.PUT_LINE('First Name: ' || v_first);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_last);
    DBMS_OUTPUT.PUT_LINE('College Email: ' || v_email);
    DBMS_OUTPUT.PUT_LINE('Length Before: ' || LENGTH(v_raw));
    DBMS_OUTPUT.PUT_LINE('Length After: ' || LENGTH(v_clean));
END;
/

-- Replace v_raw with your own name typed with extra spaces and random case.