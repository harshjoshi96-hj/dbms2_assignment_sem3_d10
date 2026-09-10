-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.16 Department Lookup with %TYPE

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_id    NUMBER := ((&roll_no + 2) MOD 11 + 1) * 10;
    v_dname departments.department_name%TYPE;
    v_loc   departments.location_id%TYPE;
BEGIN
    SELECT department_name, location_id
    INTO v_dname, v_loc
    FROM departments
    WHERE department_id = v_id;

    DBMS_OUTPUT.PUT_LINE('Dept ' || v_id || ': ' || v_dname || ' at location ' || v_loc);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Department not found - check the ID.');
END;
/

-- %TYPE anchors the variable to the database column's datatype.
-- If the DBA changes department_name from VARCHAR2(30) to VARCHAR2(60),
-- this declaration automatically follows the column datatype, so no edit is needed.
