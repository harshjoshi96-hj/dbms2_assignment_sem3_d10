-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.23 Debug Challenge - Fix the Broken Block

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    -- Bug 1: Assignment in PL/SQL uses :=, not =.
    -- Bug 2: VARCHAR2(5) is too small for the full name.
    v_name   VARCHAR2(50) := 'Harsh Joshi';

    -- Bug 3: A CONSTANT must be initialized at declaration.
    c_bonus_rate CONSTANT NUMBER := 0.1;

    -- Seed: salary = roll_no * 1000 + 20000.
    v_sal    NUMBER := &roll_no * 1000 + 20000;
    v_bonus  NUMBER;
    v_fname  employees.first_name%TYPE;
BEGIN
    v_bonus := v_sal * c_bonus_rate;

    -- Bug 4: A declaration must be terminated with a semicolon.
    -- Bug 5: A SELECT statement inside PL/SQL must use INTO.
    SELECT first_name
    INTO v_fname
    FROM employees
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE('Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Employee: ' || v_fname);
    DBMS_OUTPUT.PUT_LINE('Salary: Rs.' || v_sal);
    DBMS_OUTPUT.PUT_LINE('Bonus: Rs.' || v_bonus);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee 100 not found.');
END;
/

-- All five bugs from the question have been corrected and documented above.