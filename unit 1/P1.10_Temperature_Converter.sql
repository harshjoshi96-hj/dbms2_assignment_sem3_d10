-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.10 Temperature Converter

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_celsius NUMBER := MOD(&roll_no, 20) + 25;
    v_f       NUMBER;
    v_k       NUMBER;
    v_f2      NUMBER := 98.6;
    v_c2      NUMBER;
BEGIN
    v_f := ROUND(v_celsius * 9 / 5 + 32, 1);
    v_k := v_celsius + 273.15;
    v_c2 := (v_f2 - 32) * 5 / 9;

    DBMS_OUTPUT.PUT_LINE('Celsius: ' || v_celsius || ' C');
    DBMS_OUTPUT.PUT_LINE('Fahrenheit: ' || v_f || ' F');
    DBMS_OUTPUT.PUT_LINE('Kelvin: ' || v_k || ' K');
    DBMS_OUTPUT.PUT_LINE('Reverse Conversion: ' || v_f2 || ' F = ' || ROUND(v_c2, 1) || ' C');

    -- * and / have the same precedence and are evaluated left-to-right.
    -- Therefore C*9/5+32 and C*(9/5)+32 give the same mathematical result.
END;
/
