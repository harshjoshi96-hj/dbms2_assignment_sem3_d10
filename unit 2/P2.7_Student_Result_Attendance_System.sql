SET SERVEROUTPUT ON;

DECLARE
    roll_no NUMBER := 20;
    attendance_pct NUMBER := 100;
    theory_marks NUMBER := 70;
    practical_marks NUMBER := 30;
    assignment_marks NUMBER := 10;
    counted_assignment NUMBER;
    total_marks NUMBER;
    percentage NUMBER;
    grade VARCHAR2(5);
    result VARCHAR2(30);
    remark VARCHAR2(100);
BEGIN
    counted_assignment := LEAST(assignment_marks, 10);

    DBMS_OUTPUT.PUT_LINE('===== LJICA SEMESTER MARKSHEET =====');
    DBMS_OUTPUT.PUT_LINE('Roll No: ' || roll_no);
    DBMS_OUTPUT.PUT_LINE('Attendance: ' || attendance_pct || '%');
    DBMS_OUTPUT.PUT_LINE('Theory: ' || theory_marks || '/70');
    DBMS_OUTPUT.PUT_LINE('Practical: ' || practical_marks || '/30');
    DBMS_OUTPUT.PUT_LINE('Assignment Counted: ' || counted_assignment || '/10');

    IF attendance_pct < 40 THEN
        result := 'DETAINED';
        total_marks := 0;
        percentage := 0;
        grade := 'NA';
        remark := 'Detained due to low attendance.';
    ELSIF theory_marks < 28 THEN
        result := 'FAIL IN THEORY';
        total_marks := theory_marks + practical_marks + counted_assignment;
        percentage := total_marks / 1.1;
        grade := 'FAIL';
        remark := 'Improve theory performance.';
    ELSIF practical_marks < 12 THEN
        result := 'FAIL IN PRACTICAL';
        total_marks := theory_marks + practical_marks + counted_assignment;
        percentage := total_marks / 1.1;
        grade := 'FAIL';
        remark := 'Improve practical performance.';
    ELSE
        total_marks := theory_marks + practical_marks + counted_assignment;
        percentage := total_marks / 1.1;
        result := 'PASS';
        SELECT CASE
            WHEN percentage >= 90 THEN 'A+'
            WHEN percentage >= 80 THEN 'A'
            WHEN percentage >= 70 THEN 'B'
            WHEN percentage >= 60 THEN 'C'
            WHEN percentage >= 50 THEN 'D'
            ELSE 'FAIL'
        END INTO grade FROM dual;
        IF percentage >= 75 THEN remark := 'Excellent performance.';
        ELSIF percentage >= 60 THEN remark := 'Good performance.';
        ELSE remark := 'Keep improving.';
        END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Total: ' || total_marks);
    DBMS_OUTPUT.PUT_LINE('Percentage: ' || ROUND(percentage,2) || '%');
    DBMS_OUTPUT.PUT_LINE('Grade: ' || grade);
    DBMS_OUTPUT.PUT_LINE('Result: ' || result);
    DBMS_OUTPUT.PUT_LINE('Remark: ' || remark);
END;
/