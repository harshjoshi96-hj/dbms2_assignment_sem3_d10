-- PL/SQL Semester 3 - Unit 1
-- Student: Harsh Joshi
-- Question: P1.7 Nested Blocks - Scope Explorer

SET SERVEROUTPUT ON;

-- Replace the outer city with your home city if required.
<<outer>>
DECLARE
    v_city VARCHAR2(30) := 'Ahmedabad';
    v_num  NUMBER := 100;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Outer Block: City=' || v_city || ', Number=' || v_num);

    <<middle>>
    DECLARE
        v_city VARCHAR2(30) := 'Ahmedabad';
        v_num  NUMBER := 200;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Middle Block: City=' || v_city || ', Number=' || v_num);
        DBMS_OUTPUT.PUT_LINE('Access Outer City: ' || outer.v_city);

        DECLARE
            v_num NUMBER := 300;
        BEGIN
            DBMS_OUTPUT.PUT_LINE('Inner Block: City=' || middle.v_city || ', Number=' || v_num);
            DBMS_OUTPUT.PUT_LINE('Access Outer City from Inner: ' || outer.v_city);
        END;

        DBMS_OUTPUT.PUT_LINE('After Inner: City=' || v_city || ', Number=' || v_num);
    END;

    DBMS_OUTPUT.PUT_LINE('After Middle: City=' || v_city || ', Number=' || v_num);
END outer;
/

-- The middle v_city shadows outer v_city. The outer variable remains unchanged.