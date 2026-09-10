-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.20 Railway PNR and Ticket Generator

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '
ACCEPT dob CHAR PROMPT 'Enter DOB (DD-MM-YYYY): '

DECLARE
    v_name      VARCHAR2(100) := 'Harsh Joshi';
    v_roll      NUMBER := &roll_no;
    v_dob       DATE := TO_DATE('&dob', 'DD-MM-YYYY');
    v_pnr       VARCHAR2(30);
    v_jdate     DATE;
    v_fare      NUMBER;
    v_finalfare  NUMBER;
    v_age       NUMBER;
BEGIN
    v_pnr := 'GJ' || TO_CHAR(SYSDATE, 'YYMM') || LPAD(v_roll, 4, '0');
    v_jdate := SYSDATE + (MOD(v_roll, 30) + 1);
    v_fare := v_roll * 50 + 200;
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

    -- Senior citizens receive a 40% concession.
    IF v_age >= 60 THEN
        v_finalfare := v_fare * 0.60;
    ELSE
        v_finalfare := v_fare;
    END IF;

    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('          IRCTC STYLE TICKET');
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('Passenger:', 18) || v_name);
    DBMS_OUTPUT.PUT_LINE(RPAD('PNR:', 18) || v_pnr);
    DBMS_OUTPUT.PUT_LINE(RPAD('Journey Date:', 18) || TO_CHAR(v_jdate, 'Day, DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Age:', 18) || v_age);
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Fare:', 18) || 'Rs.' || TO_CHAR(v_fare, '99,999'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Final Fare:', 18) || 'Rs.' || TO_CHAR(v_finalfare, '99,999'));
    IF v_age >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('Senior Citizen Concession: 40%');
    END IF;
    DBMS_OUTPUT.PUT_LINE('==========================================');
END;
/

-- Test a second run with DOB 01-Jan-1960 to trigger senior concession.