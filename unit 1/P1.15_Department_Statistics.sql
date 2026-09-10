-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.15 Department Statistics with SELECT INTO

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_dept NUMBER := (MOD(&roll_no, 6) + 1) * 10;
    v_cnt  NUMBER;
    v_avg  NUMBER;
    v_max  NUMBER;
BEGIN
    SELECT COUNT(*), ROUND(AVG(salary), 2), MAX(salary)
    INTO v_cnt, v_avg, v_max
    FROM employees
    WHERE department_id = v_dept;

    DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_dept);
    DBMS_OUTPUT.PUT_LINE('Employee Count: ' || v_cnt);
    DBMS_OUTPUT.PUT_LINE('Average Salary: Rs.' || NVL(v_avg, 0));
    DBMS_OUTPUT.PUT_LINE('Maximum Salary: Rs.' || NVL(v_max, 0));
END;
/

-- COUNT(*) always returns one aggregate row, even when no employees match.
-- Therefore SELECT INTO does not raise NO_DATA_FOUND for COUNT(*).
