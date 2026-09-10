-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.5 %ROWTYPE - Employee Profile Card

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_id   NUMBER := 100 + MOD(&roll_no, 9) + 1;
    v_emp  employees%ROWTYPE;
    v_yrs  NUMBER;
BEGIN
    SELECT *
    INTO v_emp
    FROM employees
    WHERE employee_id = v_id;

    v_yrs := TRUNC(MONTHS_BETWEEN(SYSDATE, v_emp.hire_date) / 12);

    DBMS_OUTPUT.PUT_LINE('========== EMPLOYEE PROFILE ==========');
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_emp.first_name || ' ' || v_emp.last_name);
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || v_emp.job_id);
    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_emp.department_id);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || TO_CHAR(v_emp.salary, 'Rs.99,999'));
    DBMS_OUTPUT.PUT_LINE('Hire Date: ' || TO_CHAR(v_emp.hire_date, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('Years of Experience: ' || v_yrs);

    IF v_yrs > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Senior Employee');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
END;
/
