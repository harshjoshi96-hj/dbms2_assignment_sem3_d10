-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.6 Bank Interest Calculator - SI and CI

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '
ACCEPT birth_month NUMBER PROMPT 'Enter your birth month (1-12): '

DECLARE
    v_p       NUMBER := &roll_no * 1000;
    v_r       NUMBER := &birth_month * 0.5 + 4;
    v_t       NUMBER := 3;
    v_si      NUMBER;
    v_ci      NUMBER;
    v_si_amt  NUMBER;
    v_ci_amt  NUMBER;
    v_diff_pct NUMBER;
BEGIN
    v_si := v_p * v_r * v_t / 100;
    v_ci := v_p * POWER(1 + v_r / 100, v_t) - v_p;

    v_si_amt := v_p + v_si;
    v_ci_amt := v_p + v_ci;
    v_diff_pct := (v_ci - v_si) / v_si * 100;

    DBMS_OUTPUT.PUT_LINE('========== BANK INTEREST CALCULATOR ==========');
    DBMS_OUTPUT.PUT_LINE('Principal: Rs.' || TO_CHAR(v_p, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Rate: ' || v_r || '%');
    DBMS_OUTPUT.PUT_LINE('Years: ' || v_t);
    DBMS_OUTPUT.PUT_LINE('Simple Interest: Rs.' || TO_CHAR(v_si, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Simple Interest Amount: Rs.' || TO_CHAR(v_si_amt, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Compound Interest: Rs.' || TO_CHAR(v_ci, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('Compound Interest Amount: Rs.' || TO_CHAR(v_ci_amt, '99,99,999.00'));
    DBMS_OUTPUT.PUT_LINE('CI vs SI Difference: ' || ROUND(v_diff_pct, 2) || '%');

    IF v_ci > v_si * 1.10 THEN
        DBMS_OUTPUT.PUT_LINE('Tip: FD is better than savings account for this amount.');
    END IF;
END;
/
