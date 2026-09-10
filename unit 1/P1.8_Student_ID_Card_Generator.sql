-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.8 Student ID Card Generator

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '
ACCEPT dob CHAR PROMPT 'Enter DOB (DD-MM-YYYY): '

DECLARE
    v_name     VARCHAR2(100) := 'Harsh Joshi';
    v_roll     NUMBER := &roll_no;
    v_dob      DATE := TO_DATE('&dob', 'DD-MM-YYYY');
    v_upper    VARCHAR2(100);
    v_first    VARCHAR2(50);
    v_id       VARCHAR2(30);
    v_age      NUMBER;
    v_display  VARCHAR2(100);
BEGIN
    v_upper := UPPER(v_name);
    v_first := SUBSTR(v_upper, 1, INSTR(v_upper, ' ') - 1);
    v_id := 'LJICA' || TO_CHAR(v_dob, 'YYYY') || LPAD(v_roll, 3, '0');
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);
    v_display := v_upper;

    IF LENGTH(v_name) > 20 THEN
        v_display := SUBSTR(v_upper, 1, INSTR(v_upper, ' ')) ||
                     SUBSTR(v_upper, INSTR(v_upper, ' ') + 1, 1) || '.';
    END IF;

    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 38, '-') || '+');
    DBMS_OUTPUT.PUT_LINE('|' || LPAD('LJICA STUDENT ID CARD', 29) || '         |');
    DBMS_OUTPUT.PUT_LINE('|' || RPAD('Name: ' || v_display, 38) || '|');
    DBMS_OUTPUT.PUT_LINE('|' || RPAD('First Name: ' || v_first, 38) || '|');
    DBMS_OUTPUT.PUT_LINE('|' || RPAD('Roll No: ' || v_roll, 38) || '|');
    DBMS_OUTPUT.PUT_LINE('|' || RPAD('DOB: ' || TO_CHAR(v_dob, 'DD-MON-YYYY'), 38) || '|');
    DBMS_OUTPUT.PUT_LINE('|' || RPAD('Age: ' || v_age, 38) || '|');
    DBMS_OUTPUT.PUT_LINE('|' || RPAD('Student ID: ' || v_id, 38) || '|');
    DBMS_OUTPUT.PUT_LINE('+' || RPAD('-', 38, '-') || '+');
END;
/
