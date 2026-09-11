SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_book IS
        SELECT book_id, title FROM book;
BEGIN
    IF c_book%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor already open');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cursor is not open');
        OPEN c_book;
    END IF;

    IF c_book%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is now open');
    END IF;

    CLOSE c_book;

    IF NOT c_book%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is closed - ISOPEN = FALSE');
    END IF;
END;
/
