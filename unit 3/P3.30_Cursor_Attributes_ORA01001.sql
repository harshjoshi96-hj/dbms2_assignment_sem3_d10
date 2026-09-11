SET SERVEROUTPUT ON;

-- %FOUND, %NOTFOUND and %ROWCOUNT require the explicit cursor to be open.
-- Using them before OPEN raises ORA-01001: invalid cursor.
-- %ISOPEN is the exception: it can be checked before OPEN and returns FALSE.

DECLARE
    CURSOR c_book IS SELECT book_id FROM book;
BEGIN
    -- Example of the valid exception:
    IF c_book%ISOPEN THEN
        DBMS_OUTPUT.PUT_LINE('Cursor is open');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cursor is not open - %ISOPEN returns FALSE');
    END IF;

    -- Examples that raise ORA-01001 if uncommented before OPEN:
    -- DBMS_OUTPUT.PUT_LINE(c_book%FOUND);
    -- DBMS_OUTPUT.PUT_LINE(c_book%NOTFOUND);
    -- DBMS_OUTPUT.PUT_LINE(c_book%ROWCOUNT);

    OPEN c_book;
    DBMS_OUTPUT.PUT_LINE('After OPEN, ROWCOUNT = ' || c_book%ROWCOUNT);
    CLOSE c_book;
END;
/
