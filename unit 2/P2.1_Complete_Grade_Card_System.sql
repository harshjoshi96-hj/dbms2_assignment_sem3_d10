SET SERVEROUTPUT ON;

DECLARE
    roll_no NUMBER := 20;
    sub1 NUMBER := 100;
    sub2 NUMBER := 100;
    sub3 NUMBER := 100;
    sub4 NUMBER := 100;
    sub5 NUMBER := 100;
    total_marks NUMBER;
    percentage NUMBER;
    grade VARCHAR2(5);
    result VARCHAR2(30);
    class_rank VARCHAR2(30);
BEGIN
    total_marks := sub1 + sub2 + sub3 + sub4 + sub5;
    percentage := total_marks / 5;

    IF sub1 < 35 OR sub2 < 35 OR sub3 < 35 OR sub4 < 35 OR sub5 < 35 THEN
        result := 'DETAINED';
        IF sub1 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 1'); END IF;
        IF sub2 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 2'); END IF;
        IF sub3 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 3'); END IF;
        IF sub4 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 4'); END IF;
        IF sub5 < 35 THEN DBMS_OUTPUT.PUT_LINE('Failed Subject: Subject 5'); END IF;
    ELSE
        result := 'PASS';
        IF percentage >= 75 THEN
            class_rank := 'Distinction';
        ELSIF percentage >= 60 THEN
            class_rank := 'First Class';
        ELSIF percentage >= 50 THEN
            class_rank := 'Second Class';
        ELSE
            class_rank := 'Pass';
        END IF;
    END IF;

    IF percentage >= 90 THEN grade := 'A+';
    ELSIF percentage >= 80 THEN grade := 'A';
    ELSIF percentage >= 70 THEN grade := 'B';
    ELSIF percentage >= 60 THEN grade := 'C';
    ELSIF percentage >= 50 THEN grade := 'D';
    ELSE grade := 'FAIL';
    END IF;

    DBMS_OUTPUT.PUT_LINE('===== GRADE CARD =====');
    DBMS_OUTPUT.PUT_LINE('Roll No: ' || roll_no);
    DBMS_OUTPUT.PUT_LINE('Subject 1: ' || sub1);
    DBMS_OUTPUT.PUT_LINE('Subject 2: ' || sub2);
    DBMS_OUTPUT.PUT_LINE('Subject 3: ' || sub3);
    DBMS_OUTPUT.PUT_LINE('Subject 4: ' || sub4);
    DBMS_OUTPUT.PUT_LINE('Subject 5: ' || sub5);
    DBMS_OUTPUT.PUT_LINE('Total: ' || total_marks || '/500');
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || ROUND(percentage,2) || '%');
    DBMS_OUTPUT.PUT_LINE('Grade: ' || grade);
    DBMS_OUTPUT.PUT_LINE('Result: ' || result);
    IF result = 'PASS' THEN DBMS_OUTPUT.PUT_LINE('Class: ' || class_rank); END IF;
END;
/