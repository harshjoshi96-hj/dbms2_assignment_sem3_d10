-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.19 Bank Branch Hierarchy - Nested Scope

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

<<bank>>
DECLARE
    v_bank           VARCHAR2(30) := 'LJ Bank';
    v_total_deposit  NUMBER := 0;
BEGIN
    <<branch>>
    DECLARE
        v_branch VARCHAR2(30) := 'Ahmedabad';
        v_dep    NUMBER := &roll_no * 1000;
    BEGIN
        bank.v_total_deposit := bank.v_total_deposit + v_dep;

        DECLARE
            v_token NUMBER := 1;
        BEGIN
            DBMS_OUTPUT.PUT_LINE(
                bank.v_bank || ' | ' || v_branch || ' | Token ' || v_token
            );
        END;

        -- Uncommenting the following line causes PLS-00201 because v_token
        -- is local to the inner block and is not visible here.
        -- DBMS_OUTPUT.PUT_LINE(v_token);
    END;

    DBMS_OUTPUT.PUT_LINE('Total Deposit: Rs.' || bank.v_total_deposit);
END bank;
/
