-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.17 Home Loan EMI Calculator

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_p           NUMBER := &roll_no * 10000 + 50000;
    v_rate        NUMBER := 9;
    v_years       NUMBER := 5;
    v_r           NUMBER;
    v_n           NUMBER;
    v_emi         NUMBER;
    v_total       NUMBER;
    v_interest    NUMBER;
    v_interest_pct NUMBER;
BEGIN
    v_r := v_rate / 12 / 100;
    v_n := v_years * 12;

    v_emi := ROUND(
        v_p * v_r * POWER(1 + v_r, v_n) /
        (POWER(1 + v_r, v_n) - 1), 2
    );

    v_total := ROUND(v_emi * v_n, 2);
    v_interest := ROUND(v_total - v_p, 2);
    v_interest_pct := ROUND((v_interest / v_total) * 100, 2);

    DBMS_OUTPUT.PUT_LINE('========== SBI HOME LOAN EMI ==========');
    DBMS_OUTPUT.PUT_LINE('Principal: Rs.' || TO_CHAR(v_p, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Annual Rate: ' || v_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Loan Period: ' || v_years || ' years');
    DBMS_OUTPUT.PUT_LINE('Monthly EMI: Rs.' || TO_CHAR(v_emi, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Total Payment: Rs.' || TO_CHAR(v_total, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Total Interest: Rs.' || TO_CHAR(v_interest, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Interest as % of Total Payment: ' || v_interest_pct || '%');
END;
/
