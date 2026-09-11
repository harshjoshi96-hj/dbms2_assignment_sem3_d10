SET SERVEROUTPUT ON;

DECLARE
    roll_no NUMBER := 20;
    table_no NUMBER := MOD(roll_no,9) + 2;
    height NUMBER := 5 + MOD(roll_no,5);
BEGIN
    DBMS_OUTPUT.PUT_LINE('===== PART A: TABLE OF ' || table_no || ' =====');
    FOR i IN 1..20 LOOP
        DBMS_OUTPUT.PUT_LINE(LPAD(table_no || ' x ' || i || ' = ' || table_no*i, 15));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART B: TABLES 2 TO 5 =====');
    FOR n IN 2..5 LOOP
        FOR i IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(LPAD(n || ' x ' || i || ' = ' || n*i, 15));
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('----------------');
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART C: STAR TRIANGLE =====');
    FOR i IN 1..height LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*', i*2-1, '*'));
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART D: NUMBER PYRAMID =====');
    FOR i IN 1..6 LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT(j);
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('===== PART E: REVERSE STAR TRIANGLE =====');
    FOR i IN REVERSE 1..height LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*', i*2-1, '*'));
    END LOOP;
END;
/