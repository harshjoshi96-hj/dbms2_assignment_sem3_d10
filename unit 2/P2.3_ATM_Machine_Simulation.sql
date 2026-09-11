SET SERVEROUTPUT ON;

DECLARE
    roll_no NUMBER := 20;
    balance NUMBER := roll_no * 500 + 5000;
    opening_balance NUMBER := balance;
    v_choice NUMBER := 1;
    withdrawal NUMBER;
    txns NUMBER := 0;
    total_withdrawn NUMBER := 0;
    iteration NUMBER := 0;
BEGIN
    LOOP
        iteration := iteration + 1;

        IF iteration = 1 THEN
            v_choice := 1; withdrawal := 500;
        ELSIF iteration = 2 THEN
            v_choice := 1; withdrawal := 1000;
        ELSIF iteration = 3 THEN
            v_choice := 1; withdrawal := 500;
        ELSE
            v_choice := 3;
        END IF;

        EXIT WHEN v_choice = 3 OR balance = 0;

        IF withdrawal <= 0 THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Withdrawal must be greater than 0.');
        ELSIF MOD(withdrawal,100) <> 0 THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Withdrawal must be a multiple of 100.');
        ELSIF withdrawal > 10000 THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Maximum withdrawal per transaction is Rs.10000.');
        ELSIF withdrawal > balance THEN
            DBMS_OUTPUT.PUT_LINE('ERROR: Insufficient balance.');
        ELSE
            balance := balance - withdrawal;
            txns := txns + 1;
            total_withdrawn := total_withdrawn + withdrawal;
            DBMS_OUTPUT.PUT_LINE('--- TRANSACTION RECEIPT ---');
            DBMS_OUTPUT.PUT_LINE('Withdrawn: Rs.' || withdrawal);
            DBMS_OUTPUT.PUT_LINE('Remaining Balance: Rs.' || balance);
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== ATM FINAL SUMMARY =====');
    DBMS_OUTPUT.PUT_LINE('Opening Balance: Rs.' || opening_balance);
    DBMS_OUTPUT.PUT_LINE('Transactions Done: ' || txns);
    DBMS_OUTPUT.PUT_LINE('Total Withdrawn: Rs.' || total_withdrawn);
    DBMS_OUTPUT.PUT_LINE('Closing Balance: Rs.' || balance);
END;
/