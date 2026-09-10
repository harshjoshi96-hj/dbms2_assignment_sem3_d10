-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.12 Result Card with BOOLEAN and NVL

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_m1     NUMBER := MOD(&roll_no, 30) + 60;
    v_m2     NUMBER := MOD(&roll_no, 30) + 60;
    v_m3     NUMBER := MOD(&roll_no, 30) + 60;
    v_m4     NUMBER := MOD(&roll_no, 30) + 60;
    v_m5     NUMBER := NULL; -- Student was absent.
    v_total  NUMBER;
    v_pct    NUMBER;
    v_passed BOOLEAN;
BEGIN
    v_total := v_m1 + v_m2 + v_m3 + v_m4 + NVL(v_m5, 0);
    v_pct := ROUND(v_total / 500 * 100, 2);
    v_passed := v_pct >= 40;

    DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_pct || '%');

    -- BOOLEAN cannot be passed directly to DBMS_OUTPUT.PUT_LINE.
    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;
END;
/
