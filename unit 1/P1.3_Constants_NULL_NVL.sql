-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.3 Constants, NULL and NVL

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    c_gst_rate CONSTANT NUMBER := 18;
    v_base_price NUMBER := (&roll_no * 500) + 1000;
    v_cgst       NUMBER;
    v_sgst       NUMBER;
    v_total      NUMBER;
    v_city       VARCHAR2(50) := NULL;
BEGIN
    v_cgst := v_base_price * 9 / 100;
    v_sgst := v_base_price * 9 / 100;
    v_total := v_base_price + v_cgst + v_sgst;

    DBMS_OUTPUT.PUT_LINE('Base Price: Rs.' || v_base_price);
    DBMS_OUTPUT.PUT_LINE('CGST (9%): Rs.' || v_cgst);
    DBMS_OUTPUT.PUT_LINE('SGST (9%): Rs.' || v_sgst);
    DBMS_OUTPUT.PUT_LINE('GST Rate: ' || c_gst_rate || '%');
    DBMS_OUTPUT.PUT_LINE('Total: Rs.' || v_total);

    -- NVL replaces NULL with the supplied replacement value.
    DBMS_OUTPUT.PUT_LINE('NVL City: ' || NVL(v_city, 'Ahmedabad'));

    -- NVL2 returns the second argument when value is NOT NULL,
    -- otherwise it returns the third argument.
    DBMS_OUTPUT.PUT_LINE(
        NVL2(v_city, 'City Known: ' || v_city, 'City Unknown')
    );
END;
/
