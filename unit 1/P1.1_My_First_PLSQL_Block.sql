-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.1 My First PL/SQL Block
-- Enter your roll number when prompted.

SET SERVEROUTPUT ON;

ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_message VARCHAR2(100) := 'Welcome to PL/SQL!';
    v_lucky   NUMBER;
BEGIN
    v_lucky := MOD(&roll_no, 7) + 1;

    DBMS_OUTPUT.PUT_LINE('Name: Harsh Joshi');
    DBMS_OUTPUT.PUT_LINE('Roll Number: ' || &roll_no);
    DBMS_OUTPUT.PUT_LINE('Message: ' || v_message);
    DBMS_OUTPUT.PUT_LINE('Lucky Number: ' || v_lucky);
END;
/

-- If SET SERVEROUTPUT ON is forgotten, DBMS_OUTPUT text may not be displayed.