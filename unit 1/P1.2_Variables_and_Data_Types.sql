-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.2 Variables and Data Types

SET SERVEROUTPUT ON;
ACCEPT marks NUMBER PROMPT 'Enter your last semester marks out of 500: '

DECLARE
    v_name       VARCHAR2(50) := 'Harsh Joshi';
    v_marks      NUMBER(5,2) := &marks;
    v_percentage NUMBER(5,2);
    v_dob        DATE := SYSDATE;
    v_passed     BOOLEAN;
BEGIN
    v_percentage := ROUND((v_marks / 500) * 100, 2);
    v_passed := v_percentage >= 40;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || v_percentage || '%');
    DBMS_OUTPUT.PUT_LINE('Today: ' || TO_CHAR(v_dob, 'DD-MON-YYYY'));

    IF v_passed THEN
        DBMS_OUTPUT.PUT_LINE('Result: PASS');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Result: FAIL');
    END IF;
END;
/
