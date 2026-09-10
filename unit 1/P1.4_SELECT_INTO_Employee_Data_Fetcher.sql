-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.4 SELECT INTO - Employee Data Fetcher

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_id    NUMBER := 100 + MOD(&roll_no, 7);
    v_fname employees.first_name%TYPE;
    v_sal   employees.salary%TYPE;
BEGIN
    SELECT first_name, salary
    INTO v_fname, v_sal
    FROM employees
    WHERE employee_id = v_id;

    DBMS_OUTPUT.PUT_LINE(
        'Employee: ' || v_fname || ' earns Rs.' || v_sal || ' per month.'
    );
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found - check the ID.');
END;
/

-- Test a second time with an ID that does not exist, for example 9999.