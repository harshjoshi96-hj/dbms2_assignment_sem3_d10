-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.14 Mobile Recharge Receipt

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    c_gst   CONSTANT NUMBER := 18;
    v_index NUMBER := MOD(&roll_no, 4) + 1;
    v_plan  NUMBER;
    v_name  VARCHAR2(30);
    v_gst   NUMBER;
    v_total NUMBER;
BEGIN
    v_plan := CASE v_index
                  WHEN 1 THEN 199
                  WHEN 2 THEN 299
                  WHEN 3 THEN 399
                  ELSE 599
              END;

    v_name := CASE v_index
                  WHEN 1 THEN 'Jio/Airtel 199 Plan'
                  WHEN 2 THEN 'Jio/Airtel 299 Plan'
                  WHEN 3 THEN 'Jio/Airtel 399 Plan'
                  ELSE 'Jio/Airtel 599 Plan'
              END;

    v_gst := v_plan * c_gst / 100;
    v_total := v_plan + v_gst;

    DBMS_OUTPUT.PUT_LINE('================================');
    DBMS_OUTPUT.PUT_LINE('       MOBILE RECHARGE RECEIPT');
    DBMS_OUTPUT.PUT_LINE('================================');
    DBMS_OUTPUT.PUT_LINE(RPAD('Plan:', 18) || v_name);
    DBMS_OUTPUT.PUT_LINE(RPAD('Base Price:', 18) || TO_CHAR(v_plan, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('GST @18%:', 18) || TO_CHAR(v_gst, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Total:', 18) || TO_CHAR(v_total, '99,999.99'));
    DBMS_OUTPUT.PUT_LINE(RPAD('Valid Till:', 18) || TO_CHAR(SYSDATE + 28, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('================================');
END;
/
