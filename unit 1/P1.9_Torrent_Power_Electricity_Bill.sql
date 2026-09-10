-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.9 Torrent Power Electricity Bill

SET SERVEROUTPUT ON;
ACCEPT roll_no NUMBER PROMPT 'Enter your roll number: '

DECLARE
    v_name   VARCHAR2(50) := 'Harsh Joshi';
    v_units  NUMBER := &roll_no * 10 + 50;
    c_rate   CONSTANT NUMBER := 5;
    c_fixed  CONSTANT NUMBER := 70;
    v_energy NUMBER;
    v_total  NUMBER;
BEGIN
    v_energy := ROUND(v_units * c_rate, 2);
    v_total := ROUND(v_energy + c_fixed, 2);

    DBMS_OUTPUT.PUT_LINE('========== TORRENT POWER BILL ==========');
    DBMS_OUTPUT.PUT_LINE('Consumer Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Units Consumed: ' || v_units);
    DBMS_OUTPUT.PUT_LINE('Energy Charge: Rs.' || v_energy);
    DBMS_OUTPUT.PUT_LINE('Fixed Charge: Rs.' || c_fixed);
    DBMS_OUTPUT.PUT_LINE('Total: Rs.' || v_total);
END;
/
